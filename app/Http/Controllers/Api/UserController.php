<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\UserRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use App\Services\UserService;
use DB;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index(Request $request)
    {

        $users = User::filter($request->all())->finish($request->get('isPagnate',false));

        return response()->data('success' , UserResource::collection($users)->response()->getData(true)); // return all
    }

    public function show(User $user)
    {
        return response()->success('success' , new UserResource($user)); // return one user
    }

    public function store(UserRequest $request)
    {
        try {
            DB::beginTransaction();
            $user = $this->userService->createUser($request->validated());

            DB::commit();
            return response()->success('User Created successfully' , new UserResource($user)); // Created
        } catch (QueryException $e) {
            DB::rollback();
            return response()->error('Error creating user' , $e->getMessage(), 500); // Unprocessable Entity

        }
    }

    public function update(UserRequest $request, User $user)
    {
        try {
            DB::beginTransaction();
            $user = $this->userService->updateUser($user, $request->validated());

            DB::commit();
            return response()->success('User Updated successfully' , new UserResource($user)); // Updated
        } catch (QueryException $e) {
            DB::rollback();
            return response()->error('Error updating user' , $e->getMessage(), 500); // Unprocessable Entity
        }
    }

    public function destroy(User $user)
    {
        try {
            DB::beginTransaction();

            $this->userService->deleteUser($user);

            DB::commit();
            return response()->success('User deleted successfully'); // Delated
        } catch (QueryException $e) {
            DB::rollback();
            return response()->error('Error deleting user' , $e->getMessage(), 500); // Unprocessable Entity
        }
    }
}
