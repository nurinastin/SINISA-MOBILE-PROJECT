<?php 
include "helper/database.php";
if($_SERVER['REQUEST_METHOD'] == "GET" || $_SERVER['REQUEST_METHOD'] == "POST"){
    if ($_GET['type'] == 'list' && $_SERVER['REQUEST_METHOD'] == "GET") {
        $nik = $_GET['nik'];
        $data = select("*", "sewa", "WHERE nik='$nik'");
        $response = ['message' => "Data Barang", 'data' => $data];
    }else if ($_GET['type'] == 'detail' && $_SERVER['REQUEST_METHOD'] == "GET") {
        $id = $_GET['id'];
        $data = select("*", "sewa", "WHERE id_barang='$id'");
        $response = ['message' => "Data Barang", 'data' => $data[0]];
    }else if($_GET['type'] == 'add' && $_SERVER['REQUEST_METHOD'] == "POST"){
        $d = $_POST;
        $arr = [
            'nik' =>$d['nik'],
            'nama' =>$d['nama'],
            'no_telepon' =>$d['no_telepon'],
            'nama_barang' =>$d['nama_barang'],  
            'id_barang' =>$d['id_barang'],
            'tanggal_sewa' =>date('Y-m-d'),
            'tanggal_kembali' =>$d['tanggal_kembali'],
            'jumlah_hari' =>$d['jumlah_hari'],
            'harga_sewa' =>$d['harga_sewa'],
            'asal' =>$d['asal'],
            'alamat' =>$d['alamat'],
        ];
        insert($arr, 'sewa');
        $response = [
            'message' => 'Sewa Barang Berhasil'
        ];
    }
}else{
    $response = ['message' => "method tidak di ijinkan"];
}
echo json_encode($response);
?>