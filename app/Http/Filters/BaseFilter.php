<?php

namespace App\Http\Filters;

use Illuminate\Database\Eloquent\Builder;

class BaseFilter
{
    protected $builder;

    public function __construct(Builder $builder)
    {
        $this->builder = $builder;
    }

    public function apply(array $filters): Builder
    {
        foreach ($filters as $filter => $value) {
            $method = 'filterBy' . ucfirst($filter);

            if (method_exists($this, $method)) {
                $this->$method($value);
            }
        }

        return $this->builder;
    }



    // Add more filter methods here as needed
}
