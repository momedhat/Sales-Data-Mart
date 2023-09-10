# Sales Data Mart Using SSIS

## Project Description:
Building Sales Data Mart using SSIS and SQL Server 
Designing a data mart utilize the power of SSIS (SQL Server Integration Services) and SQL Server, using the AdventureWorks2022 database, an OLTP (Online Transaction Processing) system, as the primary data source, a widely recognized database in the realm of data analysis.

A data mart is a focused and purpose-built subset of a data warehouse, designed to cater to the specific analytical needs of a particular department, team, or business unit within an organization. Data marts are typically structured around a dimensional model, employing star schemas, which consist of dimension tables describing various attributes and a central fact table containing numerical measures. 

Key Project Tasks:
* Data Extraction from AdventureWorks2022 (OLTP)
* Cleanse and preprocess extracted data to ensure data quality.
* Design the star schema for data mart.
* Develop ETL (Extract, Transform, Load) processes using SSIS or other ETL tools.


## Data source:
>This link provides the AdventureWorks databases.<br>
>**link**: [AdventureWorks Database](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)<br>


## Steps with snapshots:
First, I used SQL server to design the data warehouse structure, employing star schema.<br>
- Fact Table : **Sales**<br>
- Dimentions : **Customer** , **Product** , **Territory** , **Date** <br>

![Star Schema](/Snapshot/StarSchemaSnapshot.png) <br><br>

Then, I used SSIS to create Fact table and the dimention packages separately for: 
- Integrating the data from data source.
- Transforming and processing data.
- And then load data after applying the transformation, and apply full and slow-changing dimension (SCD) loading.<br><br>

### DimCustomer
![DimCustomer](/Snapshot/DimCustomer.png) <br><br>
#### DimCustomer Resultset
![DimCustomerResult](/Snapshot/DimCustomerResult.png) <br><br>


### DimProduct
![DimProduct](/Snapshot/DimProduct.png) <br><br>
#### DimProduct Resultset
![DimProductResult](/Snapshot/DimProductResult.png) <br><br>


### DimTerritory
![DimTerritory](/Snapshot/DimTerritory.png) <br><br>
#### DimCustomer Resultset
![DimTerritoryResult](/Snapshot/DimTerritoryResult.png) <br><br>


### DimDate
![DimDate](/Snapshot/DimDate.png) <br><br>
#### DimCustomer Resultset
![DimDateResult](/Snapshot/DimDateResult.png) <br><br>


### FactSales
![FactSales](/Snapshot/FactSales.png) <br><br>
#### DimCustomer Resultset
![FactSalesResult](/Snapshot/FactSalesResult.png) <br><br>




