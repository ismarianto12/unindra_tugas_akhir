<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use Illuminate\Http\Request;

class PegawaiController extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {
            $data = Pegawai::get();
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {

        try {
            $data = Pegawai::where('id', $id)->get();
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    // public function statuspeg()
    // {
    //     return [
    //         'value'=> 'honorer'
    //     ]
    // }

    public function store()
    {

        try {
            $Pegawai = new Pegawai;
            $Pegawai->nama = $this->request->nama;
            $Pegawai->nip = $this->request->nip;
            $Pegawai->jk = $this->request->jk;
            $Pegawai->alamat = $this->request->alamat;
            // $Pegawai->ttl = $this->request->ttl;
            // $Pegawai->kelas = $this->request->kelas;
            // $Pegawai->tahun_masuk = $this->request->tahun_masuk;
            // $Pegawai->nama_ibu = $this->request->nama_ibu;
            // $Pegawai->nama_ayah = $this->request->nama_ayah;
            $Pegawai->save();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di simpan',
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update($id)
    {
        try {
            $Pegawai = Pegawai::find($id);
            $Pegawai->nama  = $this->request->nama;
            $Pegawai->jk  = $this->request->jk;
            $Pegawai->alamat  = $this->request->alamat;
            $Pegawai->status_pegawai  = $this->request->status_pegawai;
            $Pegawai->nip  = $this->request->nip;
            $Pegawai->tahun_masuk  = $this->request->tahun_masuk;
            $Pegawai->save();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di simpan',
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function delete($id)
    {
        try {
            $Pegawai = Pegawai::find($id);
            $Pegawai->delete();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di hapus',
            ]);
        } catch (\Throwable $th) {
        }
    }

    //
    public function level_akses()
    {
        return [
            ['id' => 'admin', 'label' => 'Administrator'],
            ['id' => 'tata usaha', 'label' => 'Tata Usaha'],
            ['id' => 'guru', 'label' => 'Guru'],
            ['id' => 'walikelas', 'label' => 'Wali Kelas'],
            ['id' => 'siswa', 'label' => 'Siswa'],

        ];
    }
}
