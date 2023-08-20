<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PeminjamanController extends Controller
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
        \DB::table('peminjaman')->insert([
            'nomorTelepon' => $this->request->nomorTelepon,
            'alamat' => $this->request->alamat,
            'namaBarang' => $this->request->namaBarang,
            'deskripsiBarang' => $this->request->deskripsiBarang,
            'tanggalPenitipan' => $this->request->tanggalPenitipan,
            'durasiPenitipan' => $this->request->durasiPenitipan,
            'biayaPenitipan' => $this->request->biayaPenitipan,
            'instruksiKhusus' => $this->request->instruksiKhusus,
            'id_user' => $this->request->id_user,

        ]);
        return response()->json(['status' => 'ok', 'msg' => 'data berhasil di simpan']);
        try {
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function pengembalian()
    {
        \DB::table('peminjaman')->update([
            'return' => 1,
        ])->save();
        return response()->json([
            'data berhasil',
        ]);

    }
    //
}
