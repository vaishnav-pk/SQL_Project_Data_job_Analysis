/*
What are the most optimal skills to learn
why ? Target skills that offer job security and financial benefits.
*/

with skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short='Data Analyst'
        and salary_year_avg IS NOT NULL
        and job_work_from_home= TRUE
    group by skills_dim.skill_id
),
 average_salary as(
    SELECT
        skills_job_dim.skill_id,
        round(avg(salary_year_avg), 0) as average_salary
    from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short='Data Analyst'
        AND
        salary_year_avg IS NOT NULL
    group by skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM 
    skills_demand
INNER JOIN average_salary
ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY   
    average_salary DESC,
    demand_count DESC
LIMIT 25;
