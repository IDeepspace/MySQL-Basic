# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name

# 获取两个表的链接查询
select * from Company left join Employee on Company.id = Employee.companyId;

# 取得每个company中最高薪水的人员公司，名字，薪水
select companyName, name, max(salary)
from Company left join Employee
on Company.id = Employee.companyId
group by companyId
;

# 取得每个company中最高薪水的公司，人员名字
select companyName, name from
(select companyName, name, max(salary)
from Company left join Employee
on Company.id = Employee.companyId
group by companyId) as t ;