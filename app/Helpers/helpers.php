<?php


if (!function_exists('generate_verification_code')) {
    function generate_verification_code($length = null)
    {

        $length = $length ?? config('constants.verification_code_length',6);
        $min_value = pow(10, $length - 1);
        $max_value = pow(10, $length) - 1;

        return rand($min_value, $max_value);
    }
}

