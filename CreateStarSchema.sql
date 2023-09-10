USE [DWH practice]

-- Dimension Tables
CREATE TABLE [Dim_Date] (
    [date_key] INT PRIMARY KEY IDENTITY(1,1) not null,
    [full_date] DATE,
    [calender_year] DATE,
	[calender_quarter] DATE,
	[calendar_month_num]  INT NOT NULL,
    [calendar_month_name] NVARCHAR(15)
);


CREATE TABLE [Dim_Product] (
	[product_key] INT IDENTITY(1,1) PRIMARY KEY not null,  -- surrogate key
    [product_id] INT not null, -- business key
    [product_name] NVARCHAR(50),
    [Product_description] NVARCHAR(400),
    [product_subcategory] NVARCHAR(50),
    [product_category] NVARCHAR(50),
    [color] NVARCHAR(15),
    [model_name] NVARCHAR(50),
    [reorder_point] SMALLINT,
    [standard_cost] MONEY,
    [source_system_code] TINYINT not null,
    [start_date] DATETIME not null DEFAULT (Getdate()),
    [end_date] DATETIME,
    [is_current] TINYINT not null DEFAULT(1),
);


CREATE TABLE [Dim_Customer] (
	[customer_key] INT IDENTITY(1,1) PRIMARY KEY not null,
    [customer_id] INT not null,
    [customer_name] NVARCHAR(150),
    [address1] NVARCHAR(100),
    [address2] NVARCHAR(100),
    [city] NVARCHAR(30),
    [phone] NVARCHAR(25),
    [source_system_code] TINYINT not null,
    [start_date] DATETIME not null DEFAULT (Getdate()),
    [end_date] DATETIME null,
    [is_current] TINYINT not null DEFAULT (1),
);


CREATE TABLE [Dim_Territory] (
    [territory_key] INT IDENTITY(1,1) PRIMARY KEY not null,
    [territory_id] INT not null,
    [territory_name] NVARCHAR(50),
    [territory_country] NVARCHAR(400),
    [territory_group] VARCHAR(50),
    [source_system_code] TINYINT not null,
    [start_date] DATETIME not null DEFAULT(Getdate()),
    [end_date] DATETIME,
    [is_current] TINYINT not null DEFAULT (1),
);




-- Fact Table
CREATE TABLE fact_sales
  (
    [product_key] INT not null,
    [customer_key] INT not null,
    [territory_key] INT not null,
    [order_date_key] INT not null,
    [sales_order_id] VARCHAR(50) not null,
    [line_number] INT not null,
    [quantity] INT,
    [unit_price] MONEY,
    [unit_cost] MONEY,
    [tax_amount] MONEY,
    [freight] MONEY,
    [extended_sales] MONEY,
    [extened_cost] MONEY,
    [created_at] DATETIME not null DEFAULT(Getdate()),

	FOREIGN KEY (order_date_key) REFERENCES Dim_Date(date_key),
	FOREIGN KEY (product_key) REFERENCES Dim_Product(product_key),
	FOREIGN KEY (customer_key) REFERENCES Dim_Customer(customer_key),
	FOREIGN KEY (territory_key) REFERENCES Dim_Territory(territory_key)
	);

