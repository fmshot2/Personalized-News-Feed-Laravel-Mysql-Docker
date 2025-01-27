<?php

namespace App\Providers;

use App\Repositories\Eloquents\UserRepository;
use App\Repositories\Eloquents\NewsItemRepository;
use App\Repositories\Interfaces\UserRepositoryInterface;
use App\Repositories\Interfaces\NewsItemRepositoryInterface;

use Illuminate\Support\ServiceProvider;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->bind(UserRepositoryInterface::class, UserRepository::class);
        $this->app->bind(NewsItemRepositoryInterface::class, NewsItemRepository::class);
     }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
