<?php

namespace App\Http\Controllers\NewsItem;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\Source;
use App\Repositories\Interfaces\NewsItemRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NewsItemController extends Controller
{
    private NewsItemRepositoryInterface $newsItemRepository;


    public function __construct(NewsItemRepositoryInterface $newsItemRepository)
    {
        $this->newsItemRepository = $newsItemRepository;
    }

    public function getSources()
    {
        return $this->newsItemRepository->get_user_news_preferences();
    }

    public function getCategories()
    {
        $categories = $this->newsItemRepository->get_all_news_categories();

        return ResponseHelper::success($categories, 'All news categories.');

    }

    public function addNewsSource($name)
    {
        if (empty($name)) {

            return ResponseHelper::error('Invalid source name provided.');

        }

        $source = Source::where('identification', $name)->first();

        if ($source) {
            DB::table('source_user')->updateOrInsert(
                [
                    'user_id' => auth()->user()->id,
                    'source_id' => $source->id,
                ],
                [
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );

            return ResponseHelper::success([], 'Source added or updated successfully.');
        }

        return ResponseHelper::error('Source not found.');
    }



    public function getUserNewsPreferences() {
        return $this->newsItemRepository->get_user_news_preferences();
    }

    public function getUserNews(Request $request) {
        // try {
        //     // $returned = Http::get('https://api.nytimes.com/svc/topstories/v2/arts.json?api-key='.config('services.news.nytimes'));
        //     $returned = Http::get('https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key='.config('services.news.nytimes'));
        //     return $response_to_json =  $returned->json();
        //     $selected_response =  $response_to_json['results'];
        //     $source = 'nytimes';
        //     // return $this->formatApiResponse($selected_response, $source);
        // } catch (\Throwable $th) {
        //     throw $th;
        // }

        $category = $request->query('category') ?? null;

        $author = $request->query('author') ?? null;

        $response = $this->newsItemRepository->get_user_news($category, $author);

        return $response
            ? ResponseHelper::success($response, 'Done') :

            ResponseHelper::error('something went wrong', [], 409);
    }

}
