<?php

namespace App\Exports;

use DB;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class RfsBentuDetailExport implements FromView, ShouldAutoSize
{
    /**
    * @return \Illuminate\Support\Collection
    */
    function __construct($code) {
        $this->code = $code;
    }
    public function view(): View
    {
        return view('excel/Laporan_Rfs_Bentu_Detail', [ 'dtl' => DB::table('detail_rfs_bentu as db')
        ->select('db.rfsd_id','db.rfs_id','db.rfs_next','db.rfs_current','db.rfs_remark','rb.rfs_name','rb.rfs_hps','rb.rfs_valuta_code','mu.usr_fullname',
        DB::raw("TO_CHAR(rb.rfs_date,' dd Mon YYYY') as rfs_date"),
        DB::raw("CASE WHEN rb.rfs_methode = '1' Then 'Open Tender' WHEN rb.rfs_methode = '2' Then 'Penunjukan Langsung' WHEN rb.rfs_methode = '3' Then 'Pengadaan Langsung' end as rfs_methode "))
        ->leftjoin('rfs_bentu as rb','db.rfs_id','rb.rfs_id')
        ->leftjoin('mng_user as mu','rb.created_by','mu.usr_name')
        ->where('db.rfs_id',$this->code)
        ->orderBy('db.rfsd_id','ASC')
        ->get()
        ]);
    }
}
