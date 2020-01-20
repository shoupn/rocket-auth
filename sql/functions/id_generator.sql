--timestamp(41 bits) | shardId (13) | userId(10)
set search_path = membership;
CREATE SEQUENCE id_sequence;

create or replace function membership.id_generator( out new_id bigint )
as $$
    DECLARE 
        our_epoch bigint := 1072915200000; --date plurasight founded
        seq_id bigint;
        now_ms bigint;
        shard_id bigint:=1;
    BEGIN 
        select nextval('id_sequence') %1024 into seq_id;
        select floor(extract(epoch from now())) * 1000 into now_ms;
        new_id := (now_ms - our_epoch) << 23;
        new_id := new_id | (shard_id << 10);
        new_id := new_id | (seq_id);
    END;
$$ LANGUAGE PLPGSQL;

