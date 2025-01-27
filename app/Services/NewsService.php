<?php

namespace App\Services;

use App\Models\NewsItem;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class NewsService
{
    protected $apiKey;

    public function __construct(array $apiKey)
    {
        $this->apiKey = $apiKey;
    }

    public function fetchNewsApiNews()
    {
        try {
            $selected_response = null;
            $source = null;
            $returned = Http::get('https://newsapi.org/v2/top-headlines?country=us&apiKey=' . $this->apiKey['newsapi']);
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
            $returned = Http::get('https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=' . $this->apiKey['nytimes']);
            // $returned = Http::get('https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=' . config('services.news.nytimes'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['response']['docs'];
            // $selected_response =  $response_to_json['results'];
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

            $returned = Http::get('https://content.guardianapis.com/search?api-key=' . $this->apiKey['guardian']);
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['response']['results'];
            $source = 'guardian';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {
            // Log the error and proceed
            Log::error('Failed to fetch Guardian news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }
    }

    public function formatApiResponse(array $data, string $source): void
    {
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
                        // 'author' => strtolower($item['byline']['original']),
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

        // $response = $this->get_all_news_items();

        // return $response
        //     ? ResponseHelper::success($response, 'Done') :
        //     ResponseHelper::error('something went wrong', [], 409);
    }


    public function create_news_item(array $newsItemDetails)
    {
        return NewsItem::create($newsItemDetails);
    }
}
