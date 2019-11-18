create table author(name varchar(20), address varchar(15), URL varchar(30), primary key (name));
create table book(ISBN varchar(20), title varchar(20), year numeric(4,0), primary key (ISBN));
create table written_by(name varchar(20),ISBN varchar(20), primary key (name, ISBN));
create table publisher(name varchar(20), address varchar(15), phone numeric(20,0), URL varchar(30), primary key (name));
create table published_by(name varchar(20),ISBN varchar(20), primary key (name,ISBN));
create table shopping_basket(basket_id varchar(7), primary key(basket_id));
create table contains(ISBN varchar(20), basket_id varchar(7), number int, primary key (ISBN, basket_id));


¿Por qué los matemáticos dedican su vida a estudiar matemáticas? 

Ed Scheinerman, profesor de Johns Hopkins University, aclara "For most of us, it is
because of the joy we experience when doing mathematics." (). Desde mi perspectiva, vivir en el mundo abstracto de las matemáticas permite a sus devotos aventurarse por terrenos nunca antes vistos, por lo cual, resultan tan atractivas para algunos. 

Así mismo, Ed nos indica:

Mathematics is difficult for everyone. No matter what level of accomplishment or skill
in this subject you (or your instructor) have attained, there is always a harder, more frustrat-
ing problem waiting around the bend. Demoralizing? Hardly! The greater the challenge, the
greater the sense of accomplishment we experience when the challenge has been met. The
best part of mathematics is the joy we experience in practicing this art.

Esto nos hace pensar en la idealización de estas como un arte.

Justamente, en su libro de matemáticas discretas, nos invita a sentir este placer "matemático" de una forma empática al escritor. Al final nos indica, que contrario al arte convencional, que puede ser deleitado por los espectadores, las matemáticas contienen su parte emocional solo para las personas que realmente trabajan en ellas. ()
