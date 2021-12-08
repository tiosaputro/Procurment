<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DetailBentuRfs;
use App\Rfs_bentu;
use Auth;
use carbon\Carbon;
use DB;
use Excel;
use App\Exports\RfsBentuDetailExport;

class DetailBentuRfsController extends Controller
{
    public function index($code)
    {
        $dtl = DetailBentuRfs::select('rfsd_id','rfs_current','rfs_remark','rfs_next')
        ->where('rfs_id',$code)
        ->orderBy('rfsd_id','ASC')
        ->get();
        $rfs = Rfs_bentu::select('rfs_id','rfs_name','rfs_hps','rfs_valuta_code','rfs_date','rfs_status',
                DB::raw("CASE WHEN rfs_methode = '1' Then 'Open Tender' WHEN rfs_methode = '2' Then 'Penunjukan Langsung' WHEN rfs_methode = '3' Then 'Pengadaan Langsung' end as rfs_methode "))
        ->where('rfs_id',$code)
        ->first();
        return response()->json(['dtl'=>$dtl,'rfs'=>$rfs]);
    }
    public function save(Request $request, $code)
    {
        $message = [
            'rfs_current.required' => 'Current Process Wajib Diisi',
            'rfs_next.required'=>'Next Process Wajib Diisi',
            'rfs_remark.required' => 'Remark Wajib Diisi'
        ];
        $request->validate([
            'rfs_current'=>'required',
            'rfs_next'=>'required',
            'rfs_remark'=>'required'
        ],$message);
        $date = Carbon::now();
        $newCreation =Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('Y-m-d H:i:s');
        $cekid = DetailBentuRfs::select('rfsd_id')->where('rfs_id',$code)->orderBy('rfs_id','DESC')->first();
        if(!isset($cekid)){
            $id = 1;
        }
        if(isset($cekid)){
            $id = $cekid->rfsd_id + 1;
        }
        $dtl = DetailBentuRfs::create([
            'rfsd_id' => $id,
            'rfs_id' => $code,
            'rfs_next'=>$request->rfs_next,
            'rfs_current'=>$request->rfs_current,
            'rfs_remark'=>$request->rfs_remark,
            'created_by'=>Auth::user()->usr_name,
            'creation_date'=>$newCreation,
            'program_name'=>"DetailBentuRfs_Save"
        ]);
        return response()->json([
            'success' => true,
            'message' => $dtl
        ],200);
    }
    public function edit($rfsd_id)
    {
        $dtl = DetailBentuRfs::select('rfs_next','rfs_current','rfs_remark')->where('rfsd_id',$rfsd_id)->first();
        return response()->json($dtl);
    }
    public function update(Request $request,$rfsd_id)
    {
        $message = [
            'rfs_current.required' => 'Current Process Wajib Diisi',
            'rfs_next.required'=>'Next Process Wajib Diisi',
            'rfs_remark.required' => 'Remark Wajib Diisi'
        ];
        $request->validate([
            'rfs_current'=>'required',
            'rfs_next'=>'required',
            'rfs_remark'=>'required'
        ],$message);
        $date = Carbon::now();
        $newUpdate =Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('Y-m-d H:i:s');
        $dtl = DetailBentuRfs::find($rfsd_id);
        $dtl->rfs_next = $request->rfs_next;
        $dtl->rfs_current = $request->rfs_current;
        $dtl->rfs_remark = $request->rfs_remark;
        $dtl->last_update_date = $newUpdate;
        $dtl->last_updated_by = Auth::user()->usr_name;
        $dtl->program_name = "DetailBentuRfs_Update";
        $dtl->save();
        return response()->json([
            'success' => true,
            'message' => $dtl
        ],200);
    }
    public function cetakExcel($code)
    {
        $date = Carbon::now();
        $newDate = Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('d F Y');
        return Excel::download(new RfsBentuDetailExport($code),'PROCURMENT STATUS REPORT '. $newDate .'.xlsx');
    }
    public function cetakPdf($code)
    {
        $dtl = DB::table('detail_rfs_bentu as db')
        ->select('db.rfsd_id','db.rfs_id','db.rfs_next','db.rfs_current','db.rfs_remark','rb.rfs_name','rb.rfs_hps','rb.rfs_valuta_code','mu.usr_fullname',
        DB::raw("TO_CHAR(rb.rfs_date,' dd Mon YYYY') as rfs_date"),
        DB::raw("CASE WHEN rb.rfs_methode = '1' Then 'Open Tender' WHEN rb.rfs_methode = '2' Then 'Penunjukan Langsung' WHEN rb.rfs_methode = '3' Then 'Pengadaan Langsung' end as rfs_methode "),
        DB::raw("CASE WHEN rb.rfs_status = '1' Then 'On Progress' WHEN rb.rfs_status = '2' Then 'Done' end as rfs_status "))
        ->leftjoin('rfs_bentu as rb','db.rfs_id','rb.rfs_id')
        ->leftjoin('mng_user as mu','rb.created_by','mu.usr_name')
        ->where('db.rfs_id',$code)
        ->orderBy('db.rfsd_id','ASC')
        ->get();
        return view('pdf/Laporan_Rfs_Bentu_Detail', compact('dtl'));
    }
}
