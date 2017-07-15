<?php
require_once('header.php');
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        &nbsp;
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Kirim Pesan</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    
	   <!-- Small boxes (Stat box) -->
      <div class="row">
        <!-- ./col -->
        <div class="col-lg-12 col-xs-12">
        
		<form action="proses/kirimPesan_action.php" method="POST">  
			<div class="box box-primary">
				<div class="box-header with-border">
				  <h3 class="box-title">Kirim Pesan Baru</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<label>Kirim Pesan Opsi:</label>
					<div class="form-group">
					  <div class="radio">
						<label>
						  <input type="radio" name="kirimPesanOpsi" id="kirimPesanOpsi1" value="individu" checked>
						  Individu
						</label>
					  </div>
					  <div class="radio">
						<label>
						  <input type="radio" name="kirimPesanOpsi" id="kirimPesanOpsi2" value="broadcast">
						  Broadcast (Semua Nomor)
						</label>
					  </div>
					</div>
				  <div class="form-group">
				  <label>Masukkan Nomor Tujuan:</label>
					<input type="number" id="idNomorTujuan" class="form-control" name="nomorTujuan" required placeholder="Contoh: 0812 3456 7899">
				  </div>
				  <div class="form-group">
						<textarea required id="compose-textarea" name="pesan" class="form-control" style="height: 300px"></textarea>
				  </div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
				  <div class="pull-right">
					<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> Kirim Sekarang</button>
				  </div>	
				</div>
				<!-- /.box-footer -->
			</div>
		</form>
		  
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
  $("#kirimPesanOpsi1").click(function(){
	  $("#idNomorTujuan").attr("disabled",false);
  })
  $("#kirimPesanOpsi2").click(function(){
	  $("#idNomorTujuan").attr("disabled",true);
  })
</script>