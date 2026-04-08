-- what are the top skills based on salary?

SELECT 
  skills,
  ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id= skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE 
  job_title_short = 'Data Analyst' 
  AND
  salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY
  avg_salary DESC
LIMIT 25


-- First brutal truth

-- These are NOT typical data analyst skills.

-- 👉 This list is polluted with:

-- backend engineering
-- ML engineering
-- DevOps
-- niche tools

-- 👉 Translation:

-- High salary ≠ high relevance to your role

-- 🧠 Real patterns (this is what matters)
-- 💣 1. Niche + rare = high salary

-- Look at:

-- Solidity
-- MXNet
-- Couchbase

-- 👉 These are:

-- rare
-- hard to learn
-- used in specific industries

-- 💡 Insight:

-- Companies pay more when supply is low

-- 💣 2. AI / ML stack is dominating high pay

-- You see:

-- TensorFlow
-- PyTorch
-- Hugging Face
-- Keras

-- 👉 This is the real signal.

-- 💡 Insight:

-- The closer you are to AI → the higher your ceiling

-- 💣 3. DevOps / Cloud = high paying layer

-- Skills like:

-- Terraform
-- Ansible
-- Puppet
-- VMware

-- 👉 These are infrastructure skills.

-- 💡 Insight:

-- People who manage systems get paid more than people who just analyze data

-- 💣 4. Data engineering signals (VERY important)
-- Apache Kafka
-- Apache Airflow
-- Cassandra
-- Scala

-- 👉 This is your bridge.

-- 💡 Insight:

-- Data Analysts → Data Engineers → Big salary jump

-- 💣 5. Some tools are misleading
-- Notion
-- Atlassian

-- 👉 These are NOT high-paying skills.

-- 💡 Insight:

-- They appear because high-paying roles ALSO use them — not because they cause high pay