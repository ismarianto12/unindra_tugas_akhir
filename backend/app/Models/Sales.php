<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sales extends model
{

    protected $table = 'sales';
    protected $guarded = [];
    public $incrementing = false;
    public $timestamps = false;
}
