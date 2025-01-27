<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\App;
use App\Console\Commands\FetchNews;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
        then: function () {
            Route::middleware('api')
                ->prefix('api/v1/user')
                ->name('api.v1.user.')
                ->group(__DIR__ . '/../routes/api-user.php');
            Route::middleware('api')
                ->prefix('api/v1/admin')
                ->name('api.v1.admin.')
                ->group(__DIR__ . '/../routes/api-admin.php');
        },
    )
    ->withMiddleware(function (Middleware $middleware) {
        //
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })
    ->withCommands([
        FetchNews::class,
    ])
    ->create();
