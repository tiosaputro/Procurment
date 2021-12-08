<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Rfs_bentu;
use Auth;
use carbon\Carbon;
use DB;

class RfsBentuController extends Controller
{
    public function getAllRfs()
    {
        
    }
    public function getMyRfs($usr_name)
    {
        $rfs = Rfs_bentu::select('rfs_id','rfs_name','rfs_hps','rfs_valuta_code','rfs_date',
                DB::raw("CASE WHEN rfs_methode = '1' Then 'Open Tender' WHEN rfs_methode = '2' Then 'Penunjukan Langsung' WHEN rfs_methode = '3' Then 'Pengadaan Langsung' end as rfs_methode "),
                DB::raw("CASE WHEN rfs_status = '1' Then 'On Progress' WHEN rfs_status = '2' Then 'Done' end as rfs_status "))
        ->where('created_by',$usr_name)
        ->orderBy('rfs_id','ASC')
        ->get();
        return response()->json($rfs);
    }
    public function save(Request $request)
    {
        $message = [
            'rfs_name.required' => 'Judul Tender Wajib Diisi',
            'rfs_valuta_code.required'=>'Mata Uang Wajib Diisi',
            'rfs_methode.required' => 'Metode Wajib Diisi',
            'rfs_date.required' => 'Tanggal Wajib Diisi'
        ];
        $request->validate([
            'rfs_name'=>'required',
            'rfs_valuta_code'=>'required',
            'rfs_methode'=>'required',
            'rfs_date' => 'required'
        ],$message);
        $date = Carbon::now();
        $newCreation =Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('Y-m-d H:i:s');
        $newrfsdate = Carbon::parse($request->rfs_date)->copy()->tz('Asia/Jakarta')->format('Y-m-d');
        $cekid = Rfs_bentu::select('rfs_id')->orderBy('rfs_id','DESC')->first();
        if(!isset($cekid)){
            $id = 1;
        }
        if(isset($cekid)){
            $id = $cekid->rfs_id + 1;
        }
        $rfs = Rfs_bentu::create([
            'rfs_id' => $id,
            'rfs_name' => $request->rfs_name,
            'rfs_valuta_code' => $request->rfs_valuta_code,
            'rfs_hps' => $request->rfs_hps,
            'rfs_methode' => $request->rfs_methode,
            'rfs_status'=> '1',
            'rfs_date'=> $newrfsdate,
            'created_by' => Auth::user()->usr_name,
            'creation_date' => $newCreation,
            'program_name' => "RfsBentuController_Save"
        ]);
        return response()->json([
            'success' => true,
            'message' => $rfs
        ],200);
    }
    public function edit($code)
    {
        $rfs = Rfs_bentu::find($code);
        return response()->json($rfs);
    }
    public function update(Request $request,$code)
    {
        $message = [
            'rfs_name.required' => 'Judul Tender Wajib Diisi',
            'rfs_valuta_code.required'=>'Mata Uang Wajib Diisi',
            'rfs_methode.required' => 'Metode Wajib Diisi',
            'rfs_hps.required' => 'HPS/OE Wajib Diisi',
            'rfs_date.required' => 'Tanggal Wajib Diisi'
        ];
        $request->validate([
            'rfs_name'=>'required',
            'rfs_valuta_code'=>'required',
            'rfs_methode'=>'required',
            'rfs_hps' => 'required',
            'rfs_date' => 'required'
        ],$message);
        $rfs = Rfs_bentu::find($code);
        $date = Carbon::now();
        $newLastUpdate =Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('Y-m-d H:i:s');
        $newrfsdate = Carbon::parse($request->rfs_date)->copy()->tz('Asia/Jakarta')->format('Y-m-d');

        $rfs->rfs_name = $request->rfs_name;
        $rfs->rfs_date = $newrfsdate;
        $rfs->rfs_methode = $request->rfs_methode;
        $rfs->rfs_hps =  $request->rfs_hps;
        $rfs->rfs_valuta_code = $request->rfs_valuta_code;
        $rfs->last_updated_by = Auth::user()->usr_name;
        $rfs->last_update_date = $newLastUpdate;
        $rfs->program_name = "RfsBentuController@Update";
        $rfs->save();
        return response()->json([
            'success' => true,
            'message' => $rfs
        ],200);
    }
    public function changeStatus($rfs_id)
    {
        $date = Carbon::now();
        $newLastUpdate =Carbon::parse($date)->copy()->tz('Asia/Jakarta')->format('Y-m-d H:i:s');
        $rfs = Rfs_bentu::find($rfs_id);
        $rfs->rfs_status = "2";
        $rfs->last_updated_by = Auth::user()->usr_name;
        $rfs->last_update_date = $newLastUpdate;
        $rfs->program_name = "RfsBentuController@changeStatus";
        $rfs->save();
        return response()->json([
            'success' => true,
            'message' => 'Success Change'
        ],200);
    }
}
