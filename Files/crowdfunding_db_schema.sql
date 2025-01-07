-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS contacts;

CREATE TABLE "campaign" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(100)   NOT NULL,
    "description" VARCHAR(100)   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR(100)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(100)   NOT NULL,
    "currency" VARCHAR(100)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(100)   NOT NULL,
    "subcategory_id" VARCHAR(100)   NOT NULL,
	CONSTRAINT pk_campaign PRIMARY KEY ("cf_id")  
);

CREATE TABLE "category" (
    "category_id" VARCHAR(100)   NOT NULL,
    "category" VARCHAR(100)   NOT NULL,
	CONSTRAINT "pk_category" PRIMARY KEY ("category_id")
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(100)   NOT NULL,
    "subcategory" VARCHAR(100)   NOT NULL,
	CONSTRAINT "pk_subcategory" PRIMARY KEY ("subcategory_id")
);

CREATE TABLE "contacts" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(100)   NOT NULL,
    "last_name" VARCHAR(100)   NOT NULL,
    "email" VARCHAR(100)   NOT NULL,
	CONSTRAINT "pk_contacts" PRIMARY KEY ("contact_id") 
);

--Verify the table creation by running a SELECT statement for each table
SELECT * FROM  campaign;
SELECT * FROM  category;
SELECT * FROM  subcategory;
SELECT * FROM  contacts;

ALTER TABLE "category" ADD CONSTRAINT "fk_category_category_id" FOREIGN KEY("category_id")
REFERENCES "campaign" ("category_id");

ALTER TABLE "subcategory" ADD CONSTRAINT "fk_subcategory_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "campaign" ("subcategory_id");

ALTER TABLE "contacts" ADD CONSTRAINT "fk_contacts_contact_id" FOREIGN KEY("contact_id")
REFERENCES "campaign" ("contact_id");

