<?php
//Pesan Masuk dan Main Function

require_once('../config/database.php');
require_once('../config/Mesabot.php');

define("MESABOT_TOKEN", "YblgsQ9EgwJuS4piAfBMm5S9Yl2rZ7HFSaXqcVww");

$mesabot = new Mesabot();
$mesabot->sms('','inbox','GET');

//VALIDATE EXISTING
if($mesabot->response()->status_code===200){
	$messages = $mesabot->response()->messages['data'];
	// print_r($messages);die;
	for($i=0;count($messages)>$i;$i++){
		$id_pesan_mesabot 	= $messages[$i]['id'];
		$text 				= $messages[$i]['text'];
		$pengirim 			= $messages[$i]['number'];
		$status_mesabot		= $messages[$i]['status'];
		$created_at			= $messages[$i]['created_at'];
		$updated_at			= $messages[$i]['updated_at'];
		
		//If Not Exist Then Insert
		$query = "SELECT id_pesan_mesabot FROM tb_pesan_masuk WHERE id_pesan_mesabot=$id_pesan_mesabot";
		$result = mysqli_query($koneksi,$query);
		if(mysqli_num_rows($result)===0){
			
			//Insert to inbox local
			$query = "INSERT INTO tb_pesan_masuk(id_pesan_mesabot,text,pengirim,status_mesabot,created_at_mesabot,updated_at_mesabot) VALUES ('$id_pesan_mesabot','$text','$pengirim','$status_mesabot','$created_at','$updated_at')";
			mysqli_query($koneksi,$query);
			
			//cek content text
			$teks 			= explode("#",$text);
			if($teks[0]=='DAIB'){
				$id_pemesanan = $teks[1];
				$query	= "SELECT * FROM tb_pemesanan_new a JOIN tb_pelanggan_new b ON b.id_pelanggan=a.id_pelanggan WHERE id_pemesanan=$id_pemesanan";
				$result = mysqli_query($koneksi,$query);
				if(mysqli_num_rows($result)===1){
					//ID PEMESANAN DITEMUKAN KIRIM SMS STATUS PEMESANAN
					$result = mysqli_fetch_array($result);
					$status = $result['status'];
					$nama_pelanggan = $result['nama_pelanggan'];
					$data = array(
							'destination'	=> $pengirim,
							'text'			=> "Ysh $nama_pelanggan , Status Pesanan Anda: $status . Terima Kasih (DAIB)"
						);
					$mesabot->sms($data,'messages','POST');
					
					//Update status local
					$query = "UPDATE tb_pesan_masuk SET status_local='ID Berhasil Ditemukan' WHERE id_pesan_mesabot='$id_pesan_mesabot'";
					mysqli_query($koneksi,$query);
				}else{
					//ID PEMESANAN TIDAK DITEMUKAN
					$data = array(
							'destination'	=> $pengirim,
							'text'			=> "Maaf, ID Pemesanan Tidak Ditemukan"
						);
					$mesabot->sms($data,'messages','POST');
					
					//Update status local
					$query = "UPDATE tb_pesan_masuk SET status_local='ID Tidak Berhasil Ditemukan' WHERE id_pesan_mesabot='$id_pesan_mesabot'";
					mysqli_query($koneksi,$query);
				}
			}else{
				$data = array(
						'destination'	=> $pengirim,
						'text'			=> "Maaf, Format Salah"
					);
				$mesabot->sms($data,'messages','POST');
				
					//Update status local
					$query = "UPDATE tb_pesan_masuk SET status_local='Format Salah' WHERE id_pesan_mesabot='$id_pesan_mesabot'";
					mysqli_query($koneksi,$query);
			}
		}
	}
}


?>