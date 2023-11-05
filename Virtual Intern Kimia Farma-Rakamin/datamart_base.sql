use internship ;

#Membuat Datamart
#Datamart : table yang hanya berisi column-column yg digunakan 
Create table datamart_base1
Select a.id_barang, c.nama_barang, a.jumlah_barang, a. unit, 	a.harga as harga_satuan, a.id_customer, a.id_cabang, 	b.cabang_sales, b.nama, b.grup, a.tanggal, a.lini
From penjualan as a join pelanggan as b 
on a.id_customer = b.id_customers
Join barang as c
on a.id_barang = c.kode_barang 
where id_barang = 'BRG0005' or id_barang = 'BRG0010' ;

#Melihat dan observasi table datamart
select * from datamart_base1;

show create table datamart_base1;

#Menambah column yg diperlukan :
#isi_unit :Berisi jumlah product dalam 1 unit
#total_barang :Berisi jumlah total barang yang dibeli
#harga :Berisi total harga 

alter table datamart_base1
add column isi_unit int ;

alter table datamart_base1
modify isi_unit int after unit;

Update datamart_base1
Set isi_unit = 10
Where id_barang = 'BRG0005';

Update datamart_base1
Set isi_unit = 1
Where id_barang = 'BRG0010';

alter table datamart_base1
add column total_barang int,
add column harga int;

alter table datamart_base1
modify total_barang int after isi_unit,
modify harga int after harga_satuan;

update datamart_base1
set total_barang = jumlah_barang*isi_unit ;

update datamart_base1
set harga = total_barang * harga_satuan ;
