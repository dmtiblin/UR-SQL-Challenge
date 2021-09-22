-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "title_id" CHAR(5)   NOT NULL PRIMARY KEY,
    "title" VARCHAR(30)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL PRIMARY KEY ,
    "emp_title_id" CHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(20)   NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    "sex" char(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL PRIMARY KEY,
    "salary" INT   NOT NULL,
    FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

CREATE TABLE "departments" (
    "dept_no" CHAR(4)   NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(30)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" CHAR(4)   NOT NULL,
    FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	PRIMARY KEY ("emp_no","dept_no") 
);

CREATE TABLE "dept_manager" (
    "dept_no" CHAR(4)  NOT NULL,
    "emp_no" INT   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	PRIMARY KEY ("emp_no","dept_no") 
);

