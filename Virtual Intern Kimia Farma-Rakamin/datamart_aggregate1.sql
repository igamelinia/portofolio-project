use internship;

select * from datamart_aggregate;

show create table datamart_aggregate;

Create table datamart_aggregate
Select id_barang, sum(harga) as harga_total, count(distinct id_customer) as total_customer, count(distinct id_cabang) as total_cabang
From datamart_base1
Group by id_barang
order by harga_total;

