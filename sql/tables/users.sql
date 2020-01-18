create table users (
    id serial primary key,
    email varchar(255) unique not null,
    created_at timestamptz default now() not null,
    status varchar (10) default 'active'
);

insert into users (email) values('shoupnb@gmail.com');
insert into users (email) values('shounb@tester.com');
insert into users (email) values('shounb@test.com');
