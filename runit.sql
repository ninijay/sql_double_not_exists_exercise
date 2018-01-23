create table student(
		name varchar(60) not null,
    stdID int PRIMARY KEY
);

create table pizza(
		name varchar(60) not null,
    pizzaID int PRIMARY KEY
);
    
create table studentLikesPizza(
	  stdID int not null,
    pizzaID int not null,
    
    constraint stdLikesPz UNIQUE (stdID, pizzaID),
    constraint fk_std FOREIGN KEY (stdID) references student(stdID),
    constraint fk_pz FOREIGN KEY (pizzaID) references pizza(pizzaID)
);
    
    
insert into student values ("Mattia", 1);
insert into student values ("Cyrill", 2);
insert into student values ("Nick", 3);

insert into pizza values ("Prosciutto",1);
insert into pizza values ("Margheritta", 2);
insert into pizza values ("Funghi",3);
insert into pizza values ("Hawaii", 4);

insert into studentLikesPizza values (1, 1), (2, 2), (3, 3), (1,4), (2,4), (3,4);

-- Select all pizzas that all student like (which ironically is Hawaii)

select name from pizza p
where not exists(
		select 1 from student s
    where not exists(
				select 1 from studentLikesPizza slp
        where slp.stdID = s.stdID
        AND slp.pizzaID = p.pizzaID
				)
    );






