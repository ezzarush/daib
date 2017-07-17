<?php
require_once('header.php');
require_once('config/database.php');
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Manajemen Pesanan
        <small>Panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Manajemen Pesanan</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    
	   <!-- Small boxes (Stat box) -->
      <div class="row">
        <!-- ./col -->
        <div class="col-lg-12 col-xs-12">
          
		<div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>ID Pemesanan</th>
                  <th>Tanggal Pemesanan</th>
                  <th>ID Pelanggan</th>
                  <th>Ozon</th>
                  <th>Ro</th>
                  <th>Conv</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
				<?php
				$query = "SELECT * FROM tb_pemesanan_new";
				$hasil = mysqli_query($koneksi,$query);
				$num=1;
				while($row = mysqli_fetch_array($hasil)){
					?>
					<tr>
					  <td><?php echo $num; ?></td>
					  <td><?php echo $row['id_pemesanan']; ?></td>
					  <td><?php echo $row['tgl_pemesanan']; ?></td>
					  <td><?php echo $row['id_pelanggan']; ?></td>
					  <td><?php echo $row['ozon']; ?></td>
					  <td><?php echo $row['ro']; ?></td>
					  <td><?php echo $row['conv']; ?></td>
					  <td><?php echo $row['status']; ?></td>
					</tr>
					<?php
				$num++;	
				}
				?>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>ID Pemesanan</th>
                  <th>Tanggal Pemesanan</th>
                  <th>ID Pelanggan</th>
                  <th>Ozon</th>
                  <th>Ro</th>
                  <th>Conv</th>
                  <th>Status</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
		  
        </div>
        
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
<?php
require_once('footer.php');
?>
<script>
$(function () {
    $("#example1").DataTable();
  });
</script>