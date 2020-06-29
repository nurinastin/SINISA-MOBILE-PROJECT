<?php 
include "helper/database.php";
if($_SERVER['REQUEST_METHOD'] == "GET" || $_SERVER['REQUEST_METHOD'] == "POST"){
    if ($_GET['type'] == 'list' && $_SERVER['REQUEST_METHOD'] == "GET") {
        $data = select("*", "penyuluhan");
        $response = ['message' => "Data Penyuluhan", 'data' => $data];
    }else if($_GET['type'] == 'add' && $_SERVER['REQUEST_METHOD'] == "POST"){
        $d = $_POST;
        $arr = [
            'nama' => $d['nama'] ,
            'nama_instansi' =>$d['nama_instansi'],
            'status' =>"Belum Dikonfirmasi",
            'tanggal_input' =>$d['tanggal_input'],
            'tanggal_output' =>$d['tanggal_output'],
            'materi' => $d['materi']
        ];
        insert($arr, 'penyuluhan');
        $response = [
            'message' => 'Pengajuan Berhasil'
        ];
    }
}else{
    $response = ['message' => "method tidak di ijinkan"];
}
echo json_encode($response);
?>