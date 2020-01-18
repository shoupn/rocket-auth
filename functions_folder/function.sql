-- FUNCTION: membership.the_time_at(character varying)

 DROP FUNCTION membership.the_time_at(character varying);

CREATE OR REPLACE FUNCTION membership.the_time_at(
	tz varchar default 'GMT',
	OUT timestamp without time zone
	)
    RETURNS timestamp without time zone
    LANGUAGE 'sql'

   
AS $BODY$
	select now() at time zone tz;
$BODY$;


create or replace function three_hours_from_now(
	INOUT the_time timestamptz
)
   
AS $$
	select the_time + '3 hours';
$$ LANGUAGE 'sql'

select three_hours_from_now(now());
select * from the_time_at();

create or replace function hi_lo_av(
	--note the variadic key word.
	variadic nums int[], out int, out int, out numeric
)as $$
	select min(nums[i]), max (nums[i]), avg(nums[i])
	from generate_subscripts(nums, 1) fx(i)
$$ LANGUAGE 'sql'

select * from hi_lo_av(1,4,6,7,100);