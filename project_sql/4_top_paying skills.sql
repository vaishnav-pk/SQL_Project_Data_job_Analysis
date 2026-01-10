/*
What are the top skills based on salary?
-Why? It reveals how differnet skills impact salary levels for data analystics and 
helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    round(avg(salary_year_avg), 0) as average_salary
from job_postings_fact
inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short='Data Analyst'
    AND
    salary_year_avg IS NOT NULL
group by skills
order by
    average_salary desc
limit 25