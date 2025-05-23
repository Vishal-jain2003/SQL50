-- 🧪 1757. Recyclable and Low Fat Products
-- 🔗 https://leetcode.com/problems/recyclable-and-low-fat-products/
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';


-- 🧾 584. Find Customer Referee
-- 🔗 https://leetcode.com/problems/find-customer-referee/
SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;


-- 🌍 595. Big Countries
-- 🔗 https://leetcode.com/problems/big-countries/
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000;


-- 👀 1148. Article Views I
-- 🔗 https://leetcode.com/problems/article-views-i/
SELECT DISTINCT author_id AS ID
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;


-- 🐦 1683. Invalid Tweets
-- 🔗 https://leetcode.com/problems/invalid-tweets/
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


-- 🆔 1378. Replace Employee ID With The Unique Identifier
-- 🔗 https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
SELECT EU.unique_id, E.name
FROM Employees E
LEFT JOIN EmployeeUNI EU ON E.id = EU.id;


-- 🛍️ 1068. Product Sales Analysis I
-- 🔗 https://leetcode.com/problems/product-sales-analysis-i/
SELECT P.product_name, S.year, S.price
FROM Sales AS S
JOIN Product AS P ON S.product_id = P.product_id;


-- 👥 1581. Customer Who Visited but Did Not Make Any Transactions
-- 🔗 https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
SELECT V.customer_id, COUNT(V.visit_id) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY V.customer_id;


-- 🌡️ 197. Rising Temperature
-- 🔗 https://leetcode.com/problems/rising-temperature/
SELECT W1.id
FROM Weather AS W1
JOIN Weather AS W2 ON DATEDIFF(W1.recordDate, W2.recordDate) = 1
WHERE W1.temperature > W2.temperature;


-- ⚙️ 1661. Average Time of Process per Machine
-- 🔗 https://leetcode.com/problems/average-time-of-process-per-machine/
SELECT A1.machine_id,
       ROUND(AVG(A2.timestamp - A1.timestamp), 3) AS processing_time
FROM Activity A1
JOIN Activity A2
  ON A1.machine_id = A2.machine_id
 AND A1.process_id = A2.process_id
 AND A1.timestamp < A2.timestamp
GROUP BY A1.machine_id;


-- 💰 577. Employee Bonus
-- 🔗 https://leetcode.com/problems/employee-bonus/
SELECT E.name, B.bonus
FROM Employee E
LEFT JOIN Bonus B ON E.empId = B.empId
WHERE B.bonus < 1000 OR B.bonus IS NULL;


-- 🎓 1280. Students and Examinations
-- 🔗 https://leetcode.com/problems/students-and-examinations/
SELECT s.student_id, s.student_name, sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
  ON s.student_id = e.student_id
 AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;


-- 👨‍💼 570. Managers with at Least 5 Direct Reports
-- 🔗 https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
SELECT E1.name
FROM Employee E1
JOIN Employee E2 ON E1.id = E2.managerId
GROUP BY E1.id, E1.name
HAVING COUNT(E2.id) >= 5;


-- ✅ 1934. Confirmation Rate
-- 🔗 https://leetcode.com/problems/confirmation-rate/
SELECT S.user_id,
       IFNULL(ROUND(SUM(C.action = 'confirmed') / COUNT(*), 2), 0) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY S.user_id;


620. Not Boring Movies
SELECT * FROM Cinema WHERE mod(id,2)=1 and description!='boring' order by rating desc;


1251. Average Selling Price
SELECT P.product_id,   IFNULL(ROUND(sum(P.price*U.units)/sum(U.units),2),0) as average_price
FROM Prices P left join UnitsSold U on 
P.product_id = U.product_id and U.purchase_date Between start_date and end_date  group by P.product_id ;

1075. Project Employees I
select P.project_id , ROUND(sum(E.experience_years)/count(*),2) as average_years
from Project P join Employee E on P.employee_id = E.employee_id group by P.project_id ;
