create or replace function membership.get_user(
	email varchar
)
returns membership.users
as $$
	select * from membership.users 
	where email = email;
$$ Language SQL;

create or replace function membership.get_users()
returns table(
	email varchar(255),
	member_for interval,
	status varchar(20)
)
as $$
	--select * from membership.users;
	select email, 
	age(now(), created_at)as member_for, 
	status from membership.users;
$$ Language SQL;

select membership.get_users();
select membership.get_user('shoupnb@gmail.com'); --type response as function returns users object
select * from membership.get_user('shoupnb@gmail.com');