<?php

namespace App\Http\Filters;


class UserFilter extends BaseFilter
{

    protected function filterByName(string $name)
    {
        $this->builder->where('username', 'like', '%' . $name . '%');
    }

    protected function filterByMobile(string $mobile)
    {
        $this->builder->where('mobile', 'like', '%' . $mobile . '%');
    }

    // Add more filter methods here as needed
}
