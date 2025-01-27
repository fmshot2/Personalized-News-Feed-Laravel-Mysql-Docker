<?php

namespace App\Console\Commands;

use App\Models\NewsItem;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

use function Illuminate\Log\log;

class FetchNews extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:fetch-news';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Fetch latest news from apis';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // log('fetching news');
        Log::info('fetching news info top');
        try {
            $selected_response = null;
            $source = null;
            $returned = Http::get('https://newsapi.org/v2/top-headlines?country=us&apiKey=' . config('services.news.newsapi'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['articles'];
            $source = 'newsapi';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {
            // Log the error and proceed
            Log::error('Failed to fetch NewsAPI news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }
    }

    public function fetchNYTimesNews()
    {
        try {
            // $returned = Http::get('https://api.nytimes.com/svc/topstories/v2/arts.json?api-key='.config('services.newsapi.key'));
            $returned = Http::get('https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=' . config('services.news.nytimes'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['response']['docs'];
            $source = 'nytimes';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {

            Log::error('Failed to fetch NYTimes news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }
    }
    public function fetchGuardianNews()
    {
        try {

            $returned = Http::get('https://content.guardianapis.com/search?api-key=' . config('services.news.guardian'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['response']['results'];
            $source = 'guardian';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {

            Log::error('Failed to fetch Guardian news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }
    }

    public function formatApiResponse(array $data, string $source)
    {
        Log::info('formatting api response');
        NewsItem::query()->truncate();

        switch ($source) {
            case 'newsapi':
                collect($data)->map(function ($item) use ($source) {
                    $array_to_save =  [
                        'title' => $item['title'],
                        'content' => $item['description'],
                        'api_source' => 'newsapi',
                        'news_source' => $item['source']['name'],
                        'section' => array_key_exists('section', $item) ? $item['section'] : null,
                        'author' => strtolower($item['author']),
                        'url' => $item['url'],
                        'image_url' => $item['urlToImage'],
                        'published_at' => $item['publishedAt'],
                    ];
                    count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                });

                break;

            case 'nytimes':
                collect($data)->map(function ($item) use ($source) {

                    $array_to_save =  [
                        'title' => $item['headline']['main'],
                        'content' => $item['abstract'],
                        'published_at' => $item['pub_date'],
                        'api_source' => 'nytimes',
                        'news_source' => $source,
                        'section' => $item['section_name'],
                        'url' => $item['web_url'],
                        'author' => isset($item['byline']['original']) ? strtolower($item['byline']['original']) : null,
                        'image_url' => isset($item['multimedia'][0]['url'])
                            ? 'https://www.nytimes.com/' . $item['multimedia'][0]['url']
                            : null,
                    ];

                    count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                });

                break;
            case 'guardian':
                collect($data)->map(function ($item) use ($source) {

                    $array_to_save =  [
                        'title' => $item['webTitle'],
                        'content' => $item['webTitle'],
                        'published_at' => $item['webPublicationDate'],
                        'api_source' => 'guardian',
                        'news_source' => $source,
                        'section' => $item['sectionName'] ? strtolower($item['sectionName']) : null,
                        'url' => $item['webUrl'],
                    ];
                    count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                });

                break;

            default:
                $array_to_save =  [];
                count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                break;
        }

        Log::info('News saved from cron job successfully');
    }

    public function create_news_item(array $newsItemDetails)
    {
        return NewsItem::create($newsItemDetails);
    }

}
