<h1>Gallery Database Design, SQL and draw.io</h1>
<h2>Overview</h2>
Artistry Collection designs databases for art galleries. With this database individual pieces of art may be referenced with or without respect to the art group they belong to. In addition, customers, artists and galleries can be tracked, allowing art galleries to manage artwork, track customer preferences, and nurture relationships with artists. 
<h2>Project Summary</h2>
<h3>Coding Languages/Tools</h3>
• SQL
<br>
• draw.io
<h3>Assumptions/Business Rules</h3>
• Gallery and Artwork (M:N): Multiple artworks can be displayed in many galleries. 
<br>
• Artist and Artwork (1:M): Each piece of artwork is associated with exactly one artist, but an artist can have one or many pieces of artwork.
<br>
• Artwork and ArtGroup (M:N): Artworks can belong to one or many art groups, and art groups can include one or many artworks. 
<br>
• Gallery and Customer (M:N): Galleries have multiple customers, and customers are associated with one or more galleries. 
<br>
• Gallery and Artist (M:N): Galleries have relationships with one or many artists, and artists are associated with multiple galleries. 
<br>
• Customer and ArtGroup (M:N): Customers have preferences for one or many art groups. 
<br>
• Customer and Artist (M:N): Customers can have preferences for one or many artists. 
<br>
• GalleryCustomer Entity: Aside from resolving the M:N relationship between gallery and customer, the GalleryCustomer relationship also tracks the number of visits a customer has made to a gallery. 
<h3>Steps Taken</h3>
<h4>1. Conceptual Design</h4>Two ER diagrams are designed. The first outlines the relationships defined above while the second shows how the many-to-many relationships have been dissolved.  
<br>
<h4>2. EER Diagram</h4>Illustrates the relationship between the ‘Location’ entity and the entities ‘GalleryAddress’ and ‘CustomerAddress’. Double lines represent total specialization, meaning each LocationID must be tied to either 'GalleryAddress' or 'CustomerAddress'. The ‘d’ in the circle represents disjointedness, indicating one location may only be associated with a customer or a gallery, not both. 
<br>
<h4>3. Logical Design/Relational Schema</h4>Moves from Pre1NF to 3NF. 
<br>
<h4>4. Physical Design</h4> – Crafted 15 tables in draw.io to visualize the final product in SQL.
<br>
<h4>5. SQL</h4> Implemented the database, made basic and advanced queries.
<h3>Future Improvements</h3>
• Add a feature to facilitate trade between art galleries, enabling inventory to move more freely. This will improve sales by giving customers access to a wider variety of pieces. 
<br>
• Add a table to track overall sales, sales by gallery, and sales by associate. This will strengthen data insights and aid in maximizing profits. 
<br>
• Reconfigure the totalSpend attribute in the customer table so that it keeps track of every purchase and tallies them, rather than just keeping the tally. 
<h2>How to Use</h2>
• Connect to SQL, and run the provided script to set up the database.
<br>
• Download draw.io document, open draw.io in your browser, and load the file. 

