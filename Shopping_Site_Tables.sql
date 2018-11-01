- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-09-28 01:39:05.498

-- tables
-- Table: Bill
CREATE TABLE Bill (
    billID integer  NOT NULL,
    billDate date  NOT NULL,
    billDeliveryDate date  NOT NULL,
    errandID integer  NOT NULL,
    CONSTRAINT Bill_pk PRIMARY KEY (billID)
) ;

-- Table: Bill_Detail
CREATE TABLE Bill_Detail (
    billID integer  NOT NULL,
    productID integer  NOT NULL,
    bDetailQuantity smallint  NOT NULL,
    bDetailPrice numeric(8,2)  NOT NULL,
    CONSTRAINT Bill_Detail_pk PRIMARY KEY (billID,productID)
) ;

-- Table: Catalogue
CREATE TABLE Catalogue (
    catalogueID integer  NOT NULL,
    catalogueSdate date  NOT NULL,
    catalogueEdate date  NOT NULL,
    CONSTRAINT Catalogue_pk PRIMARY KEY (catalogueID)
) ;

-- Table: Catalogue_Detail
CREATE TABLE Catalogue_Detail (
    catalogueID integer  NOT NULL,
    productID integer  NOT NULL,
    cDetailPrice numeric(5,2)  NOT NULL,
    cDetailQuantity smallint  NOT NULL,
    CONSTRAINT Catalogue_Detail_pk PRIMARY KEY (catalogueID,productID)
) ;

-- Table: Category
CREATE TABLE Category (
    categoryID integer  NOT NULL,
    categoryName nchar(15)  NOT NULL,
    pTypeID integer  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY (categoryID)
) ;

-- Table: City
CREATE TABLE City (
    cityID integer  NOT NULL,
    cityName nchar(30)  NOT NULL,
    deptID integer  NOT NULL,
    CONSTRAINT City_pk PRIMARY KEY (cityID)
) ;

-- Table: Client
CREATE TABLE Client (
    clientID integer  NOT NULL,
    clientName nchar(20)  NOT NULL,
    clientEmail nchar(30)  NOT NULL,
    clientPhone nchar(10)  NOT NULL,
    clientAddress varchar2(15)  NOT NULL,
    cityID integer  NOT NULL,
    cTypeID integer  NOT NULL,
    cEntityID integer  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY (clientID)
) ;

-- Table: Client_Entity
CREATE TABLE Client_Entity (
    cEntityID integer  NOT NULL,
    cEntityName nchar(15)  NOT NULL,
    CONSTRAINT Client_Entity_pk PRIMARY KEY (cEntityID)
) ;

-- Table: Client_Type
CREATE TABLE Client_Type (
    cTypeID integer  NOT NULL,
    cTypeName nchar(15)  NOT NULL,
    cTypeDiscount smallint  NOT NULL,
    CONSTRAINT Client_Type_pk PRIMARY KEY (cTypeID)
) ;

-- Table: Country
CREATE TABLE Country (
    countryID integer  NOT NULL,
    countryName nchar(20)  NOT NULL,
    CONSTRAINT countryID PRIMARY KEY (countryID)
) ;

-- Table: Department
CREATE TABLE Department (
    deptID integer  NOT NULL,
    deptName nchar(30)  NOT NULL,
    countryID integer  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (deptID)
) ;

-- Table: Envelope
CREATE TABLE Envelope (
    envelopeID integer  NOT NULL,
    envelopeName nchar(15)  NOT NULL,
    CONSTRAINT Envelope_pk PRIMARY KEY (envelopeID)
) ;

-- Table: Errand
CREATE TABLE Errand (
    errandID integer  NOT NULL,
    errandDate date  NOT NULL,
    clientID integer  NOT NULL,
    eStateID integer  NOT NULL,
    CONSTRAINT Errand_pk PRIMARY KEY (errandID)
) ;

-- Table: Errand_Detail
CREATE TABLE Errand_Detail (
    errandID integer  NOT NULL,
    productID integer  NOT NULL,
    eDetailQuantity smallint  NOT NULL,
    eDetailPrice numeric(8,2)  NOT NULL,
    CONSTRAINT Errand_Detail_pk PRIMARY KEY (errandID,productID)
) ;

-- Table: Errand_State
CREATE TABLE Errand_State (
    eStateID integer  NOT NULL,
    eStateName nchar(15)  NOT NULL,
    CONSTRAINT Errand_State_pk PRIMARY KEY (eStateID)
) ;

-- Table: Product
CREATE TABLE Product (
    productID integer  NOT NULL,
    productName nchar(15)  NOT NULL,
    productPrice numeric(5,2)  NOT NULL,
    productIVA smallint  NOT NULL,
    productQuantity smallint  NOT NULL,
    productWeight numeric(7,3)  NOT NULL,
    productState nchar(15)  NOT NULL,
    categoryID integer  NOT NULL,
    providerID integer  NOT NULL,
    envelopeID integer  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY (productID)
) ;

-- Table: Product_Type
CREATE TABLE Product_Type (
    pTypeID integer  NOT NULL,
    pTypeName nchar(15)  NOT NULL,
    CONSTRAINT Product_Type_pk PRIMARY KEY (pTypeID)
) ;

-- Table: Provider
CREATE TABLE Provider (
    providerID integer  NOT NULL,
    providerName nchar(15)  NOT NULL,
    providerEmail nchar(30)  NOT NULL,
    providerPhone nchar(10)  NOT NULL,
    providerAddress varchar2(15)  NOT NULL,
    cityID integer  NOT NULL,
    CONSTRAINT Provider_pk PRIMARY KEY (providerID)
) ;

-- Table: Unsold
CREATE TABLE Unsold (
    unsoldID integer  NOT NULL,
    errandID integer  NOT NULL,
    CONSTRAINT Unsold_pk PRIMARY KEY (unsoldID)
) ;

-- Table: Unsold_Detail
CREATE TABLE Unsold_Detail (
    productID integer  NOT NULL,
    unsoldID integer  NOT NULL,
    uDetailQuantity integer  NOT NULL,
    uDetailPrice numeric(8,2)  NOT NULL,
    CONSTRAINT Unsold_Detail_pk PRIMARY KEY (productID,unsoldID)
) ;

-- foreign keys
-- Reference: Bill_Detail_Bill (table: Bill_Detail)
ALTER TABLE Bill_Detail ADD CONSTRAINT Bill_Detail_Bill
    FOREIGN KEY (billID)
    REFERENCES Bill (billID);

-- Reference: Bill_Detail_Product (table: Bill_Detail)
ALTER TABLE Bill_Detail ADD CONSTRAINT Bill_Detail_Product
    FOREIGN KEY (productID)
    REFERENCES Product (productID);

-- Reference: Bill_Errand (table: Bill)
ALTER TABLE Bill ADD CONSTRAINT Bill_Errand
    FOREIGN KEY (errandID)
    REFERENCES Errand (errandID);

-- Reference: Catalogue_Detail_Catalogue (table: Catalogue_Detail)
ALTER TABLE Catalogue_Detail ADD CONSTRAINT Catalogue_Detail_Catalogue
    FOREIGN KEY (catalogueID)
    REFERENCES Catalogue (catalogueID);

-- Reference: Catalogue_Detail_Product (table: Catalogue_Detail)
ALTER TABLE Catalogue_Detail ADD CONSTRAINT Catalogue_Detail_Product
    FOREIGN KEY (productID)
    REFERENCES Product (productID);

-- Reference: Category_Type (table: Category)
ALTER TABLE Category ADD CONSTRAINT Category_Type
    FOREIGN KEY (pTypeID)
    REFERENCES Product_Type (pTypeID);

-- Reference: City_Department (table: City)
ALTER TABLE City ADD CONSTRAINT City_Department
    FOREIGN KEY (deptID)
    REFERENCES Department (deptID);

-- Reference: Client_City (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_City
    FOREIGN KEY (cityID)
    REFERENCES City (cityID);

-- Reference: Client_Client_Entity (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_Client_Entity
    FOREIGN KEY (cEntityID)
    REFERENCES Client_Entity (cEntityID);

-- Reference: Client_Client_Type (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_Client_Type
    FOREIGN KEY (cTypeID)
    REFERENCES Client_Type (cTypeID);

-- Reference: Department_Country (table: Department)
ALTER TABLE Department ADD CONSTRAINT Department_Country
    FOREIGN KEY (countryID)
    REFERENCES Country (countryID);

-- Reference: Errand_Client (table: Errand)
ALTER TABLE Errand ADD CONSTRAINT Errand_Client
    FOREIGN KEY (clientID)
    REFERENCES Client (clientID);

-- Reference: Errand_Detail_Errand (table: Errand_Detail)
ALTER TABLE Errand_Detail ADD CONSTRAINT Errand_Detail_Errand
    FOREIGN KEY (errandID)
    REFERENCES Errand (errandID);

-- Reference: Errand_Detail_Product (table: Errand_Detail)
ALTER TABLE Errand_Detail ADD CONSTRAINT Errand_Detail_Product
    FOREIGN KEY (productID)
    REFERENCES Product (productID);

-- Reference: Errand_Errand_State (table: Errand)
ALTER TABLE Errand ADD CONSTRAINT Errand_Errand_State
    FOREIGN KEY (eStateID)
    REFERENCES Errand_State (eStateID);

-- Reference: Product_Category (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Category
    FOREIGN KEY (categoryID)
    REFERENCES Category (categoryID);

-- Reference: Product_Envelope (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Envelope
    FOREIGN KEY (envelopeID)
    REFERENCES Envelope (envelopeID);

-- Reference: Product_Provider (table: Product)
ALTER TABLE Product ADD CONSTRAINT Product_Provider
    FOREIGN KEY (providerID)
    REFERENCES Provider (providerID);

-- Reference: Provider_City (table: Provider)
ALTER TABLE Provider ADD CONSTRAINT Provider_City
    FOREIGN KEY (cityID)
    REFERENCES City (cityID);

-- Reference: Unsold_Detail_Product (table: Unsold_Detail)
ALTER TABLE Unsold_Detail ADD CONSTRAINT Unsold_Detail_Product
    FOREIGN KEY (productID)
    REFERENCES Product (productID);

-- Reference: Unsold_Detail_Unsold (table: Unsold_Detail)
ALTER TABLE Unsold_Detail ADD CONSTRAINT Unsold_Detail_Unsold
    FOREIGN KEY (unsoldID)
    REFERENCES Unsold (unsoldID);

-- Reference: Unsold_Errand (table: Unsold)
ALTER TABLE Unsold ADD CONSTRAINT Unsold_Errand
    FOREIGN KEY (errandID)
    REFERENCES Errand (errandID);

-- End of file.