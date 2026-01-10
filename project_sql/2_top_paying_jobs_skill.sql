/*
What skills are required for top-paying Data Analyst jobs?
-Use the top 10 highest paying Data analyst from 1st query.
-Add the specific skills required for these roles.
-Why? Provide insights into the skill sets that are in demand for high-paying Data Analyst positions.
*/

with top_paying_jobs as (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        company.name as company_name
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
    LIMIT 10
)

select
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order by
    salary_year_avg DESC;

/*
1️⃣ SQL: SQL is the most frequent skill and remains essential at higher salaries, proving that pay growth reinforces—rather than replaces—SQL expertise.
2️⃣ Python: Python is nearly as common as SQL, showing that top-paying roles expect programmatic data analysis, not just reporting.
3️⃣ Visualization: Tableau appears more often than Power BI, indicating that high-paying roles value advanced data storytelling.
4️⃣ Excel: Excel shows lower frequency in high-paying jobs, implying it is assumed knowledge and not a salary driver.
5️⃣ R: R appears selectively in analytics-heavy roles, making it niche compared to Python’s broader impact.
6️⃣ Cloud & Warehousing: Snowflake, Azure, and Oracle occur less often but consistently, acting as strong salary differentiators.
7️⃣ Collaboration & Dev Tools: Git and collaboration tools appear mainly in senior roles, signaling mature, production-level data teams.
These insights help professionals target skill development aligned with lucrative Data Analyst opportunities.
*/  