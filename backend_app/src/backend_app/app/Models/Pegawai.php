<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;

class Pegawai extends model
{

    protected $table = 'pegawai';
    protected $guarded = [];
    public $incrementing = false;
    public $timestamps = false;

}
