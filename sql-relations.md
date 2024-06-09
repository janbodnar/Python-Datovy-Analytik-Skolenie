# Relations

In SQL, relations refer to the associations or connections between tables in a relational database. These relationships  
are established using foreign keys, which are columns in a table that refer to the primary key in another table. They   
help organize and structure data, allowing for efficient data retrieval and maintaining data integrity.

Common types of relations in SQL:

1. **One-to-One**: Each record in Table A is associated with one and only one record in Table B, and vice versa.  
   For example, a user table and a user profile table, where each user has a single corresponding profile.  
3. **One-to-Many**: Each record in Table A can be associated with multiple records in Table B, but each record in Table B  
   is associated with only one record in Table A¹. For example, a departments table and an employees table, where each  
   department can have multiple employees, but each employee belongs to one department.  
5. **Many-to-Many**: Each record in Table A can be associated with multiple records in Table B, and vice versa¹. This is  
   typically implemented with an intermediate table. For example, a students table and a courses table, where each student  
   can enroll in multiple courses, and each course can have multiple students.  
8. **Self-Referencing**: This occurs when only one table is involved, and a foreign key in the table references the  
   primary key of the same table.
10. **Many-to-One**: This is a special case of a one-to-many relationship, where each record in Table B can be associated  
    with one record in Table A⁴. For example, an employees table and a departments table, where each employee belongs to  
    one department, but a department can have many employees⁴.

