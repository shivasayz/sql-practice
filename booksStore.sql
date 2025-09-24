create database bookstore;
use bookstore;

create table books (
	book_id int primary key,
    title varchar(100),
    author varchar(100),
    price decimal(10,2),
    publication_date date,
    category varchar(100),
    in_stock int
);

insert into books (
	book_id,
    title,
    author,
    price,
    publication_date,
    category,
    in_stock
) values 
	(1, "The MySql Guide", "Jhon Smith", 29.99, "2023-01-15", "Technology", 50), 
    (2, "Data Science Basics", "Sarah Johnson", 34.99, "2023-03-20", "Technology", 30), 
    (3, "Mystery at Midnight", "Michael Brown", 19.99, "2023-02-10", "Mystery", 100), 
    (4, "Cooking Essentials", "Lisa Anderson", 24.99, "2023-04-05", "Cooking", 75);

insert into books values 
(7, "Data Science", "Ghon Smith", 29.99, "2023-01-15", "Technology", 50);

select * from books;
select title from books where category="technology";
select title, price from books where price < 30;
select title, publication_date from books where publication_date between '2023-01-01' and '2023-03-30';
select title, price, category from books where price < 30.00 and category="technology";
select * from books where (category="technology" or category="mystery") and price < 25;
select * from books where not category = "technology";
select * from books where author is null;
select * from books where author is not null;
select * from books where not author is null;

-- pattern matching 
select * from books where title like "%sql%";
select * from books where title like "the%";
select * from books where title like binary "%Sql%";
select * from books where author like "_hon%";
select * from books where price between 20 and 30;
select * from books where category in ("technology", "science");
select * from books where price between 20 and 30 and publication_date > "2023-01-01";
select avg(price) as "Avg price" from books;
select * from books where price > (select avg(price) from books);
select * from books where category in (select category from books where in_stock > 50);

select * from books where year(publication_date) = 2023 and price < (select avg(price) from books);
select * from books where category="technology" and in_stock > 50;
select title from books where (category="technology" and price > 30) or (category="mystery" and price < 20);
select * from books where author like "%son%" or "%th%" and publication_date > "2023-03-01";







