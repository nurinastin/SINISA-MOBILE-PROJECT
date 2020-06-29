<?php 
include "helper/database.php";
if($_SERVER['REQUEST_METHOD'] == "GET" || $_SERVER['REQUEST_METHOD'] == "POST"){
    if ($_GET['type'] == 'list' && $_SERVER['REQUEST_METHOD'] == "GET") {
        $data = select("*", "barang");
        $response = ['message' => "Data Barang", 'data' => $data];
    }else if ($_GET['type'] == 'detail' && $_SERVER['REQUEST_METHOD'] == "GET") {
        $id = $_GET['id'];
        $data = select("*", "barang", "WHERE id_barang='$id'");
        $response = ['message' => "Data Barang", 'data' => $data[0]];
    }else if($_GET['type'] == 'add' && $_SERVER['REQUEST_METHOD'] == "POST"){
        $d = $_POST;
        $arr = [
            'nama_barang' =>$d['nama_barang'],
            'harga' =>$d['harga'],
            'stok' =>$d['stok'],
            'gambar' =>$d['gambar'],
        ];
        insert($arr, 'barang');
        $response = [
            'message' => 'Tambah Barang Berhasil'
        ];
    }
}else{
    $response = ['message' => "method tidak di ijinkan"];
}
echo json_encode($response);
?>