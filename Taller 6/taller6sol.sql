create table author(name varchar(20), address varchar(15), URL varchar(30), primary key (name));
create table book(ISBN varchar(20), title varchar(20), year numeric(4,0), primary key (ISBN));
create table written_by(name varchar(20),ISBN varchar(20), primary key (name, ISBN));
create table publisher(name varchar(20), address varchar(15), phone numeric(20,0), URL varchar(30), primary key (name));
create table published_by(name varchar(20),ISBN varchar(20), primary key (name,ISBN));
create table shopping_basket(basket_id varchar(7), primary key(basket_id));

