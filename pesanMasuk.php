<?php
require_once('header.php');
require_once('config/database.php');
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
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
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Nomor Tujuan</th>
                  <th>Waktu Kirim</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
				<?php
				$query = "SELECT * FROM tb_pesan_keluar";
				$hasil = mysqli_query($koneksi,$query);
				$num=1;
				while($row = mysqli_fetch_array($hasil)){
					?>
					<tr>
					  <td><?php echo $num; ?></td>
					  <td><?php echo $row['nomortujuan']; ?></td>
					  <td><?php echo $row['waktu_kirim']; ?></td>
					  <td align="center"><?php if($row['status']=='success'){
						  echo '<button type="button" class="btn btn-info btn-xs">Sukses Terkirim</button>';
					  }else if($row['status']=='error'){
						  $pesan_error = $row['status_informasi'];
						  echo '<button type="button" class="btn btn-danger btn-xs">Gagal Terkirim <br/>['.$pesan_error.']</button>';
					  }else{
						  echo '<button type="button" class="btn btn-default btn-xs">Pesan Tidak Diketahui</button>';
					  } ?></td>
					</tr>
					<?php
				$num++;	
				}
				?>
                </tbody>
                <tfoot>
                <tr>
                  <th>No</th>
                  <th>Nomor Tujuan</th>
                  <th>Waktu Kirim</th>
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