select  * from ecommercewebsite.supplier where ecommercewebsite.supplier.supp_id in

(select supp_id from ecommercewebsite.supplier_pricing group by supp_id having

count(supp_id)>1)

group by ecommercewebsite.supplier.supp_id;

select ecommercewebsite.customer.cus_name,ecommercewebsite.customer.cus_gender from ecommercewebsite.customer where ecommercewebsite.customer.cus_name like 'A%' or ecommercewebsite.customer.cus_name like '%A';


select ecommercewebsite.product.pro_name, ecommercewebsite.orders.* from ecommercewebsite.orders, ecommercewebsite.supplier_pricing, ecommercewebsite.product

where ecommercewebsite.orders.cus_id=2 and

ecommercewebsite.orders.pricing_id=ecommercewebsite.supplier_pricing.pricing_id and ecommercewebsite.supplier_pricing.pro_id=ecommercewebsite.product.pro_id;



select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from

(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from

(select ecommercewebsite.orders.*, ecommercewebsite.customer.cus_gender, ecommercewebsite.customer.cus_name from ecommercewebsite.orders inner join ecommercewebsite.customer where ecommercewebsite.orders.cus_id=ecommercewebsite.customer.cus_id having ecommercewebsite.orders.ord_amount>=3000)

as t1 group by t1.cus_id) as t2 group by t2.cus_gender;



select ecommercewebsite.category.cat_id,ecommercewebsite.category.cat_name, min(t3.min_price) as Min_Price from ecommercewebsite.category inner join

(select ecommercewebsite.product.cat_id, ecommercewebsite.product.pro_name, t2.* from ecommercewebsite.product inner join

(select pro_id, min(supp_price) as Min_Price from ecommercewebsite.supplier_pricing group by pro_id)

as t2 where t2.pro_id = ecommercewebsite.product.pro_id)

as t3 where t3.cat_id = ecommercewebsite.category.cat_id group by t3.cat_id;


