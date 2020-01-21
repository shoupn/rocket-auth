create table membership.users (
    id bigint primary key default id_generator(),
    user_key varchar(18) default random_string(18),
    email varchar(255) unique not null,
    first_name varchar(55),
    last_name varchar(55),
    validation_token varchar(36),
    hashed_password varchar(255),
    search tsvector,
    created_at timestamptz default now() not null,
    status varchar (10) default 'active'
);

insert into users (email) values('shoupnb@gmail.com');
insert into users (email) values('shounb@tester.com');
insert into users (email) values('shounb@test.com');

create or replace function membership.get_user(u_email varchar )
returns table(
	id bigint,
	email varchar(255),
	status varchar(25),
	member_for interval,
	display_name varchar(110)
)as $$
	declare
		user_id bigint;
		display_name varchar(255);
		found_user membership.users;
		member_for interval;
		return_status varchar(25);
	begin
		if exists (select membership.users.id from membership.users where membership.users.email = u_email) then
			select * from membership.users into found_user;
			if(found_user.first_name is not null) then
				select found_user.first_name + ' ' + found_user.last_name + ' ' + found_user.email into display_name;
			ELSE
				select found_user.email into display_name;
			end if;
			select age(now(), found_user.created_at) into member_for;
		end if;
		return query
		select 
			found_user.id, 
			found_user.email, 
			found_user.status,
			member_for,
			display_name;
	end;
$$language plpgsql;