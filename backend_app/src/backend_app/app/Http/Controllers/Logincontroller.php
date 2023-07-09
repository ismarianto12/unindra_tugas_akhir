<?php

namespace App\Http\Controllers;

use App\Models\Login;
use Illuminate\Http\Request;

class Logincontroller extends Controller
{
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    public function accesslogin()
    {
        $username           = $this->request->username;
        $password           = $this->request->password;
        $data = Login::where([
            'username'      => $username,
            'password'      => $password,
        ])->get();
        if ($data->count() > 0) {
            $ReturnToken    = app('hash')->make($password);
            Login::where(
                ['id'       => $data->first()->id]
            )->update([
                'token'     => $ReturnToken
            ]);
            $Resp = [
                "id"        => $data->first()->id,
                'username'  => $data->first()->username,
                'nama'      => $data->first()->nama,
                'token'     => $ReturnToken,
                'level'     => $data->first()->level_id,
            ];
            return response()->json($Resp);
        } else {
            return response()->json([
                'status'    => 'failed',
                'messages'  => 'username dan password salah',
                'token'     => $password,
                'data'      => $data,
            ], 400);
        }
    }
    public function index()
    {
        try {

            $data = Login::get();

            return response()->json([
                'status' => 'ok',
                'messages' => '',
                'data' => $data,
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function show($id)
    {
        try {

            $data = Login::where('id', $id)->get();
            if ($data->count() > 0) {
                return response()->json([
                    'data' => $data,
                ]);
            } else {
                return abort(404);
            }
        } catch (\Throwable $th) {
        }
    }

    public function store()
    {

        try {
            $Login           = new Login;
            $Login->username = $this->request->username;
            $Login->password = $this->request->password;
            $Login->level    = $this->request->level;
            $Login->save();
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
            $Login = Login::find($id);
            $Login->username = $this->request->username;
            $Login->password = $this->request->password;
            $Login->level = $this->request->level;
            $Login->save();
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
            $Login = Login::find($id);
            $Login->delete();
            return response()->json([
                'status' => 'ok',
                'msg' => 'data berhasil di hapus',
            ]);
        } catch (\Throwable $th) {
        }
    }

    public function validateToken()
    {
        $token     = isset($this->request->token) ? $this->request->token : '';
        $tokendata = $this->request->header('token');
        $header    = $this->request->header('token') != '' ? $tokendata : '';
        $dataToken = $this->request->token ? $this->request->token : $header;
        if (!$token || !$header) {
            return response()->json([
                'messages' => 'unauthenticated'
            ], 403);
        } else {
        }
    }

    //
}
