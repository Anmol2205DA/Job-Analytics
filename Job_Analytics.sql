
use Job_Analytics

select * from jobs

--Total number of jobs in the dataset:

SELECT COUNT(*) AS Total_Jobs FROM Jobs;

--List all unique cities and the number of jobs in each city:

SELECT City, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY City 
ORDER BY Job_Count DESC;

--Top 5 industries by the number of jobs posted:

SELECT TOP 5 Industry, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY Industry 
ORDER BY Job_Count DESC;

--Count the number of jobs for each employment type:

SELECT Involvement, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY Involvement;

--Average number of applicants per job:

SELECT AVG(Applicants) AS Avg_Applicants 
FROM Jobs;

--Top 5 most common job roles:

SELECT TOP 5 Job_Role, COUNT(*) AS Job_Count 
FROM Jobs  GROUP BY Job_Role 
ORDER BY Job_Count DESC;

--Companies with the highest number of job postings:

SELECT Company, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY Company 
ORDER BY Job_Count DESC;

--Jobs by seniority levels:

SELECT Level, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY Level;

--Total applicants for jobs in each city:

SELECT City, SUM(Applicants) AS Total_Applicants 
FROM Jobs GROUP BY City 
ORDER BY Total_Applicants DESC;

--Industries with the highest average applicants per job:

SELECT Industry, AVG(Applicants) AS Avg_Applicants 
FROM Jobs GROUP BY Industry 
ORDER BY Avg_Applicants DESC;

--Intermediate Insights

--Rank cities based on total job applicants:

SELECT City, SUM(Applicants) AS Total_Applicants 
FROM Jobs GROUP BY City 
ORDER BY Total_Applicants DESC;

--Top 10 companies with the highest number of followers:

SELECT TOP 10 Company, avg(Followers) as N_Followers
FROM Jobs Group BY Company
ORDER BY N_Followers DESC;

--Percentage of jobs in each industry:

SELECT Industry, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Jobs) AS Percentage 
FROM Jobs GROUP BY Industry
ORDER BY Percentage DESC;

--Companies with low followers but high applicants:

SELECT Company, Followers, AVG(Applicants) AS Avg_Applicants 
FROM Jobs GROUP BY Company, Followers 
HAVING Followers < 500 AND AVG(Applicants) > 50;

--Average number of applicants for jobs in each city:

SELECT City, Avg(Applicants) AS Avg_Applicants 
FROM Jobs GROUP BY City;

--Job roles with the highest number of applicants.

SELECT Job_Role, SUM(Applicants) AS Total_Applicants 
FROM Jobs GROUP BY Job_Role 
ORDER BY Total_Applicants DESC;

--Compare average followers for entry-level vs senior-level jobs:

SELECT Level, AVG(Followers) AS Avg_Followers 
FROM Jobs 
WHERE Level IN ('Entry level', 'Mid-Senior level') 
GROUP BY Level;

--Industries dominated by smaller companies (<200 employees):

SELECT Industry, COUNT(*) AS Small_Company_Jobs 
FROM Jobs 
WHERE Employee_Size LIKE '%to 200' OR Employee_Size LIKE '%to 100' OR Employee_Size LIKE '%to 50' OR Employee_Size LIKE '%to 10'
GROUP BY Industry
HAVING COUNT(*)>=10
ORDER BY Small_Company_Jobs DESC;

--Cities with the highest number of Mid-senior-level job postings:

SELECT City, COUNT(*) AS Senior_Jobs FROM Jobs 
WHERE Level = 'Mid-Senior level' 
GROUP BY City ORDER BY Senior_Jobs DESC;

--Advanced Insights

--Company size and number of applicants:

SELECT Employee_Size, AVG(Applicants) AS Avg_Applicants 
FROM Jobs 
GROUP BY Employee_Size 
ORDER BY Employee_Size;

--Top industries for entry-level vs director-level positions:

SELECT Level, Industry, COUNT(*) AS Job_Count 
FROM Jobs 
WHERE Level IN ('Entry level', 'Director') 
GROUP BY Level, Industry Having COUNT(*)>2
ORDER BY Level, Job_Count DESC;

--Job application conversion rate by company:

SELECT Company, 1.0 / SUM(Applicants) AS Conversion_Rate 
FROM Jobs GROUP BY Company HAVING SUM(Applicants)>1
ORDER BY Conversion_Rate DESC;

--Job trends in top cities based on employment type:

SELECT City, Involvement, COUNT(*) AS Job_Count 
FROM Jobs GROUP BY City, Involvement 
ORDER BY City, Job_Count DESC;

--High-demand industries (average applicants per job):

SELECT Industry, AVG(Applicants) AS Avg_Applicants 
FROM Jobs 
GROUP BY Industry 
ORDER BY Avg_Applicants DESC;

--Smaller companies hiring full-time vs internships

SELECT Involvement, COUNT(*) AS Job_Count 
FROM Jobs 
WHERE Employee_Size LIKE '%to 200' OR Employee_Size LIKE '%to 100' OR Employee_Size LIKE '%to 50' OR Employee_Size LIKE '%to 10'
GROUP BY Involvement;

--Companies with high applicant engagement relative to followers:

SELECT Company, SUM(Applicants) * 1.0 / AVG(Followers) AS Engagement_Rate 
FROM Jobs GROUP BY Company 
ORDER BY Engagement_Rate DESC;

--City-specific job preferences:

SELECT City, Industry, COUNT(*) AS Job_Count 
FROM Jobs 
GROUP BY City, Industry 
ORDER BY City, Job_Count DESC;

--Job trends by industry and employment type:

SELECT Industry, Involvement, COUNT(*) AS Job_Count 
FROM Jobs 
GROUP BY Industry, Involvement 
ORDER BY Job_Count DESC;
