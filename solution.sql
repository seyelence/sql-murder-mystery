-- mystery found @ https://mystery.knightlab.com/
select * from crime_scene_report 
where date = 20180115 and city = "SQL City" and type = "murder"

select max(address_number), name from person
where address_street_name='Northwestern Dr'

select * from person
where address_street_name='Franklin Ave'
and name like "Annabel%"

select  * from interview
where person_id = 16371	or person_id = 14887

select * from get_fit_now_check_in gcn, get_fit_now_member gfm
where gfm.id = gcn.membership_id and gcn.check_in_date = 20180109

select * from get_fit_now_check_in gcn, get_fit_now_member gfm
where gfm.id = gcn.membership_id and gcn.check_in_date = 20180109 and gfm.membership_status = "gold"
and gcn.membership_id like "48Z%"

select * from person p, get_fit_now_member gfm, drivers_license dr
where gfm.person_id = p.id and p.license_id = dr.id
and dr.plate_number like "%H42W%"

select * from person p, interview i
where p.id = person_id and p.name = "Jeremy Bowers"  -- jeremy is the killer

select * from drivers_license
where height > 65 and height < 67 
and hair_color = "red" 
and gender = "female" 
and car_make = "Tesla"

select * from drivers_license dl, person p, income i
where dl.id = p.license_id and i.ssn = p.ssn and
dl.height > 65 and dl.height < 67 
and dl.hair_color = "red" 
and dl.gender = "female" 
and dl.car_make = "Tesla"

-- confirming it's miranda who is behind everything
select * from facebook_event_checkin fc, person p
where fc.person_id = p.id and fc.event_name = "SQL Symphony Concert"
and fc.date like "201712%" group by p.id having count(p.id) > 2
