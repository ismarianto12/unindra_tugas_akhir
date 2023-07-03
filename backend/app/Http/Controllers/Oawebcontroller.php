<?php

namespace App\Http\Controllers;

use App\Http\Traits\Oaweb;
use App\Models\OpeningNew;
use Illuminate\Http\Request;

class Oawebcontroller extends Controller
{

    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    use Oaweb;
    public function all()
    {
        try {

            return response()->json([
                'status' => 'ok',
                'messages' => '',
                'data' => [],
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function cekdetail($id)
    {
        try {

            $data = OpeningNew::where('params_id', $id)->get();
            if ($data->count() > 0) {
                return response()->json([
                    'data' => $data,
                ]);
            } else {
                return abort(404);
            }
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
    public function update()
    {
        try {

            return response()->json([
                'status' => 'ok',
                'messages' => '',
                'data' => [],
            ]);
        } catch (\Throwable $th) {
            //throw $th;
        }
    }
    public function firststep($params = '')
    {
        try {

            switch ($params) {
                case 'updaterekening':
                    $data = OpeningNew::where('params_id', $this->request->params_id)->update([
                        'jenis_rek' => $this->request->jenis,
                    ]);
                    return response()->json([
                        'status' => 'ok',
                        'messages' => 'jenis rekening berhasil di simpan',
                    ]);
                    break;

                default:
                    $data = new OpeningNew;
                    $data->kode_sales = $this->request->kode_referal;
                    $data->fullname = $this->request->name;
                    $data->email = $this->request->email;
                    $data->handphone = $this->request->no_hp;
                    $data->save();

                    // $data = $opening_new->insert(array(
                    //     'kode_sales' => $this->request->kode_referal,
                    //     'fullname' => $this->request->name,
                    //     'email' => $this->request->email,
                    //     'handphone' => $this->request->no_hp,
                    // ));

                    // dd($data->id);
                    // $idnya = OpeningNew::latest()->first()->id;
                    OpeningNew::where(['id' => $data->id])->update([
                        'params_id' => md5($data->id),
                    ]);
                    return response()->json([
                        'status' => 'ok',
                        'messages' => 'data berhasil di simpan',
                        'data' => [
                            'id' => md5($data->id),
                            'origin_id' => $data->id,
                        ],
                    ]);
                    break;
            }

            //send emial otp
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    private function base64_to_jpeg($base64_string, $output_file)
    {
        // open the output file for writing
        $ifp = fopen($output_file, 'wb');

        // split the string on commas
        // $data[ 0 ] == "data:image/png;base64"
        // $data[ 1 ] == <actual base64 string>
        $data = explode(',', $base64_string);

        // we could add validation here with ensuring count( $data ) > 1
        fwrite($ifp, base64_decode($data[1]));
        // clean up the file resource
        fclose($ifp);

        return $output_file;
    }
    public function save()
    {

        try {
            if ($this->request->step == 'biodata') {
                $parent_id = $this->request->parent_id;
                // generate folder name

                $path = './file/ktp/' . $parent_id;
                if (!file_exists($path)) {
                    $mask = umask(0);
                    mkdir($path, 0777);
                    umask($mask);
                }
                //generate folder of swafoto
                $path = './file/swafoto/' . $parent_id;
                if (!file_exists($path)) {
                    $mask = umask(0);
                    mkdir($path, 0777);
                    umask($mask);
                }
                if ($this->request->file('ktp')) {
                    $ext = $this->request->file('ktp');
                    $ktpsetname = trim($this->request->parent_id . rand(122, 333) . '.' . $ext->getClientOriginalExtension());
                    $ext->move('./file/ktp/' . $parent_id, $ktpsetname);
                    $dfotoktp = [
                        'fileKTP' => $ktpsetname,
                    ];
                } else {
                    $dfotoktp = [];
                }
                if ($this->request->file('swafoto') != '') {
                    $nameswaFoto = trim($this->request->parent_id . rand(122, 333) . '.jpg');
                    $this->request->file('swafoto')->move('./file/swafoto/' . $parent_id, $nameswaFoto);

                    $swafoto = [
                        'fileSELFIE' => $nameswaFoto,
                    ];
                } else {
                    $swafoto = [];
                }

                $arrdata = array_merge($dfotoktp, $swafoto);
                $data = array_merge($arrdata, [
                    'fullname' => $this->request->nama_sesuai_ktp,
                    'tempat_lahir' => $this->request->tempat_lahir,
                    'agama' => $this->request->agama,
                    'tgl_lahir' => $this->request->tgl_lahir,
                    'jenis_kelamin' => $this->request->jk,
                    'status_kawin' => $this->request->status_perkawinan,
                    'pendidikan' => $this->request->pendidikan,
                    'email' => $this->request->email,
                    'type_of_id' => 'KTP',
                    'provinsi' => $this->request->provinsi,
                    'kota' => $this->request->kota,
                    'kodepos' => $this->request->kode_pos,
                    'handphone' => $this->request->no_hp,
                    'noktp' => $this->request->nik,
                    'npwp' => $this->request->npwp,
                    'negara' => $this->request->negara,
                    'nama_bank_account' => $this->request->bank,
                    'no_rek_account' => $this->request->no_rek,
                    'tin_ssn' => $this->request->tin_ssn,
                    'nama_rek_account' => $this->request->nama_lengkaprek,
                    'alamat' => $this->request->alamat_ktp,
                    'current_step' => 0,
                ]);
            } else
            if ($this->request->step == 'pekerjaan') {
                $data = [
                    'pekerjaan' => $this->request->pekerjaan,
                    'nama_kantor' => $this->request->nama_perusahaan,
                    'bid_usaha' => $this->request->bidang_usaha,
                    'alamat_kantor' => $this->request->alamat_kantor,
                    'penghasilan_tahun' => $this->request->range_gaji,
                    'hasil_tambahan' => $this->request->penghasilan_tambahan,
                    'current_step' => 1,

                ];
            } else
            if ($this->request->step == 'pasangan') {
                $data = [
                    'nama_parent' => $this->request->nama_lengkap_pasangan,
                    'hubungan' => $this->request->hubungan,
                    'ktp_parent' => $this->request->no_identitas,
                    'pekerjaan_parent' => $this->request->pekerjaan_pasangan,
                    'hp_parent' => $this->request->no_hp_pasangan,
                    'current_step' => 2,
                ];
            } else
            if ($this->request->step == 'referensi') {
                $nama_bank_account = $this->request->bank == 'LAINYA' ? $this->request->nama_bank_kedua : $this->request->bank;
                $data = [
                    'nama_bank_account' => $nama_bank_account,
                    'sumber_dana_utama' => $this->request->sumberdana_utama,
                    'pengalaman_invest' => $this->request->pengalaman_investasi,
                    'tujuan_invest' => $this->request->tujuan_investasi,
                    'pemilik_asset' => $this->request->pemilik_manfaat,
                    'no_rek3' => $this->request->no_rek,
                    'question_jangka_waktu' => $this->request->question_jangka_waktu,
                    'question_tujuan_invest' => $this->request->question_tujuan_invest,
                    'question_pandangan_kemungkinan' => $this->request->question_pandangan_kemungkinan,

                    // jika penerima manfaat adalah pihak lain

                    'current_step' => 4,
                ];
            }

            // dd($data);
            OpeningNew::where('params_id', $this->request->parent_id)->update($data);
            return response()->json([
                'status' => 'ok',
                'messages' => '',
                'data' => [],
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function save_signature()
    {
        $parent_id = $this->request->parent_id;
        $signature = $this->request->file('signature');
        $path = './file/signature/' . $parent_id;
        if (!file_exists($path)) {
            $mask = umask(0);
            mkdir($path, 0777);
            umask($mask);
        }
        $newsignaturename = $parent_id . rand(122, 333) . '.' . $signature->getClientOriginalExtension();
        $this->request->file('signature')->move('./file/signature/' . $parent_id, $newsignaturename);
        OpeningNew::where('params_id', $this->request->parent_id)->update([
            'fileSIGNname' => $newsignaturename,
        ]);
        return response()->json(['status' => 1, 'messages' => 'data data berhasil tanda tangani']);
    }

    public function daftar_baru()
    {
        dd($this->request->all());
    }

    public function encp($param_id)
    {
        $cipherText = $param_id;
        exec('cd ' . __DIR__ . ' && java MNI -e "' . addslashes($param_id) . '" 2>&1', $output);
        if (count($output) > 0) {
            $cipherText = $output[0];
        }

        print_r($output[0]);
    }
    //function send data to api

    public function sendata($id)
    {

        // ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);

        $data = OpeningNew::where('id', $id)->first();
        $file = $data->fileKTP;
        $folder = $data->params_id;

        // $encode = encodefile('./file/swafoto/6512bd43d9caa6e02c990b0a82652dca', '6512bd43d9caa6e02c990b0a82652dca304.jpg');
        // print_r($encode);
        // exit;

        $noreg = "OLT" . $data->id;
        $id = $data->id;
        $params_id = $data->params_id;
        $id_reg = $data->id_reg;
        $cabang = $data->cabang;
        $kode_sales = $data->kode_sales;
        $jenis_rek = $data->jenis_rek;
        $fullname = $data->fullname;
        $gender = $data->jenis_kelamin;
        $tmpt_lahir = $data->tempat_lahir;
        $tanggal_lahir = $data->tgl_lahir;
        $agama = $data->agama;
        $pendidikan = $data->pendidikan;
        $type_of_id = $data->type_of_id;
        $noktp = $data->noktp;
        $expired_date = $data->expired_date;
        $warganegara = $data->warganegara;
        $npwp = $data->npwp;
        $alamat = $data->alamat;
        $kelurahan = $data->kelurahan;
        $kecamatan = $data->kecamatan;
        $provinsi = $data->provinsi;
        $kota = $data->kota;
        $domisili = $data->domisili;
        $negara_domisili = $data->negara_domisili;
        $kelurahan_domisili = $data->kelurahan_domisili;
        $kecamatan_domisili = $data->kecamatan_domisili;
        $provinsi_domisili = $data->provinsi_domisili;
        $kota_domisili = $data->kota_domisili;
        $kodepos_domisili = $data->kodepos_domisili;
        $kodepos = $data->kodepos;
        $negara = $data->negara;
        $telpon = $data->telpon;
        $fax = $data->fax;
        $handphone = $data->handphone;
        $email = $data->email;
        $status_rumah = $data->status_rumah;
        $proof_of_residential = $data->proof_of_residential;
        $correspondence_address = $data->correspondence_address;
        $martial = $data->status_kawin;
        $nama_ibu = $data->nama_ibu;
        $pekerjaan = $data->pekerjaan;
        $perusahaan = $data->nama_kantor;
        $alamat_kantor = $data->alamat_kantor;
        $telp_kantor = $data->telp_kantor;
        $fax_kantor = $data->fax_kantor;
        $email_kantor = $data->email_kantor;
        $bid_usaha = $data->bid_usaha;
        $lama_kerja = $data->lama_kerja;
        $lama_usaha = $data->lama_usaha;
        $jabatan = $data->jabatan;
        $gaji_pokok = $data->gaji_pokok;
        $main_source = $data->sumber_hasil;
        $penghasilan_tambahan = $data->penghasilan_tambahan;
        $hasil_tambahan = $data->hasil_tambahan;
        $nama_parent = $data->nama_parent;
        $hubungan = $data->hubungan;
        $ktp_parent = $data->ktp_parent;
        $expired_date_parent = $data->expired_date_parent;
        $warganegara_parent = $data->warganegara_parent;
        $alamat_parent = $data->alamat_parent;
        $kodepos_parent = $data->kodepos_parent;
        $negara_parent = $data->negara_parent;
        $telpon_parent = $data->telpon_parent;
        $fax_parent = $data->fax_parent;
        $hp_parent = $data->hp_parent;
        $pekerjaan_parent = $data->pekerjaan_parent;
        $nama_kantor_parent = $data->nama_kantor_parent;
        $alamat_kantor_parent = $data->alamat_kantor_parent;
        $bid_usaha_parent = $data->bid_usaha_parent;
        $lama_kerja_parent = $data->lama_kerja_parent;
        $lama_usaha_parent = $data->lama_usaha_parent;
        $jabatan_parent = $data->jabatan_parent;
        $nama_bank1 = $data->nama_bank1;
        $nama_rek1 = $data->nama_rek1;
        $jenis_rek1 = $data->jenis_rek1;
        $no_rek1 = $data->no_rek1;
        $nama_bank2 = $data->nama_bank2;
        $nama_rek2 = $data->nama_rek2;
        $jenis_rek2 = $data->jenis_rek2;
        $no_rek2 = $data->no_rek2;
        $nama_bank3 = $data->nama_bank3;
        $nama_rek3 = $data->nama_rek3;
        $jenis_rek3 = $data->jenis_rek3;
        $no_rek3 = $data->no_rek3;
        $sumber_dana_utama = $data->sumber_dana_utama;
        $tujuan_invest = $data->tujuan_invest;
        $pengalaman_invest = $data->pengalaman_invest;
        $pemilik_asset = $data->pemilik_asset;
        $tenor = $data->tenor;
        $nama_bank_account = $data->nama_bank_account;
        $account_no = $data->no_rek_account;
        $account_holder = $data->nama_rek_account;
        $instruksi = $data->instruksi;
        $efek = $data->efek;
        $efek_transfer = $data->efek_transfer;
        $confirm = $data->confirm;
        $confirm_transaksi_fax = $data->confirm_transaksi_fax;
        $confirm_transaksi_email = $data->confirm_transaksi_email;
        $confirm_transaksi_email_khusus = $data->confirm_transaksi_email_khusus;
        $report = $data->report;
        $report_transaksi_fax = $data->report_transaksi_fax;
        $report_transaksi_email = $data->report_transaksi_email;
        $report_transaksi_email_khusus = $data->report_transaksi_email_khusus;
        $lain1 = $data->lain1;
        $lain1_nama = $data->lain1_nama;
        $lain1_bagian = $data->lain1_bagian;
        $lain2 = $data->lain2;
        $lain2_nama = $data->lain2_nama;
        $lain2_kantor = $data->lain2_kantor;
        $lain3 = $data->lain3;
        $lain3_nama = $data->lain3_nama;
        $lain3_kantor = $data->lain3_kantor;
        $lain4 = $data->lain4;
        $lain4_saham_publik = $data->lain4_saham_publik;
        $lain5 = $data->lain5;
        $lain5_no_rek = $data->lain5_no_rek;
        $lain6 = $data->lain6;
        $lain12 = $data->lain12;
        $lain12_referral = $data->lain12_referral;
        $fileKTP = $data->fileKTP;
        $fileKTPname = $data->fileKTPname;
        $fileKTPsize = $data->fileKTPsize;
        $fileKTPtype = $data->fileKTPtype;
        $fileNPWP = $data->fileNPWP;
        $fileNPWPname = $data->fileNPWPname;
        $fileNPWPsize = $data->fileNPWPsize;
        $fileNPWPtype = $data->fileNPWPtype;
        $fileREK = $data->fileREK;
        $fileREKname = $data->fileREKname;
        $fileREKsize = $data->fileREKsize;
        $fileREKtype = $data->fileREKtype;
        $fileSIGN = $data->fileSIGN;
        $fileSIGNname = $data->fileSIGNname;
        $fileSIGNsize = $data->fileSIGNsize;
        $fileSIGNtype = $data->fileSIGNtype;
        $fileSELFIE = $data->fileSELFIE;
        $fileSELFIEname = $data->fileSELFIEname;
        $fileSELFIEsize = $data->fileSELFIEsize;
        $fileSELFIEtype = $data->fileSELFIEtype;
        $rdn = $data->rdn;
        $created_by = $data->created_by;
        $created_date = $data->created_date;
        $created_at = $data->created_at;
        $email1 = $data->email1;

        function encrypt($text)
        {
            $cipherText = $text;
            exec('cd ' . __DIR__ . ' && java MNI -e "' . addslashes($text) . '" 2>&1', $output);
            if (count($output) > 0) {
                $cipherText = $output[0];
            }

            return $cipherText;
        }

        function decrypt($text)
        {
            $plainText = $text;
            exec('cd ' . __DIR__ . ' && java MNI -d "' . addslashes($text) . '" 2>&1', $output);
            if (count($output) > 0) {
                $plainText = $output[0];
            }

            return $plainText;
        }

        function uploadPhoto($regId, $type, $photo)
        {
            if (filesize($photo) >= 1024 * 1024) {
                $photo = reduceImageSize($photo, $photo . '.bak', 75);
            }

            $fields = [
                'p1' => encrypt($regId),
                'p2' => encrypt($type),
                'p3' => new \CurlFile($photo, 'image/png', 'ktp.png'),
            ];
            $url = 'https://supportdev.mncsekuritas.id:30443/ws/api/oas/oasOpeningAccount/upload';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
            curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: multipart/form-data']);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);
            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
            curl_setopt($ch, CURLOPT_VERBOSE, true);
            $data = curl_exec($ch);
            $info = curl_getinfo($ch);
            $json = json_decode($data);
            var_dump($json);
            curl_close($ch);
        }

        $ipAddress = $_SERVER['REMOTE_ADDR'];
        $userAgent = $_SERVER['HTTP_USER_AGENT'];

        function reduceImageSize($source, $destination, $quality)
        {
            $info = getimagesize($source);
            if ($info['mime'] == 'image/jpeg') {
                $image = imagecreatefromjpeg($source);
            } elseif ($info['mime'] == 'image/gif') {
                $image = imagecreatefromgif($source);
            } elseif ($info['mime'] == 'image/png') {
                $image = imagecreatefrompng($source);
            }
            imagejpeg($image, $destination, $quality);
            return $destination;
        }

        $datasave = array(
            "Agama" => $agama,
            "Alamat" => $alamat,
            "AlamatEmail" => $email,
            "AlamatEmailKantor" => $email_kantor,
            "AlamatKantor" => $alamat_kantor,
            "AlamatSuratMenyurat" => $correspondence_address,
            "AlamatTempatTinggal" => $alamat,
            "BankId" => $nama_bank_account,
            "BankNamaRekening" => $account_holder,
            "BankNoRekening" => $account_no,
            "BidangUsaha" => $bid_usaha,
            "BuktiKepemilikanRumah" => $status_rumah,
            "Cabang" => $cabang,
            "CreatedBy" => $created_by,
            "DeviceDesc" => "Web|1.8.2|" . $ipAddress,
            "DeviceFlag" => "W",
            "DeviceId" => $ipAddress . "|" . substr($userAgent, 100),
            "EktpStatus" => "",
            "Email" => $email,
            "FatcaHubUsahaNegaraLain" => false,
            "FatcaLamaPunyaRekening" => "0",
            "FatcaLamaTinggal" => "0",
            "FatcaNamaBank" => "",
            "FatcaNamaNegaraHubUsaha" => "ID",
            "FatcaNegaraLahir" => "ID",
            "FatcaPernyataanPemrek" => false,
            "FatcaPunyaRekeningLain" => false,
            "FatcaSumberGaji" => false,
            "FatcaSumberHasilUsaha" => false,
            "FatcaSumberHibah" => false,
            "FatcaSumberTabungan" => false,
            "FatcaSumberWarisan" => false,
            "FatcaTINorSSN" => "",
            "FatcaWajib" => false,
            "FatcaWajibPajak" => false,
            "GolonganDarah" => "",
            "Hp" => $handphone,
            "IdentitasSeumurHidup" => true,
            "IsActive" => true,
            "IsAlamatSama" => true,
            "IsOtpSms" => false,
            "IsProdukMnc" => false,
            "Jabatan" => $jabatan,
            "JenisKelamin" => $gender,
            "JenisPekerjaan" => $pekerjaan,
            "JenisRekening" => $jenis_rek,
            "Kabupaten" => $kelurahan,
            "Kecamatan" => $kecamatan,
            "KeluargaAlamatKantor" => "",
            "KeluargaAlamatTempatTinggal" => $alamat_parent,
            "KeluargaIdentitasMasaBerlakuFlag" => true,
            "KeluargaIdentitasMasaBerlakuTanggal" => "9999-12-31 00:00:00",
            "KeluargaKewarganegaraan" => $warganegara_parent,
            "KeluargaKodepos" => "",
            "KeluargaNamaPerusahaan" => $nama_kantor_parent,
            "KeluargaNegara" => $negara_parent,
            "KeluargaNoHandphone" => $hp_parent,
            "KeluargaNoIdentitas" => "",
            "KeluargaNoTelpRumah" => $telpon,
            "KeluargaPekerjaan" => $pekerjaan_parent,
            "Kelurahan" => $kelurahan,
            "Kewarganegaraan" => $warganegara,
            "KodePos" => $kodepos,
            "Kota" => $kota,
            "LastUpdated" => "2021-04-12 00:00:00",
            "MasaBerlakuIdentitasTanggal" => "9999-12-31 00:00:00",
            "ModifiedBy" => "",
            "NamaBankDanCabang" => $rdn,
            "NamaLengkap" => $fullname,
            "NamaLengkapAyah" => $nama_parent,
            "NamaLengkapIbu" => $nama_ibu,
            "NamaPerusahaan" => $perusahaan,
            "Negara" => $negara,
            "Nik" => $noktp,
            "NoFax" => "",
            "NoFaxKantor" => "",
            "NoHandphone" => $handphone,
            "NoIdentitas" => $noktp,
            "NoKK" => $noktp,
            "NoRt" => 0,
            "NoRw" => 0,
            "NoTeleponRumah" => $telpon,
            "NoTelpKantor" => $telp_kantor,
            "Npwp" => $npwp,
            "OtpExpiryDate" => "2021-04-12 15:18:17",
            "OtpToken" => "622131180626", //cek
            "PemilikAsset" => $pemilik_asset,
            "PendidikanTerakhir" => $pendidikan,
            "PenghasilanPokok" => $gaji_pokok,
            "PhotoKtpDir" => "",
            "PhotoSelfieDir" => "",
            "PhotoSignatureDir" => "",
            "Provinsi" => $provinsi,
            "Sales" => $kode_sales,
            "SalesInput" => "",
            "Status" => "0",
            "StatusHubunganKeluarga" => $hubungan,
            "StatusKawin" => $martial,
            "StatusRumah" => $status_rumah,
            "SumberDanaUtama" => $main_source,
            "TanggalLahir" => $tanggal_lahir,
            "TempatLahir" => $tmpt_lahir,
            "Tenor" => "",
            "TipeIdentitas" => $type_of_id,
            "TujuanInvestasi" => $tujuan_invest,
            "_id" => 1,
        );

        $body = json_encode($datasave);
        $save = encrypt($body);
        $url = 'https://supportdev.mncsekuritas.id:30443/ws/api/oas/oasOpeningAccount/v2/saveData?p1=' . $save;
        // $url = 'http://middleware.mncsekuritas.id/ws/api/oas/oasOpeningAccount/v2/saveData?p1=' . $save;

        // echo $url;
        // die;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, null);
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json', 'User-Agent: ' . $userAgent]);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 10);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_VERBOSE, true);
        $data = curl_exec($ch);
        $json = json_decode($data, true);
        curl_close($ch);

        $regId = $json;

        $type = "1";
        $photoKtp = "./file/ktp/$params_id/$fileKTPname";
        // echo $photoKtp;
        uploadPhoto($regId, $type, $photoKtp);

        $type = "2";
        $photoSelfie = "./file/swafoto/$params_id/$fileSELFIEname";
        // echo $photoSelfie;
        uploadPhoto($regId, $type, $photoSelfie);

        $type = "3";
        $photoSignature = "./file/signature/$params_id/$fileSIGNname";
        // echo $photoSignature;
        uploadPhoto($regId, $type, $photoSignature);

        // require 'class.email-query-results-as-csv-file.php';
        // $emailCSV = new EmailQueryResultsAsCsv('localhost', 'securities', 'securities', '0k3z0n3.c0m');
        // $emailCSV->setQuery("SELECT `id`, `id_reg`, `cabang`, `kode_sales`, `jenis_rek`, `fullname`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `agama`, `pendidikan`, `type_of_id`, `noktp`, `expired_date`, `warganegara`, `npwp`, `alamat`, `kelurahan`, `kecamatan`, `provinsi`, `kota`, `domisili`, `negara_domisili`, `kelurahan_domisili`, `kecamatan_domisili`, `provinsi_domisili`, `kota_domisili`, `kodepos_domisili`, `kodepos`, `negara`, `telpon`, `fax`, `handphone`, `email`, `status_rumah`, `proof_of_residential`, `correspondence_address`, `status_kawin`, `nama_ibu`, `pekerjaan`, `nama_kantor`, `alamat_kantor`, `telp_kantor`, `fax_kantor`, `email_kantor`, `bid_usaha`, `lama_kerja`, `jabatan`, `gaji_pokok`, `sumber_hasil`, `hasil_tambahan`, `nama_parent`, `hubungan`, `ktp_parent`, `expired_date_parent`, `warganegara_parent`, `alamat_parent`, `kodepos_parent`, `negara_parent`, `telpon_parent`, `fax_parent`, `hp_parent`, `pekerjaan_parent`, `nama_kantor_parent`, `alamat_kantor_parent`, `bid_usaha_parent`, `lama_kerja_parent`, `jabatan_parent`, `nama_bank1`, `nama_rek1`, `jenis_rek1`, `no_rek1`, `nama_bank2`, `nama_rek2`, `jenis_rek2`, `no_rek2`, `nama_bank3`, `nama_rek3`, `jenis_rek3`, `no_rek3`, `sumber_dana_utama`, `tujuan_invest`, `pengalaman_invest`, `pemilik_asset`, `tenor`, `nama_bank_account`, `no_rek_account`, `nama_rek_account`, `instruksi`, `efek`, `efek_transfer`, `confirm`, `confirm_transaksi_fax`, `confirm_transaksi_email`, `confirm_transaksi_email_khusus`, `report`, `report_transaksi_fax`, `report_transaksi_email`, `report_transaksi_email_khusus`, `lain1`, `lain1_nama`, `lain1_bagian`, `lain2`, `lain2_nama`, `lain2_kantor`, `lain3`, `lain3_nama`, `lain3_kantor`, `lain4`, `lain4_saham_publik`, `lain5`, `lain5_no_rek`, `lain6`, `created_by`, `created_date` FROM opening_new ORDER BY id_reg DESC LIMIT 0,1");
        // sendmailnuser($email, "customer.service@mncsekuritas.id", $fullname, $kode_sales, $noreg, $nama_bank, $rdn);

        // header("Location: https://www.mncsekuritas.id/opening_account/thankyou/?id=".$noreg."&email=".$email);

    }

    //
}
