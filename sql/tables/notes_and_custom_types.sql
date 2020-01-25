create type log_type as ENUM(
  'Registration',
  'Authentication',
  'Activity',
  'System'
);


create type user_summary as(
  id bigint,
  email varchar(255),
  status varchar(50),
  can_login boolean,
  is_admin boolean,
  display_name varchar(255),
  user_key varchar(18),
  email_validation_token varchar(36),
  user_for interval,
  profile jsonb,
  logs jsonb,
  notes jsonb
);


create table notes(
    id serial primary key not null,
    user_id bigint not null,
    note text not null,
    created_at timestamptz default current_timestamp
);
