<?php

namespace App\Http\Requests\Api;

use App\Rules\MobileNumber;
use Illuminate\Foundation\Http\FormRequest;
class UserRequest extends FormRequest
{

    public function authorize()
    {
        return true;
    }


    public function rules()
    {
        switch ($this->route()->getActionMethod()) {
            case 'store':
                return $this->store();
            case 'update':
                return $this->update();
            default:
                return [];
        }
    }


    private function store(){
        return [
            'mobile' => ['required','min:8','max:40','unique:users,mobile' ,new MobileNumber],
            'password' => ['required','string' ,'min:8' ,'max:150'],
            'username' => ['required','string' ,'min:3' ,'max:150'],
        ];
    }


    private function update(){
        return [
            'mobile' => ['required','min:8','max:40','unique:users,mobile,' . $this->route('user')->id,new MobileNumber],
            'password' => ['sometimes','string' ,'min:8' ,'max:150'],
            'username' => ['required','string' ,'min:3' ,'max:150'],
        ];
    }

}
