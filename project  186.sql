create database da_project;
 
use da_project; 
select*from da_project.hr_1;
select*from da_project.hr_2;

SELECT "Employee_ID"
FROM hr_1
 INNER JOIN hr_2 ON hr_1 . Employee_ID = hr_2 . Employee_ID;

update hr_1 set attrition = 1 where attrition="yes";
update hr_1 set attrition = 0 where attrition="no";

### kpi 1) Average Attrition rate for all Department
select department,(sum(attrition)/sum(employeecount))*100 as Attrition_Rate from hr_1 group by department;

######kpi 2)  Average Hourly rate of Male Research Scientist 

select jobrole,avg(hourlyrate) from hr_1 where gender = "male" and jobrole = "research scientist";

##### kpi 3) Attrition rate Vs Monthly income stats ####
select department, sum(MonthlyIncome) as monthly_income, (sum(attrition)/sum(employeecount)) * 100 as attrition_rate from hr_1 join hr_2 on hr_2.Employee_ID=hr_1.Employee_ID group by department;

##### kpi 4) Average working years for each Department ######
select department,avg(totalworkingyears) from hr_2 join hr_1 on hr_2.employee_id=hr_1.employee_id group by department;

### kpi 5) Department wise no of employees ######
select department,sum(employeecount) as Total_Employee from hr_1 group by department ;

#####kpi 6) Count of employees based on Educational Fields ######
select Educationfield,sum(employeecount) as Total_no_of_Employee from hr_1 group by Educationfield;

####### kpi 7) Job Role Vs Work life Balance ##### 
select distinct jobRole, worklifebalance, count(employeecount) from hr_1 join hr_2 on hr_2.employee_id=hr_1.employee_id group by jobRole, worklifebalance;

##### kpi 8) Attrition rate Vs Year since last promotion relation ######
select jobRole, sum(YearsSinceLastPromotion) as years_since_last_promotion, (sum(Attrition)/sum(employeecount))
attrition_rate from hr_1 join hr_2 on hr_2.employee_id=hr_1.employee_id group by jobRole;

##### kpi 9) Gender based Percentage of employee ####
select Gender,sum(employeecount)/50000*100 as "% of Employee" from hr_1 group by gender;

#####kpi 10) Department / Job Role Wise job Satisfaction #####
select distinct department, jobsatisfaction, count(employeecount) from hr_1 join hr_2 on hr_2.employee_id=hr_1.employee_id group by department, jobsatisfaction;

