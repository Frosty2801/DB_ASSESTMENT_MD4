-- DROP SCHEMA daniel_gutierrez;

CREATE SCHEMA daniel_gutierrez AUTHORIZATION riwi_cohorte_6;
-- daniel_gutierrez.categories definition

-- Drop table

-- DROP TABLE daniel_gutierrez.categories;

CREATE TABLE daniel_gutierrez.categories (
	id_category uuid DEFAULT gen_random_uuid() NOT NULL,
	name_category varchar(100) NOT NULL,
	CONSTRAINT categories_pkey PRIMARY KEY (id_category)
);


-- daniel_gutierrez.customers definition

-- Drop table

-- DROP TABLE daniel_gutierrez.customers;

CREATE TABLE daniel_gutierrez.customers (
	id_customer uuid DEFAULT gen_random_uuid() NOT NULL,
	name_customer varchar(100) NOT NULL,
	email_customer varchar(100) NOT NULL,
	phone_customer varchar(50) NOT NULL,
	CONSTRAINT customers_email_customer_key UNIQUE (email_customer),
	CONSTRAINT customers_pkey PRIMARY KEY (id_customer)
);


-- daniel_gutierrez.directions definition

-- Drop table

-- DROP TABLE daniel_gutierrez.directions;

CREATE TABLE daniel_gutierrez.directions (
	id_direction uuid DEFAULT gen_random_uuid() NOT NULL,
	id_customer uuid NOT NULL,
	direction varchar(200) NOT NULL,
	CONSTRAINT directions_pkey PRIMARY KEY (id_direction)
);


-- daniel_gutierrez.pm_prueba_desempeno_data_m4 definition

-- Drop table

-- DROP TABLE daniel_gutierrez.pm_prueba_desempeno_data_m4;

CREATE TABLE daniel_gutierrez.pm_prueba_desempeno_data_m4 (
	transaction_id varchar(50) NULL,
	"date" varchar(50) NULL,
	customer_name varchar(50) NULL,
	customer_email varchar(50) NULL,
	customer_address varchar(50) NULL,
	customer_phone varchar NULL,
	product_category varchar(50) NULL,
	product_sku varchar(50) NULL,
	product_name varchar(50) NULL,
	unit_price varchar NULL,
	quantity varchar NULL,
	total_line_value varchar NULL,
	supplier_name varchar(50) NULL,
	supplier_email varchar(50) NULL
);


-- daniel_gutierrez.suppliers definition

-- Drop table

-- DROP TABLE daniel_gutierrez.suppliers;

CREATE TABLE daniel_gutierrez.suppliers (
	id_supplier uuid DEFAULT gen_random_uuid() NOT NULL,
	name_supplier varchar(50) NOT NULL,
	email_supplier varchar(100) NOT NULL,
	CONSTRAINT suppliers_name_supplier_key UNIQUE (name_supplier),
	CONSTRAINT suppliers_pkey PRIMARY KEY (id_supplier)
);


-- daniel_gutierrez.products definition

-- Drop table

-- DROP TABLE daniel_gutierrez.products;

CREATE TABLE daniel_gutierrez.products (
	id_product uuid DEFAULT gen_random_uuid() NOT NULL,
	sku_product varchar(20) NOT NULL,
	name_product varchar(100) NOT NULL,
	category_product uuid NOT NULL,
	id_supplier uuid NOT NULL,
	CONSTRAINT products_pkey PRIMARY KEY (id_product),
	CONSTRAINT products_sku_product_key UNIQUE (sku_product),
	CONSTRAINT products_category_product_fkey FOREIGN KEY (category_product) REFERENCES daniel_gutierrez.categories(id_category) DEFERRABLE,
	CONSTRAINT products_id_supplier_fkey FOREIGN KEY (id_supplier) REFERENCES daniel_gutierrez.suppliers(id_supplier) DEFERRABLE
);


-- daniel_gutierrez.transactions definition

-- Drop table

-- DROP TABLE daniel_gutierrez.transactions;

CREATE TABLE daniel_gutierrez.transactions (
	id_transaction uuid DEFAULT gen_random_uuid() NOT NULL,
	code_transaction varchar(100) NOT NULL,
	id_customer uuid NOT NULL,
	transaction_date date NOT NULL,
	CONSTRAINT transactions_pkey PRIMARY KEY (id_transaction),
	CONSTRAINT transactions_id_customer_fkey FOREIGN KEY (id_customer) REFERENCES daniel_gutierrez.customers(id_customer) DEFERRABLE
);


-- daniel_gutierrez.order_details definition

-- Drop table

-- DROP TABLE daniel_gutierrez.order_details;

CREATE TABLE daniel_gutierrez.order_details (
	id_order uuid DEFAULT gen_random_uuid() NOT NULL,
	id_transaction uuid NOT NULL,
	id_product uuid NOT NULL,
	unit_price numeric NOT NULL,
	quantity int4 NOT NULL,
	total_line_value numeric NOT NULL,
	CONSTRAINT order_details_pkey PRIMARY KEY (id_order),
	CONSTRAINT order_details_id_product_fkey FOREIGN KEY (id_product) REFERENCES daniel_gutierrez.products(id_product) DEFERRABLE,
	CONSTRAINT order_details_id_transaction_fkey FOREIGN KEY (id_transaction) REFERENCES daniel_gutierrez.transactions(id_transaction) DEFERRABLE
);