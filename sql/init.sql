--drops all tables functions views etc..
drop schema if exists membership CASCADE; 

create schema membership;
set search_path = membership;

select 'Schema initialized' as result;

