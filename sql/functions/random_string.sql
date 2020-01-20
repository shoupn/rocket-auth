create or replace function random_string(len int default 36)
returns text
as $$
    -- select substring(
    --     replace(membership.gen_random_uuid()::text,'-','')
    -- , 0, len + 1);
    select substring(md5(random()::text), 0, len +1);
$$ LANGUAGE SQL;