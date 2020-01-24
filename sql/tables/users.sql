
create or replace function random_string(len int default 36)
returns text
as $$
    -- select substring(
    --     replace(membership.gen_random_uuid()::text,'-','')
    -- , 0, len + 1);
    select substring(md5(random()::text), 0, len +1);
$$ LANGUAGE SQL;

create table users(
  id bigint primary key not null default id_generator(),
  user_key varchar(18) default random_string(18) not null,
  email varchar(255) unique not null,
  first varchar(25),
  last varchar(25),
  search tsvector,
  created_at timestamptz default now() not null,
  status_id int default 10,
  last_login timestamptz,
  login_count int default 0 not null,
  validation_token varchar(36),
  profile jsonb
);


insert into users (email) values('shoupnb@gmail.com');
insert into users (email) values('shounb@tester.com');
insert into users (email) values('shounb@test.com');

