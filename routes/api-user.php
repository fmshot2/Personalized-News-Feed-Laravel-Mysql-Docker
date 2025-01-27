<?php

use App\Http\Controllers\User\AccountVerificationController;
use App\Http\Controllers\User\Auth\LoginController;
use App\Http\Controllers\User\Auth\RegisterController;
use App\Http\Controllers\User\Auth\ResetPasswordController;
use App\Http\Controllers\User\Auth\SocialiteController;
use App\Http\Controllers\User\DeleteAccountRequestController;
use App\Http\Controllers\User\EmailVerificationController;
use App\Http\Controllers\User\ProfileController;

use App\Http\Controllers\User\AboutController;
use App\Http\Controllers\User\EventController;
use App\Http\Controllers\User\TestimonyController;
use App\Http\Controllers\User\ServiceController;
use App\Http\Controllers\User\DetailController;
use App\Http\Controllers\User\StatisticController;
use App\Http\Controllers\User\ItemController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\SpeakerController;
use App\Http\Controllers\User\SermonController;
use App\Http\Controllers\User\TutorialController;
use App\Models\Sermon;
use Illuminate\Support\Facades\Route;

Route::get('/test', function () {
    return 'api-user route loaded';
});

Route::controller(RegisterController::class)->group(function () {
    Route::post('/verify-email', 'verifyEmail');
    Route::post('/register', 'register');
});

Route::controller(LoginController::class)->group(function () {
    Route::post('/login', 'login');
});

Route::controller(SocialiteController::class)->group(function () {
    Route::post('/oauth/get-redirect-url', 'oauthGetRedirectUrl'); // for google, apple and linkedin
    Route::post('/oauth/authenticate-with-jwt-code', 'oauthAuthenticateWithJwtCode'); // for google, apple and linkedin
});

// reset password
Route::controller(ResetPasswordController::class)->group(function () {
    Route::post('/reset-password/send-token', 'sendResetPasswordToken');
    Route::post('/reset-password/verify-token', 'verifyResetPasswordToken');
    Route::post('/reset-password', 'resetPassword');
});



Route::controller(AboutController::class)->group(function () {
    Route::get('about', [AboutController::class, 'index']);
    Route::get('about/{id}', [AboutController::class, 'show']);
    Route::post('about', [AboutController::class, 'store']);
    Route::put('about/{id}', [AboutController::class, 'update']);
    Route::delete('about/{id}', [AboutController::class, 'delete']);
    });

    Route::get('events', [EventController::class, 'index']);

    Route::get('event/{id}', [EventController::class, 'show']);
    Route::get('upcomingevents', [EventController::class, 'showUpcomingEvent']);
    Route::get('previousevents', [EventController::class, 'showPreviousEvent']);
    // Route::post('event', [EventController::class, 'store']);
    Route::put('event/{id}', [EventController::class, 'update']);
    Route::delete('event/{id}', [EventController::class, 'delete']);

    //item routes
    Route::get('item', [ItemController::class, 'index']);
    Route::get('item/{id}', [ItemController::class, 'show']);
    Route::post('event/{event_id}/item', [ItemController::class, 'store']);
    Route::put('item/{id}', [ItemController::class, 'update']);
    Route::delete('item/{id}', [ItemController::class, 'delete']);
    Route::get('event/{event_id}/items', [ItemController::class, 'get_items_for_event']);

    //item routes
    Route::get('speaker', [SpeakerController::class, 'index']);
    Route::get('speaker/{id}', [SpeakerController::class, 'show']);
    Route::post('speaker', [SpeakerController::class, 'store']);
    // Route::post('item/{item_id}/speaker', [SpeakerController::class, 'store']);
    Route::put('speaker/{id}', [SpeakerController::class, 'update']);
    Route::delete('speaker/{id}', [SpeakerController::class, 'delete']);
    Route::get('item/{item_id}/speakers', [SpeakerController::class, 'get_speaker_for_item']);


    Route::get('testimony', [TestimonyController::class, 'index']);
    Route::get('testimony/{id}', [TestimonyController::class, 'show']);
    Route::post('testimony', [TestimonyController::class, 'store']);
    Route::put('testimony/{id}', [TestimonyController::class, 'update']);
    Route::delete('testimony/{id}', [TestimonyController::class, 'delete']);

    //services routes
    Route::get('service', [ServiceController::class, 'index']);
    Route::get('service/{id}', [ServiceController::class, 'show']);
    Route::post('service', [ServiceController::class, 'store']);
    Route::put('service/{id}', [ServiceController::class, 'update']);
    Route::delete('service/{id}', [ServiceController::class, 'delete']);

    // system_config routes
    Route::get('system_config', [DetailController::class, 'index']);
    Route::post('system_config', [DetailController::class, 'store']);
    Route::put('system_config/{id}', [DetailController::class, 'update']);

    // system_config routes
    Route::get('sermons', [SermonController::class, 'index']);
    Route::post('sermons', [SermonController::class, 'store']);
    Route::put('sermons/{id}', [SermonController::class, 'update']);

// Authenticated user routes
Route::middleware('auth:sanctum')->group(function () {
    // Routes for verifying user account
    Route::controller(AccountVerificationController::class)->group(function () {
        Route::post('/account-verification/resend-code', 'resendAccountVerificationCode');
        Route::post('/account-verification/verify', 'verifyAccount');
    });

    // Routes for user profile activitied
    Route::controller(ProfileController::class)->group(function () {
        Route::get('/profile', 'getAuthUser');
        Route::post('/profile/update', 'update');
        Route::post('/profile/update-password', 'updatePassword');
        Route::post('/profile/logout', 'logout');
    });

    // Routes for verifying all emails
    Route::controller(EmailVerificationController::class)->group(function () {
        Route::get('/email-verification/status', 'checkEmailVerificationStatus');
        Route::post('/email-verification/send-token', 'sendEmailVerificationToken');
        Route::post('/email-verification/verify', 'verifyEmailVerificationToken');
    });

    // Routes for user delete account request
    Route::controller(DeleteAccountRequestController::class)->group(function () {
        Route::get('/delete-account-request/check', 'check');
        Route::post('/delete-account-request/create', 'create');
        Route::delete('/delete-account-request/delete', 'delete');
    });
    //
});
