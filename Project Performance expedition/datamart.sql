use miniproject_1;

#Membuat datamart
create table datamart
select a.id, a.expedition, a. mode_of_shipment, a. cost_of_the_product, a. customer_care_calls, a. customer_rating, a. prior_purchases, a. product_importance, a. weight_in_gms, a. delay_or_ontime, a. gender, a. discount_offered, b. province
from courier as a
left join mapping_provinsi as b
on a. province_code = b. province_code;

#Untuk menyimpan file csv  melalui sintak di MySQL karena kalau eksport biasa ada limit 1000
SELECT * INTO OUTFILE 'Datamart_expedition.csv'
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
FROM datamart;