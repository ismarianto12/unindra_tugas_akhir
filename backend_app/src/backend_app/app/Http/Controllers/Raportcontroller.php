<?php

namespace App\Http\Controllers;

use App\Models\Pegawai;
use App\Models\Penilaian;
use App\Models\Siswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Raportcontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }
    public function index()
    {
        try {
            $semester = $this->request->semester;
            $tahun = $this->request->tahun;

            if ($this->request->session_id) {
                $data = Siswa::select(\DB::raw('*'))->where('id', $this->request->session_id)
                    ->get();
            } else {
                $data = Siswa::select(\DB::raw('*'))
                    ->get();
            }
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {

        $data = Penilaian::select('*')
            ->join('mapel', 'mapel.id', '=', 'penilaian.id_mapel', 'left')
            ->join('siswa', 'siswa.id', '=', 'penilaian.id_siswa', 'left')
            ->where('penilaian.id_siswa', $id)->get();

        // if ($data->count() > 0) {
        return response()->json([
            'data' => $data,
        ]);
        // } else {
        //     return abort(404);
        // }

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
            $data = new Penilaian;
            $data->id_siswa = $this->request->id_siswa;
            $data->id_mapel = $this->request->mapel;
            $data->nilai = $this->request->nilai;
            $data->bobot = $this->request->bobot;
            $data->semester = $this->request->semester;
            $data->nilai_tugas = $this->request->nilai_tugas;
            $data->nilai_presensi = $this->request->nilai_presensi;
            $data->save();

            return response()->json([
                'nama' => $this->getnama($data->id_siswa),
                'msg' => 'data berhasil di simpan',
            ]);
        } catch (\Throwable $th) {
            //throw $th;
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

    public function GetRatings()
    {
        $siswa_id = $this->request->siswa_id;

        $data = Penilaian::select(\DB::raw('max(bobot) as peringkat', 'siswa.id as siswa_ratings'))
            ->join('mapel', 'mapel.id', '=', 'penilaian.id_mapel', 'left')
            ->join('siswa', 'siswa.id', '=', 'penilaian.id_siswa', 'left')
            ->orderBy('siswa.id','desc')
            ->get();

        dd($data->first()->siswa_ratings);
        $ratingsView =  $data->first()->siswa_ratings ?  $data->first()->siswa_ratings : 0;
        return response()->json([
            'data' => $ratingsView
        ]);
    }

    //
}
