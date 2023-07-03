<?php

namespace App\Http\Controllers;

use App\Models\Mapel;
use Illuminate\Http\Request;

class Mapelcontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {
            $data = Mapel::select(\DB::raw('*,pegawai.id as pegawai_id,mapel.id as id_mapel'))->join('pegawai', 'mapel.id_pegawai', '=', 'pegawai.id', 'left')->get();
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

            $data = Mapel::where('id', $id)->get();
            if ($data->count() > 0) {
                return response()->json(
                    $data,
                );
            } else {
                return abort(404);
            }
        } catch (\Throwable $th) {
        }
    }

    public function store()
    {

        try {
            $Mapel = new Mapel;
            $Mapel->id_pegawai = $this->request->id_pegawai;
            $Mapel->kode = $this->request->kode;
            $Mapel->mapel = $this->request->mapel;
            $Mapel->kkm = $this->request->kkm;
            $Mapel->kurikulum = $this->request->kurikulum;
            $Mapel->save();
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
            $Mapel = Mapel::find($id);
            $Mapel->nama = $this->request->nama;
            $Mapel->nisn = $this->request->nisn;
            $Mapel->jk = $this->request->jk;
            $Mapel->alamat = $this->request->alamat;
            $Mapel->ttl = $this->request->ttl;
            $Mapel->kelas = $this->request->kelas;
            $Mapel->tahun_masuk = $this->request->tahun_masuk;
            $Mapel->nama_ibu = $this->request->nama_ibu;
            $Mapel->nama_ayah = $this->request->nama_ayah;
            $Mapel->save();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di simpan',
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function SkFile()
    {
        $filePath = 'https://www.ui.ac.id/wp-content/uploads/2023/05/496-SK-tentang-tarif-BP-Program-profesi-Magister-Doktor-dan-Spesialis-TA-2023-2024.pdf';
        header('Content-Type: application/pdf');
        readfile($filePath);
    }

    public function delete($id)
    {
        try {
            $Mapel = Mapel::find($id);
            $Mapel->delete();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di hapus',
            ]);
        } catch (\Throwable $th) {
        }
    }

    //
}
