<?php
// include database connection file
include_once("connection.php");

// Get id from URL to delete that user
$id_barang = $_GET['id_barang'];

// Delete user row from table based on given id
$result = mysqli_query($koneksi, "DELETE FROM tbl_barang WHERE id_barang='$id_barang'");

// After delete redirect to Home, so that latest user list will be displayed.
header("Location:index.php");
