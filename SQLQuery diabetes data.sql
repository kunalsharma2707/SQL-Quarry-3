use p1
select * from diabetes_dataset00
select * from diabetes_dataset00
where Target = 'type 2 Diabetes'

select diabetes_dataset00.Pregnancy_History from diabetes_dataset00
where diabetes_dataset00.Pregnancy_History = 'complications'

select diabetes_dataset00.Pregnancy_History from diabetes_dataset00
where diabetes_dataset00.Pregnancy_History = 'normal'

select distinct diabetes_dataset00.Age, diabetes_dataset00.Pregnancy_History from diabetes_dataset00
where diabetes_dataset00.Pregnancy_History = 'normal'

select distinct diabetes_dataset00.Age, diabetes_dataset00.Pregnancy_History from diabetes_dataset00
where diabetes_dataset00.Pregnancy_History = 'complications'

select top 10 diabetes_dataset00.Age,diabetes_dataset00.Alcohol_Consumption,diabetes_dataset00.Cholesterol_Levels,
       diabetes_dataset00.Pregnancy_History,diabetes_dataset00.Target,diabetes_dataset00.Dietary_Habits 
       from diabetes_dataset00
	where diabetes_dataset00.Dietary_Habits = 'healthy'
	

select  distinct top 7* from diabetes_dataset00

select  distinct top 7 Insulin_Levels from diabetes_dataset00
where Insulin_Levels < '40'
order by Insulin_Levels

select diabetes_dataset00.Target, avg(diabetes_dataset00.age) as [AVG AGE]
from diabetes_dataset00
group by diabetes_dataset00.Target


select (diabetes_dataset00.Target), avg(diabetes_dataset00.age) as [AVG of AGE], 
        count(diabetes_dataset00.Blood_Pressure) as [count of BP]
from diabetes_dataset00
where diabetes_dataset00.Age < 20
group by diabetes_dataset00.Target
having min(diabetes_dataset00.Blood_Pressure)<100
order by [AVG of AGE] desc
 

 select top 5 diabetes_dataset00.Age,diabetes_dataset00.Alcohol_Consumption,diabetes_dataset00.Cholesterol_Levels,
       diabetes_dataset00.Pregnancy_History,diabetes_dataset00.Target,diabetes_dataset00.Dietary_Habits 
 from diabetes_dataset00
 where Cholesterol_Levels > (select avg(Cholesterol_Levels) from diabetes_dataset00)



 with cte1 as(
		 (select avg(Cholesterol_Levels) as [avg ch.L] from diabetes_dataset00)
 )
select * from diabetes_dataset00
 inner join cte1 on Cholesterol_Levels > [avg ch.L]



 
 with cte1 as(
		 (select avg(Cholesterol_Levels) as [avg ch.L] from diabetes_dataset00)
 ),
 [max_ch.l] as(select max(Cholesterol_Levels) as [max ch.l] from diabetes_dataset00)
select * from [max_ch.l]
----inner join cte1 on Cholesterol_Levels > [avg ch.L]