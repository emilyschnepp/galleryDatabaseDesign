Overview
Project Summary
Artistry Collection 
Coding Languages/Tools
SQL
draw.io
Excel – to build data dictionaries and a relationship table. 
Assumptions/Business Rules
1.	Gallery and Artwork (M:N): Multiple artworks can be displayed in many galleries. 
2.	Artist and Artwork (1:M): Each piece of artwork is associated with exactly one artist, but an artist can have one or many pieces of artwork. 
3.	Artwork and ArtGroup (M:N): Artworks can belong to one or many art groups, and art groups can include one or many artworks. 
4.	Gallery and Customer (M:N): Galleries have multiple customers, and customers are associated with one or more galleries. 
5.	Gallery and Artist (M:N): Galleries have relationships with one or many artists, and artists are associated with multiple galleries. 
6.	Customer and ArtGroup (M:N): Customers have preferences for one or many art groups. 
7.	Customer and Artist (M:N): Customers can have preferences for one or many artists. 
8.	GalleryCustomer Entity: Aside from resolving the M:N relationship between gallery and customer, the GalleryCustomer relationship also tracks the number of visits a customer has made to a gallery. 
Steps Taken
Conceptual Design – Two ER diagrams are designed. The first outlines the relationships defined above while the second shows how the many-to-many relationships have been dissolved.  
EER Diagram – This shows the breakdown of the relationship between the ‘Location’ entity and the entities ‘GalleryAddress’ and ‘CustomerAddress’. Double lines represent total specialization, which means that every instance of LocationID must be associated with one of the subtypes. The ‘d’ in the middle of the circle represents disjointedness and means one location can only be associated with a customer or a gallery, not both. 
Logical Design/Relational Schema – Moves from Pre1NF to 3NF. 
Physical Design – Crafted 15 tables in draw.io to visualize the final product in SQL.
SQL – implemented the database, made basic and advanced queries.
Future Improvements
Add a feature to facilitate trade between art galleries so that inventory can be moved more freely. This will improve sales as customers can obtain pieces from other places. 
Adding a new table to tracking overall sales, sales by gallery, sales by associate – to see where or how profits could be optimized. 
How to Use
Connect to SQL. 

