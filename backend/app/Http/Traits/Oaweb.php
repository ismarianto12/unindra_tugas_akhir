<?php
namespace App\Http\Traits;

use App\Models\Sales;

trait Oaweb
{

    private function sendmailnuser($to, $from, $nama_nasabah, $kode_sales, $id, $nama_bank, $rdn)
    {
        switch ($nama_bank == "BCA" && $rdn == "BCA") {
            case "1":
                break;
        }

        switch ($rdn) {
            case "bri":
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN BRI/RDI BRI.pdf";
                break;

            case "BCA":
                $link_rdn = "https://www.mncsekuritas.id/opening_account/print-rdn-bca/?id=" . $id . "&email=" . $to . "";
                break;

            case "bca_s":
                $link_rdn = "https://www.mncsekuritas.id/opening_account/print-rdn-bca-s/?id=" . $id . "&email=" . $to . "";
                break;
            case "mandiri":
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN MANDIRI/RDI Mandiri.pdf";
                break;
            case "permata":
                //$link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/RDN%20PERMATA/RDI%20Permata%202020.zip?2";
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN PERMATA/RDI Permata.pdf?2";
                break;
            case "cimb":
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN CIMB NIAGA/RDI CIMB NIAGA.zip?3";
                break;
            case "cimb_s":
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDNCIMBSyariah/RDNCIMBSyariah.zip?1";
                break;
            case "bni":
                $link_rdn = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN BNI/RDN BNI.zip";
                break;
            case "SINARMAS":
                $link_rdn = "https://www.mncsekuritas.id/opening_account/print-rdn-sinarmas/?id=" . $id . "&email=" . $to . "";
                break;
            default:
                break;
        }

        $subject = 'Download Opening Account MNC Sekuritas';
        $link_zip_bca = "https://www.mncsekuritas.id/po-content/po-upload/FORM RDN/RDN BCA/Berkas RDN BCA extra.pdf";

        $header_email = "";

        if ($nama_bank == "BCA" && $rdn == "BCA") {
            $message = "
		<p class=MsoNormal>Dear Bapak/Ibu <b>" . $nama_nasabah . "</b><br></p>
		<p class=MsoNormal>Terima kasih telah melakukan pengajuan pembukaan rekening efek MNC Sekuritas.<br></p>
		<p class=MsoNormal>Data Bapak/Ibu telah kami terima dengan baik untuk selanjutnya diverifikasi. Mohon kesediaannya untuk menunggu selambat-lambatnya 5 (lima) hari kerja. Jika masih ada kekurangan data, Bapak/ Ibu akan dihubungi untuk melengkapi data tersebut supaya dapat diproses lebih lanjut.<br></p>
		<p class=MsoNormal>Setelah proses verifikasi selesai, kami akan mengirimkan email notifikasi pembukaan rekening efek MNC Sekuritas. Mohon untuk melakukan pengecekan juga pada Folder Junk/Spam Bapak/Ibu.<br></p>
		<p class=MsoNormal>Di bawah ini adalah formulir yang telah Anda lengkapi sebagai nasabah MNC Sekuritas:<br>
			1. <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a><br>
			2. <a href='" . $link_rdn . "'><strong>Formulir RDN</strong></a>dan <a href='" . $link_zip_bca . "'><strong>Berkas Wajib</strong></a><br>
		</p>
		<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
		<p class=MsoNormal><o:p>&nbsp;</o:p></p>
		<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
		<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
		<div>
			<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
			<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
			<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
			<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
			<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
			<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
			<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
			<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
			<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
			<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
			<p class=MsoNormal>&nbsp;</p>
		</div>
		";
        }

        if ($rdn == "bri") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>
					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) BRI</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "mandiri") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>
					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank Mandiri</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "permata") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>
					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank Permata</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($nama_bank != "BCA" && $rdn == "BCA") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>
					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank BCA</strong></a> dan <a href='" . $link_zip_bca . "'><strong>berkas WAJIB</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin-Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27 </span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "bca_s") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>
					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) BCA Syariah</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "cimb") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>

					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank CIMB Niaga</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "cimb_s") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>

					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank CIMB Niaga Syariah</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "bni") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>

					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) BNI</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        if ($rdn == "SINARMAS") {
            $message = "
			<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml' xmlns='http://www.w3.org/TR/REC-html40'>" . $header_email . "
				<body lang=EN-US link=blue vlink=purple>

					<div class=WordSection1>
						<p class=MsoNormal>Kepada Yth</p>
						<p class=MsoNormal>Bapak/Ibu " . $nama_nasabah . ",</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terima kasih atas minat berinvestasi bersama MNC Sekuritas.<span lang=IN></span></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Pembukaan rekening efek Bapak/ Ibu melalui <i>website</i> MNC Sekuritas telah berhasil diproses.</p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Untuk proses lebih lanjut, mohon kesediaan Bapak/ Ibu untuk:</p>
						<p class=MsoNormal>
							<ol>
								<li class=MsoNormal>Mencetak <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'><strong>Form Opening Account</strong></a> berikut kemudian ditanda tangani di atas materi Rp10.000,-</li>
								<li class=MsoNormal><i>Download</i> dan melengkapi <a href='" . $link_rdn . "'><strong>form Rekening Data Nasabah (RDN) Bank Sinarmas</strong></a> berikut </li>
								<li class=MsoNormal>Mengirimkan dokumen pada poin 1 dan 2 dengan lampiran <strong>fotocopy KTP, NPWP, dan cover buku tabungan</strong> ke alamat berikut ini:<br><strong>PT MNC Sekuritas</strong><br>Up : <i>Customer Service</i><br>MNC Financial Center Lantai 16<br>Jl. Kebon Sirih Kav. 21 - 27<br>Jakarta 10340</li>
							</ol>
						</p><br>
						<p class=MsoNormal>Bila Bapak/Ibu berminat untuk membuka rekening tabungan saham MNC GEMESIN Plus (Gemar Menabung Saham), silahkan mengisi <a href='https://www.mncsekuritas.id/po-content/po-upload/FORM%20RDN/Form%20Gemesin.pdf'><strong>Form MNC GEMESIN Plus</strong></a>.</p>
						<p class=MsoNormal>Untuk informasi lebih lanjut, silahkan menghubungi <b>Call Center kami</b> di <b>1 500 899 (tekan 3)</b> pada hari Senin - Jumat pukul 08.00 - 17.00 WIB.<o:p></o:p></p>
						<p class=MsoNormal><o:p>&nbsp;</o:p></p>
						<p class=MsoNormal>Terimakasih atas perhatiannya<o:p></o:p></p>
						<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
						<div>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Regards,<o:p></o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'><o:p>&nbsp;</o:p></span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Call Center MNC Sekuritas</span><span style='font-size:12.0pt;color:#1F497D'><o:p></o:p></span></p>
							<p class=MsoNormal><span style='font-size:8.0pt;color:#1F497D'>&nbsp;</span></p>
							<p class=MsoNormal><span style='font-size:12.0pt;color:#1F497D'><img border=0 src='https://www.mncsekuritas.id/logo_kecil.png' alt='MNC sekuritas New email-01'></span></p>
							<p class=MsoNormal><b><span style='color:#1F497D'>MNC Financial Center, 16th Floor</span></b></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jalan Kebon Sirih Kav. 21 - 27</span></p>
							<p class=MsoNormal><span style='color:#1F497D'>Jakarta 10340</span></p>
							<p class=MsoNormal><b><span style='font-size:14.0pt;color:#1F497D'>Call Center 1500 899 (tekan 3)</span></b></p>
							<p class=MsoNormal>&nbsp;</p>
						</div>
						<p class=MsoNormal>&nbsp;</p>
					</div>
				</body>
			</html>
		";
        }

        $query_sales_email = Sales::where('no_staff', $kode_sales)->get();

        // mysql_query("select email from sales where no_staff = '" . $kode_sales . "'") or die('Error : ' . mysql_error());
        // $email_sales = mysql_num_rows($query_sales_email);

        if ($query_sales_email->count() > 0) {
            // while ($emailSalesX = mysql_fetch_array($query_sales_email)) {
            //     $emailSales = $emailSalesX['email'];
            // }
            // foreach ($query_sales_email as $emailSalesX) {
            $emailSales = $query_sales_email->first()->email;
            // }
            $flag = true;
            if ($emailSales == "happybillionairesclub@gmail.com") {
                $emailSales = "openakun.hbc@gmail.com";
            }
        } else {
            $flag = false;
        }

        //$emailSales = "desta.sena@mncgroup.com";

        // To send HTML mail, the Content-type header must be set
        $headers = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

        // Additional headers
        //$headers .= "To: ".$to. "\r\n";
        $headers .= "From: " . $from . "\r\n";
        if ($flag) {
            $headers .= "Cc: " . $emailSales . "\r\n";
        }
        //$headers .= "Bcc: juanto.azharri@mncgroup.com, callcenter1.mncs@mncgroup.com, callcenter2.mncs@mncgroup.com, callcenter5.mncs@mncgroup.com\r\n";
        $headers .= "Bcc: juanto.azharri@mncgroup.com\r\n";

        $message_to_sales = "
		<html>
		<head>
		  <title>Download New Opening Account Online</title>
		</head>
		<body>
		  <p> Ada akun baru mendaftar untuk kode sales Anda.
			  Berikut link yang dapat didownload : <a href='https://www.mncsekuritas.id/opening_account/print-oa/?id=" . $id . "&email=" . $to . "'>Link Download</a>.
			  Silakan download formulir pembuatan Rekening Dana Nasabah pada <a href='" . $link_rdn . "'>link ini</a>.
		  </p>
		  <!--<p>Download lampiran :</p>
			<p>  <a href='https://www.mncsekuritas.id/po-content/mnc/oa_list/imgGenerator.php?reg_id=" . $id . "&fileType=fileKTP&fileName=fileKTPname'>KTP</a></p>
			<p>  <a href='https://www.mncsekuritas.id/po-content/mnc/oa_list/imgGenerator.php?reg_id=" . $id . "&fileType=fileNPWP&fileName=fileNPWPname'>NPWP</a></p>
			<p>  <a href='https://www.mncsekuritas.id/po-content/mnc/oa_list/imgGenerator.php?reg_id=" . $id . "&fileType=fileREK&fileName=fileREKname'>Cover Buku Rekening</a></p>-->
		</body>
		</html>
	";
        // To send HTML mail, the Content-type header must be set
        $headers_sales = 'MIME-Version: 1.0' . "\r\n";
        $headers_sales .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

        // Additional headers
        $headers_sales .= "To: " . $emailSales . "\r\n";
        $headers_sales .= "From: " . $from . "\r\n";

        mail($to, $subject, $message, $headers);
        if ($flag) {
            mail($query_sales_email->count(), $subject, $message_to_sales, $headers_sales);
        }
    }
}
