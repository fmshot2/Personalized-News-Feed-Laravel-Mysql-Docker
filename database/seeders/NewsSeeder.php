<?php

namespace Database\Seeders;

use App\Services\NewsService;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Log;


class NewsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $newsService = app()->make(NewsService::class);

        // Fetch NewsAPI news
        try {
            $newsService->fetchNewsApiNews();
        } catch (\Throwable $th) {
            // Log the error and proceed
            Log::error('Failed to fetch NewsAPI news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }

        // Fetch Guardian news
        try {
            $newsService->fetchGuardianNews();
        } catch (\Throwable $th) {
            // Log the error and proceed
            Log::error('Failed to fetch Guardian news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }

        // Attempt to fetch NYTimes news
        try {
            $newsService->fetchNYTimesNews();
        } catch (\Throwable $th) {
            // Log the error and proceed
            Log::error('Failed to fetch NYTimes news: ' . $th->getMessage(), [
                'exception' => $th,
            ]);
        }
    }
}
