<?php 
include "../koneksi.php";
function Select($col, $table, $one = '', $two = '') {
    global $host;
    $result = "";
    $q2 = "SELECT $col FROM $table $one $two";
    $res = mysqli_query($host, $q2);
    $data = [];
    
    foreach ($res as $q) {
        $data[] = $q;
    }
    return $data;
}
function insert($data, $table){
    global $host;
    $q = "INSERT INTO ". $table ." (".implode(',', array_keys($data)).") VALUES ('".implode("', '", array_values($data))."')";
    $qu = mysqli_query($host, $q)or die(mysqli_error($host));
    if ($qu) {
      return true;
    }else{
      return false;
    }
  }
?>