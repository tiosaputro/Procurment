<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailBentuRfs extends Model
{
    protected $fillable = [
        'rfsd_id',
        'rfs_id',
        'rfs_current',
        'rfs_next',
        'rfs_remark',
        'created_by',
        'creation_date',
        'last_updated_by',
        'last_update_date',
        'program_name'
    ];
    protected $table = 'detail_rfs_bentu';
    protected $primaryKey ='rfsd_id';
    public $incrementing = false;
    public $timestamps = false;

}
