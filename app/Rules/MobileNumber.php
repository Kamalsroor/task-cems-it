<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class MobileNumber implements Rule
{
    public function passes($attribute, $value)
    {
        // Remove any non-numeric characters from the value
        $value = preg_replace('/[^0-9]/', '', $value);

        // Check if the value is a valid mobile number
        return preg_match('/^01[0-9]{9}$/', $value);
    }

    public function message()
    {
        return 'The :attribute must be a valid mobile number.';
    }
}
