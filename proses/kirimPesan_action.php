<?php
require_once('../config/database.php');
require_once('../config/Mesabot.php');

//ASSIGNTMENT
$kirimPesanOpsi = $_POST['kirimPesanOpsi'];
$pesan = $_POST['pesan'];
$nomorTujuan = null;
$process_id = uniqid();
$waktu_kirim = date('Y-m-d H:m:s');
$data=null;

define("MESABOT_TOKEN", "YblgsQ9EgwJuS4piAfBMm5S9Yl2rZ7HFSaXqcVww");

//CEK INDIVIDU ATAU BROADCAST
if($kirimPesanOpsi == 'individu'){
	$nomorTujuan = $_POST['nomorTujuan'];
	//INSERT KE TABLE PESAN KELUAR INDIVIDU
	$query = "INSERT INTO tb_pesan_keluar(process_id,nomorTujuan,pesan,waktu_kirim) VALUE('$process_id','$nomorTujuan','$pesan','$waktu_kirim')";
	mysqli_query($koneksi,$query);
	
	$data = array(
		'destination'	=> $nomorTujuan,
		'text'			=> $pesan
	);
	
}else{
	$query = "SELECT hp_pelanggan FROM tb_pelanggan_new";
	$result = mysqli_query($koneksi,$query);
	while($row = mysqli_fetch_array($result)){
		$tujuan1 	= $row[0];
		$tujuan2[] 	= $row[0];
		
		//INSERT KE TABLE PESAN KELUAR BROADCAST
		$query = "INSERT INTO tb_pesan_keluar(process_id,nomorTujuan,pesan,waktu_kirim) VALUES('$process_id','$tujuan1','$pesan','$waktu_kirim')";
		mysqli_query($koneksi,$query);
	}
	$nomorTujuan = rtrim($nomorTujuan,", ");
	$data = array(
		// 'destination'	=> $nomorTujuan,
		'destination'	=> $tujuan2,
		'text'			=> $pesan
	);
}

$mesabot = new Mesabot();
$mesabot->sms($data,'messages','POST');

$status = $mesabot->response()->messages['status'];

//UPDATE STATUS KIRIMAN
if($status == 'success'){
	//KALAU SUKSES TERKIRIM
	$query = "UPDATE tb_pesan_keluar SET status='$status' WHERE process_id='$process_id'";
	mysqli_query($koneksi,$query);
}else{
	//KALAU ERROR TERKIRIM
	$status_informasi = $mesabot->response()->messages['message'];
	$query = "UPDATE tb_pesan_keluar SET status='$status',status_informasi='$status_informasi' WHERE process_id='$process_id'";
	mysqli_query($koneksi,$query);
}

$home_url = 'http://' . $_SERVER['HTTP_HOST'] . '/unda/pesanTerkirim.php';
header('Location: ' . $home_url);

?>