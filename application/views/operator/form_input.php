<h3>Tambah Data Operator</h3>
<?php
echo form_open('operator/post');
?>
<table class="table table-bordered">
    <tr><td width="120">Nama Lengkap</td>
        <td><input type="text" class="form-control" name="nama" placeholder="nama lengkap">
       </td></tr>
    <tr><td>Username</td>
        <td><input type="text" class="form-control" name="username" placeholder="username">
       </td></tr>
     <tr><td>Password</td>
        <td><div class="col-sm-3""><input type="password" class="form-control"  name="password" placeholder="password"></div>
       </td></tr>
<tr><td>Level</td>
        <td><div class="col-sm-3"">
                <?php
                $level=array('penjualan'=>'Penjualan','pembelian'=>'Pembelian');
                echo form_dropdown('level',$level,'','class="form-control"');
                ?>
            </div>
       </td></tr>
    <tr><td colspan="2"><button type="submit" class="btn btn-primary btn-sm" name="submit">Simpan</button>
        <?php echo anchor('operator','Kembali',array('class'=>'btn btn-primary btn-sm'))?>
        </td></tr>
</table>
</form>