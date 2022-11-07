<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <title>Praktikum Antar Muka</title>
</head>

<body>
  <div class="container">
    <center>
      <h2>
        Daftar Barang
      </h2>
    </center>
    <a href="create_barang.php" class="btn btn-success btn-lg " tabindex="-1" role="button" aria-disabled="true">Tambah Data</a>
    <table class="table table-hover-dark">
      <thead class="thead-dark">
        <tr>
          <th scope="col">No.</th>
          <th scope="col">ID Barang</th>
          <th scope="col">Nama</th>
          <th scope="col">Harga</th>
          <th scope="col">Stok</th>
          <th scope="col">Jenis</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
        <?php
        require 'connection.php';
        $hasil = mysqli_query($koneksi, "SELECT * FROM tbl_barang")
        ?>
        <?php
        $no = 1;
        while ($data = mysqli_fetch_array($hasil)) {
          echo "<tr>";
          echo "<th>" . $no . "</th>";
          echo "<td>" . $data['id_barang'] . "</td>";
          echo "<td>" . $data['nama'] . "</td>";
          echo "<td>" . $data['harga'] . "</td>";
          echo "<td>" . $data['stok'] . "</td>";
          echo "<td>" . $data['jenis'] . "</td>";
          echo "<td>
            <a href='edit_barang.php?id_barang=$data[id_barang]' class='btn btn-warning btn-sm' style='font-weight: 600;'>Edit</a>|
            <a href='delete_barang.php?id_barang=$data[id_barang] ' class='btn btn-danger btn-sm' style='font-weight: 600;'>Delete</a>
            </td>";
          echo "</tr>";
          $no++;
        }
        ?>
      </tbody>
    </table>
  </div>

</body>

</html>