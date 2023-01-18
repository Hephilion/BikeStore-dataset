SELECT ord.order_id, 
CONCAT(cus.first_name,' ',cus.last_name) AS 'Name',
cus.city, 
cus.state,
ord.order_date,
SUM(ord_item.quantity) AS 'total_units', # Total Units 
SUM(ord_item.quantity*ord_item.list_price) AS 'Revenue',
prod.product_name,
cat.category_name,
brands.brand_name,
store.store_name,
CONCAT(staff.first_name, ' ',staff.last_name) AS 'sales_rep' 
FROM (sales.customers cus
JOIN  sales.orders ord ON cus.customer_id = ord.customer_id)
JOIN sales.order_items ord_item ON ord.order_id = ord_item.order_id 
JOIN production.products prod ON prod.product_id = ord_item.product_id
JOIN production.categories cat ON cat.category_id = prod.category_id
JOIN sales.stores store ON store.store_id = ord.store_id
JOIN sales.staffs staff ON staff.staff_id = ord.staff_id
JOIN production.brands brands ON brands.brand_id = prod.brand_id
GROUP BY ord.order_id, 
CONCAT(cus.first_name,' ',cus.last_name),
cus.city, 
cus.state,
ord.order_date,
prod.product_name,
cat.category_name,
brands.brand_name,
store.store_name,
CONCAT(staff.first_name, ' ',staff.last_name) 
ORDER BY ord.order_id;