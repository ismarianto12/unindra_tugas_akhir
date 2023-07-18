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
        $username = $this->request->username;
        $password = $this->request->password;
        $data = Login::where([
            'username' => $username,
            'password' => $password,
        ])->get();
        if ($data->count() > 0) {
            $ReturnToken = app('hash')->make($password);
            Login::where(
                ['id' => $data->first()->id]
            )->update([
                'token' => $ReturnToken,
            ]);
            $Resp = [
                "id" => $data->first()->id,
                'username' => $data->first()->username,
                'nama' => $data->first()->nama,
                'token' => $ReturnToken,
                'level' => $data->first()->level_id,
            ];
            return response()->json($Resp);
        } else {
            return response()->json([
                'status' => 'failed',
                'messages' => 'username dan password salah',
                'token' => $password,
                'data' => $data,
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
            $Login = new Login;
            $Login->username = $this->request->username;
            $Login->password = $this->request->password;
            $Login->level = $this->request->level;
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
        $token = isset($this->request->token) ? $this->request->token : '';
        $tokendata = $this->request->header('token');
        $header = $this->request->header('token') != '' ? $tokendata : '';
        $dataToken = $this->request->token ? $this->request->token : $header;
        if (!$token || !$header) {
            return response()->json([
                'messages' => 'unauthenticated',
            ], 403);
        } else {
        }
    }
    public function daftar()
    {
        try {
            $Login = new Login;
            $Login->username = $this->request->username;
            $Login->name = $this->request->name;
            $Login->password = $this->request->password;
            $Login->level = $this->request->level;
            $Login->save();

            return response()->json([
                'messages' => 'Berhasil daftar',
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'messages' => $th,
            ], 400);
        }
    }

    public function export()
    {
        //ENTER THE RELEVANT INFO BELOW
        $mysqlHostName = env('DB_HOST');
        $mysqlUserName = env('DB_USERNAME');
        $mysqlPassword = env('DB_PASSWORD');
        $DbName = env('DB_DATABASE');
        $file_name = 'database_backup_on_' . date('y-m-d') . '.sql';

        $queryTables = \DB::select(\DB::raw('SHOW TABLES'));
        foreach ($queryTables as $table) {
            foreach ($table as $tName) {
                $tables[] = $tName;
            }
        }
        // $tables  = array("users","products","categories"); //here your tables...

        $connect = new \PDO("mysql:host=$mysqlHostName;dbname=$DbName;charset=utf8", "$mysqlUserName", "$mysqlPassword", array(\PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
        $get_all_table_query = "SHOW TABLES";
        $statement = $connect->prepare($get_all_table_query);
        $statement->execute();
        $result = $statement->fetchAll();
        $output = '';
        foreach ($tables as $table) {
            $show_table_query = "SHOW CREATE TABLE " . $table . "";
            $statement = $connect->prepare($show_table_query);
            $statement->execute();
            $show_table_result = $statement->fetchAll();

            foreach ($show_table_result as $show_table_row) {
                $output .= "\n\n" . $show_table_row["Create Table"] . ";\n\n";
            }
            $select_query = "SELECT * FROM " . $table . "";
            $statement = $connect->prepare($select_query);
            $statement->execute();
            $total_row = $statement->rowCount();

            for ($count = 0; $count < $total_row; $count++) {
                $single_result = $statement->fetch(\PDO::FETCH_ASSOC);
                $table_column_array = array_keys($single_result);
                $table_value_array = array_values($single_result);
                $output .= "\nINSERT INTO $table (";
                $output .= "" . implode(", ", $table_column_array) . ") VALUES (";
                $output .= "'" . implode("','", $table_value_array) . "');\n";
            }
        }

        $file_handle = fopen($file_name, 'w+');
        fwrite($file_handle, $output);
        fclose($file_handle);
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . basename($file_name));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file_name));
        ob_clean();
        flush();
        readfile($file_name);
        unlink($file_name);

    }

    //
}
