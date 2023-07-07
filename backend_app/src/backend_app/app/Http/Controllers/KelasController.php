<?php

namespace App\Http\Controllers;

use App\Models\Kelas;
use Illuminate\Http\Request;

class Kelascontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {
            $data = Kelas::select(\DB::raw('*,kelas.id as id_kelas'))->join('pegawai', 'pegawai.id', '=', 'kelas.id_pegawai', 'left')->get();
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function nilai()
    {
        return response()->json(
            [
                [
                    'id' => 'A', 'name' => '80 s/d 100',
                ],
                [
                    'id' => 'B', 'name' => '70 s/d 80',
                ],
                [
                    'id' => 'C', 'name' => '60 s/d 70',
                ],
                [
                    'id' => 'D', 'name' => '40 s/d 60',
                ],
                [
                    'id' => 'E', 'name' => '20 s/d 40',
                ],
            ]
        );
    }

    public function kelas()
    {
        return response()->json(
            [
                [
                    'id' => 'A', 'name' => '80 s/d 100',
                ],
                [
                    'id' => 'B', 'name' => '70 s/d 80',
                ],
                [
                    'id' => 'C', 'name' => '60 s/d 70',
                ],
                [
                    'id' => 'D', 'name' => '40 s/d 60',
                ],
                [
                    'id' => 'E', 'name' => '20 s/d 40',
                ],
            ]
        );
    }

    public function show($id)
    {
        try {

            $data = Kelas::where('id', $id)->get();
            if ($data->count() > 0) {
                return response()->json([
                    'data' => $data,
                ]);
            } else {
                return abort(404);
            }
        } catch (\Throwable $th) {
            // return
        }
    }

    public function store()
    {
        try {
            $Kelas              = new Kelas;
            $Kelas->id_pegawai  = (int) $this->request->id_pegawai;
            $Kelas->kode        = $this->request->kode;
            $Kelas->kelas       = $this->request->kelas;
            $Kelas->kkm         = $this->request->kkm;
            $Kelas->kurikulum   = $this->request->kurikulum;
            $Kelas->save();
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
            $Kelas = Kelas::find($id);
            $Kelas->nama = $this->request->nama;
            $Kelas->nisn = $this->request->nisn;
            $Kelas->jk = $this->request->jk;
            $Kelas->alamat = $this->request->alamat;
            $Kelas->ttl = $this->request->ttl;
            $Kelas->kelas = $this->request->kelas;
            $Kelas->tahun_masuk = $this->request->tahun_masuk;
            $Kelas->nama_ibu = $this->request->nama_ibu;
            $Kelas->nama_ayah = $this->request->nama_ayah;
            $Kelas->save();
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
            $Kelas = Kelas::find($id);
            $Kelas->delete();

            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di hapus',
            ]);
        } catch (\Throwable $th) {
        }
    }

    //
}
