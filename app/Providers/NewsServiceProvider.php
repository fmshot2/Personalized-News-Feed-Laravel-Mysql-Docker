<?php

namespace App\Providers;

use App\Services\NewsService;
use Illuminate\Support\ServiceProvider;

class NewsServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    // Binding in a ServiceProvider
    public function register()
    {
        $this->app->bind(NewsService::class, function () {
            return new NewsService(config('services.news'));
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
