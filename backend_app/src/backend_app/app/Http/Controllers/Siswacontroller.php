<?php

namespace App\Http\Controllers;

use App\Http\Traits\Oaweb;
use App\Models\OpeningNew;
use App\Models\Siswa;
use Illuminate\Http\Request;

class Siswacontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {
            $data = Siswa::select('*')->OrderBy('id', 'desc')->get();
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {
        try {

            $data = Siswa::where('id', $id)->get();
            if ($data->count() > 0) {
                return response()->json($data);
            } else {
                return abort(404);
            }
        } catch (\Throwable $th) {
        }
    }

    public function store()
    {

        try {
            $siswa = new Siswa;
            $siswa->nama =  $this->request->nama;
            $siswa->nisn =  $this->request->nisn;
            $siswa->jk =  $this->request->jk;
            $siswa->alamat =  $this->request->alamat;
            $siswa->ttl =  $this->request->ttl;
            $siswa->kelas =  $this->request->kelas;
            $siswa->tahun_masuk =  $this->request->tahun_masuk;
            $siswa->nama_ibu =  $this->request->nama_ibu;
            $siswa->nama_ayah =  $this->request->nama_ayah;
            $siswa->created_at = date('Y-m-d H:i:s');
            $siswa->updated_at = date('Y-m-d H:i:s');
            $siswa->save();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di simpan'
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update($id)
    {
        try {
            $siswa = Siswa::find($id);
            $siswa->nama =  $this->request->nama;
            $siswa->nisn =  $this->request->nisn;
            $siswa->jk =  $this->request->jk;
            $siswa->alamat =  $this->request->alamat;
            $siswa->ttl =  $this->request->ttl;
            $siswa->kelas =  $this->request->kelas;
            $siswa->tahun_masuk =  $this->request->tahun_masuk;
            $siswa->nama_ibu =  $this->request->nama_ibu;
            $siswa->nama_ayah =  $this->request->nama_ayah;
            $siswa->save();

            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di update'
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }


    public function delete($id)
    {
        try {
            $siswa = Siswa::find($id);
            $siswa->delete();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di hapus'
            ]);
        } catch (\Throwable $th) {
        }
    }

    // func

    public function statushadir()
    {
        $a = [
            '1' => 'hadir',
            '2' => 'izin',
            '3' => 'Alpa/tanpa keterangan',
        ];
        return response()->json($a);
    }
}
