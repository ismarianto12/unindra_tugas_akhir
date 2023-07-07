<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Elearning extends model
{

    protected $table = 'elearning';
    protected $guarded = [];
    public $incrementing = false;
    public $timestamps = false;
}
