<?php

namespace App\Traits;

use App\Http\Filters\BaseFilter;
use Illuminate\Database\Eloquent\Builder;

trait Filterable
{

    public function scopeFilter(Builder $builder, array $filters): Builder
    {
        $filterClass = $this->filterClass;
        return (new $filterClass($builder))->apply($filters);
    }


    public function scopeFinish(Builder $builder, bool $paginate = false)
    {

        return $paginate ? $builder->paginate() : $builder->get();
    }


}
