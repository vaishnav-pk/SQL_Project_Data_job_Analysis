/*
what are the top-paying jobs in the company?
-Identify the top 10 highest paying Data analyst roles that are available remotely.
-Focuses on job postings with specified salaries (not null).
-Why? Highlight the top - paying oppurtunities for Data Analyst, offering insights into employee trends
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company.name
FROM
    job_postings_fact
LEFT JOIN
    company_dim as company on job_postings_fact.company_id = company.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    and salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;