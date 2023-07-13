<?php

namespace App\Http\Controllers;

use App\Models\Mapel;
use Illuminate\Http\Request;

class PenitipanController extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        $data = \DB::table('masterdata')->get();
        return response()->json($data);
    }
    public function save()
    {
        \DB::table('penitipan')->insert([
            'nomorTelepon' => $this->request->nomorTelepon,
            'alamat' => $this->request->alamat,
            'namaBarang' => $this->request->namaBarang,
            'deskripsiBarang' => $this->request->deskripsiBarang,
            'tanggalPenitipan' => $this->request->tanggalPenitipan,
            'durasiPenitipan' => $this->request->durasiPenitipan,
            'biayaPenitipan' => $this->request->biayaPenitipan,
            'instruksiKhusus' => $this->request->instruksiKhusus
        ]);
        return response()->json(['status' => 'ok', 'msg' => 'data berhasil di simpan']);
        try {
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function pengembalian()
    { 
        
    }
    //
}
