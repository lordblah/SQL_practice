#https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50
#The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

#Write a solution to find the confirmation rate of each user.

#Return the result table in any order.

#The result format is in the following example

select 
Signups.user_id,
case 
  when con.num = 0 then 0.00
  when con.num is null then 0.00
  else round(con.num/con.den,2)
end as confirmation_rate 
from Signups
left join (
    select
    user_id,
    count(time_Stamp) as den,
    sum(case when action = 'confirmed' then 1.00 else 0.00
    end) as num
    from Confirmations
    group by user_id
 ) con on Signups.user_id = con.user_id
