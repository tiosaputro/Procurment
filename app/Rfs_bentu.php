<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rfs_bentu extends Model
{
    protected $fillable = [
        'rfs_id',
        'rfs_name',
        'rfs_date',
        'rfs_hps',
        'rfs_valuta_code',
        'rfs_methode',
        'rfs_status',
        'creation_date',
        'created_by',
        'last_update_date',
        'last_updated_by',
        'program_name'
    ];
    protected $table= 'rfs_bentu';
    protected $primaryKey ='rfs_id';
    public $incrementing = false;
    public $timestamps = false;
}