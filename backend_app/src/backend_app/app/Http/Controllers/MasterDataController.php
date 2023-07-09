<?php

namespace App\Http\Controllers;

use App\Models\Mapel;
use Illuminate\Http\Request;

class MasterDataController extends Controller
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
        try {
            \DB::table('masterdata')->insert([
                'kode' => $this->request->kode,
                'nama' => $this->request->nama,
                'type' => 'satuan',
            ]);
            $data = [
                'data berhasil di simpan'
            ];
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    //
}
