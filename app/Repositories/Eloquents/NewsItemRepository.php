<?php

namespace App\Repositories\Eloquents;

use App\Helpers\ResponseHelper;
use App\Models\Category;
use App\Repositories\Interfaces\NewsItemRepositoryInterface;
use App\Models\NewsItem;
use App\Models\Source;
use Illuminate\Support\Facades\Http;

class NewsItemRepository implements NewsItemRepositoryInterface
{
    public function get_all_news_categories()
    {
        $categoriesFromNewsItems = NewsItem::all()->pluck('section')->unique();

        $categoriesFromCategoriesTable =  Category::all()->pluck('name')->unique();

        return $categoriesFromNewsItems->merge($categoriesFromCategoriesTable);
    }

    public function get_all_news_items()
    {
        $newsItem = NewsItem::all();
        $sources = Source::all();

        if ($newsItem) {
            return ['newsItems' => $newsItem, 'sources' => $sources];
        } else {
            return false;
        }
    }

    public function get_news_items_by_id($newsItemId)
    {
        return NewsItem::findOrFail($newsItemId);
    }

    public function delete_news_item($newsItemId)
    {
        $response = NewsItem::findOrFail($newsItemId);
        $response->delete();
        return $response;
    }

    public function update_news_item($newsItemId, array $newDetails)
    {
        $response =  NewsItem::findOrFail($newsItemId);

        $response->update($newDetails);

        return $response;
    }

    public function get_user_news_preferences()
    {
        $response = request()->user()->sources()->pluck('name');

        return $response;
    }

    public function updateAvailableNewsSources()
    {
        try {
            $returned = Http::get('https://newsapi.org/v2/top-headlines/sources?apiKey=' . config('services.news.newsapi'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['sources'];
            $sourcesToInsert = [];
            foreach ($selected_response as $source) {
                $sourcesToInsert[] = [
                    'identification' => $source['id'] ?? null,
                    'name' => $source['name'] ?? null,
                    'description' => $source['description'] ?? null,
                    'url' => $source['url'] ?? null,
                    'category' => $source['category'] ?? null,
                    'language' => $source['language'] ?? null,
                    'country' => $source['country'] ?? null,
                    'created_at' => now(),
                    'updated_at' => now(),
                ];
            }

            Source::insert($sourcesToInsert);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function get_user_news(string $category = null, string $author = null)
    {
        $newsItem = NewsItem::count();

        // If there's no news item re-fetch from the apis
        if ($newsItem == 0) {

            $this->fetchNewsApiNews();

            $this->fetchGuardianNews();

            // $this->fetchNYTimesNews();
        }

        // If there's no saved news source from the user,
        // return all news items, else return news from user's prefered news spurce

        $user_news_sources = $this->get_user_news_preferences();

        $queried_news_item = NewsItem::where('created_at', '!=', null);

        if (count($user_news_sources) == 0) {

            $news = $this->finishNewsItemQuery($queried_news_item, $category, $author);
        } else {
            $queried_news_item = $queried_news_item->wherein('news_source', $user_news_sources);

            $news = $this->finishNewsItemQuery($queried_news_item, $category, $author);
        }

        // Update all new sources
        $this->updateAvailableNewsSources();

        $sources = Source::all();

        if ($news) {

            return ['newsItems' => $news, 'sources' => $sources];
        } else {

            return false;
        }
    }

    public function finishNewsItemQuery($queried_news_item, string $category = null, string $author = null)
    {
        // Initialize as empty collections
        $queried_categories_news_item = collect();
        $queried_author_news_item = collect();

        // Clone or reset the query for category
        if ($category != null) {
            $queried_categories_news_item = (clone $queried_news_item)
                ->where('section', $category)
                ->get();
        }

        // Clone or reset the query for author
        if ($author != null) {
            $queried_author_news_item = (clone $queried_news_item)
                ->where('author', 'like', '%' . $author . '%')
                ->get();
        }

        // If neither category nor author is present, return all items
        if (!$author && !$category) {
            return $queried_news_item->get();
        }

        // Merge both collections
        return $queried_categories_news_item->merge($queried_author_news_item);
    }

    public function fetchNewsApiNews()
    {
        try {
            $selected_response = null;
            $source = null;
            $returned = Http::get('https://newsapi.org/v2/top-headlines?country=us&apiKey=' . config('services.news.newsapi'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['articles'];
            $source = 'newsapi';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {
            // throw $th;
        }
    }

    public function fetchNYTimesNews()
    {
        try {
            // $returned = Http::get('https://api.nytimes.com/svc/topstories/v2/arts.json?api-key='.config('services.newsapi.key'));
            $returned = Http::get('https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=' . config('services.news.nytimes'));
            $response_to_json =  $returned->json();
            $selected_response =  $response_to_json['response']['docs'];
            // $selected_response =  $response_to_json['results'];
            $source = 'nytimes';
            return $this->formatApiResponse($selected_response, $source);
        } catch (\Throwable $th) {
            // throw $th;
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
            // throw $th;
        }
    }

    public function formatApiResponse(array $data, string $source)
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
                        // 'author' => $item['byline'],
                        'url' => $item['webUrl'],
                        // 'image_url' => $item['fields']['thumbnail'],
                    ];
                    count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                });

                break;

            default:
                $array_to_save =  [];
                count($array_to_save) ? $this->create_news_item($array_to_save) : $array_to_save;
                break;
        }

        $response = $this->get_all_news_items();

        return $response
            ? ResponseHelper::success($response, 'Done') :
            ResponseHelper::error('something went wrong', [], 409);
    }

    public function create_news_item(array $newsItemDetails)
    {
        return NewsItem::create($newsItemDetails);
    }
}
