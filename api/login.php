<?php 
include "helper/database.php";
if($_SERVER['REQUEST_METHOD'] == "POST"){
    $d = $_POST;
    $username = $d['username'];
    $password = $d['password'];
    // $q = mysqli_query
    $user = Select("*", "user", "WHERE username='$username' AND password='$password'");
    if(count($user) > 0){
        $response = [
            'data' => $user[0],
            'message' => 'Login Berhasil'
        ];
    }else{
        $response = [
            'data' => null,
            'message' => 'Login Gagal. cek username dan password anda'
        ];
    }
}else{
    $response = ['message' => "method tidak di ijinkan"];
}
echo json_encode($response);
?>