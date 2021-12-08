<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rfm_bentu extends Model
{
    protected $fillable = [
        'rfm_id',
        'rfm_name',
        'rfm_date',
        'rfm_hps',
        'rfm_valuta_code',
        'rfm_methode',
        'rfm_status',
        'creation_date',
        'created_by',
        'last_update_date',
        'last_updated_by',
        'program_name'
    ];
    protected $table= 'rfm_bentu';
    protected $primaryKey ='rfm_id';
    public $incrementing = false;
    public $timestamps = false;
}