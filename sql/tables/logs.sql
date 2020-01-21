create table logs(
    id serial primary key,
    subject varchar(50),
    user_id bigint, 
    entry text not null,
    data jsonb,
    created_at timestamptz default now()
);