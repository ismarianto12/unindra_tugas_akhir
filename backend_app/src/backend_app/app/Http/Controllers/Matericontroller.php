<?php

namespace App\Http\Controllers;

use App\Models\Elearning;
use App\Models\Pegawai;
use App\Models\Penilaian;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Matericontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {

            $data = Elearning::get();
            return response()->json(['data' => $data]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {
        $data = Elearning::find($id);
        return response()->json(['data' => $data]);
    }

    private function getnama($id)
    {
        $data = Siswa::where('id', $id)->get();
        if ($data->count() > 0) {
            $nama = $data->first()->nama;
        } else {
            $nama = 'undefined';
        }
        return $nama;
    }

    public function save()
    {
        try {
            $validasi = [
                "kelas_id" => 'required',
                "semester_id" => 'required',
                "materiJudul" => 'required',
                "fileMateri" => 'required',
                "nilai" => 'required',
                "user_id" => 'required'
            ];
            $valid = $this->request->validate($this->request, $validasi);
            if ($valid->fails()) {
                return response()->json([
                    'nama' =>'' ,
                    'msg' => 'data berhasil di simpan',
                ]);
            }

            $data  = new Elearning();
            $data->kelas_id = $this->request->kelas_id;
            $data->semester_id = $this->request->semester_id;
            $data->materiJudul = $this->request->materiJudul;
            $data->fileMateri = $this->request->fileMateri;
            $data->nilai = $this->request->nilai;
            $data->user_id = $this->request->user_id;
            $data->save();

            return response()->json([
                'status' =>'ok',
                'msg' => 'data berhasil di simpan',
            ],200);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update($id)
    {
        try {
            $Pegawai = Pegawai::find($id);
            $Pegawai->nama = $this->request->nama;
            $Pegawai->nisn = $this->request->nisn;
            $Pegawai->jk = $this->request->jk;
            $Pegawai->alamat = $this->request->alamat;
            $Pegawai->ttl = $this->request->ttl;
            $Pegawai->kelas = $this->request->kelas;
            $Pegawai->tahun_masuk = $this->request->tahun_masuk;
            $Pegawai->nama_ibu = $this->request->nama_ibu;
            $Pegawai->nama_ayah = $this->request->nama_ayah;
            $Pegawai->save();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di simpan',
            ]);
        } catch (\Throwable $th) {
            //throw $th;
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
}
