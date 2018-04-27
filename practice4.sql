# 找出薪水在公司的平均薪水之上的人员名字
# 输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
# id | name | age | gender | companyId | salary | companyName | avgsal

# 两个表链接查询
select Employee.id,name,age,gender,companyId,salary,companyName from Company left join Employee on Company.id = Employee.companyId;

select companyName, avg(salary) as avgSalary
from Company left join Employee
on Company.id = Employee.companyId
group by companyId;

+-------------+-----------+
| companyName | avgSalary |
+-------------+-----------+
| 'baidu'     | 5000.0000 |
| 'alibaba'   | 6500.0000 |
| 'tengxun'   | 8000.0000 |
+-------------+-----------+


select * from
(select Employee.id,name,age,gender,companyId,salary,companyName from Company left join Employee on Company.id = Employee.companyId) as t1
left join
(select companyName, avg(salary) as avgSalary from Company left join Employee on Company.id = Employee.companyId group by companyId) as t2
on t1.companyName = t2.companyName
where salary > avgSalary
;

+------+------------+------+----------+-----------+--------+-------------+-------------+-----------+
| id   | name       | age  | gender   | companyId | salary | companyName | companyName | avgSalary |
+------+------------+------+----------+-----------+--------+-------------+-------------+-----------+
|    0 | 'xiaoming' |   20 | 'male'   |         0 |   6000 | 'baidu'     | 'baidu'     | 5000.0000 |
|    1 | 'xiaohong' |   19 | 'female' |         1 |   7000 | 'alibaba'   | 'alibaba'   | 6500.0000 |
+------+------------+------+----------+-----------+--------+-------------+-------------+-----------+