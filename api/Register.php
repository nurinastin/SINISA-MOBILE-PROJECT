<?php 
include "helper/database.php";
if($_SERVER['REQUEST_METHOD'] == "POST"){
    $d = $_POST;
    $nik = $d['nik'];
    $nama = $d['nama'];
    $alamat = $d['alamat'];
    $username = $d['username'];
    $password = $d['password']; 
    $cek_nik = Select("*", "user", "WHERE nik='$nik'");
    if(count($cek_nik) > 0){
        $response = [
            'message' => 'Nik sudah terpakai'
        ];
    }else{
        $arr = [
            'nik' => $nik, 
            'nama' =>$nama,
            'alamat' =>$alamat,
            'username' =>$username,
            'password' =>$password,
            'level' => 'user',
            'grup' => 2
        ];
        insert($arr, 'user');
        $response = [
            'message' => 'Berhasil Mendaftar'
        ];
    }
}else{
    $response = ['message' => "method tidak di ijinkan"];
}
echo json_encode($response);
?>