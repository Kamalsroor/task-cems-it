<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserProfileResource;
use Illuminate\Http\Request;

class ProfileController extends Controller
{

    public function show(Request $request)
    {
        return response()->success('success' , new UserProfileResource($request->user())); // Created
    }


}
