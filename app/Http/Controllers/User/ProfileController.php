<?php

namespace App\Http\Controllers\User;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

/**
 * ProfileController
 */
class ProfileController extends Controller
{
    /**
     * logout
     *
     * @param  mixed $request
     * @return mixed
     */
    public function logout(Request $request)
    {
        $result = null;

        // Revoke the token that was used to authenticate the current request...
        $result = $request->user()->currentAccessToken()->delete();

        return $result
            ? ResponseHelper::success([], 'Logout was successful')
            : ResponseHelper::error('There was an error', [], 500);
    }
}
