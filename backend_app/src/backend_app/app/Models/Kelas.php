<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class Kelas extends model
{

    protected $table = 'kelas';
    protected $guarded = [];
    public $incrementing = false;
    public $timestamps = false;

}
