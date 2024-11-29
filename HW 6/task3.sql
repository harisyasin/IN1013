-- 1
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' 
  AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT w.first_name, w.surname
FROM restStaff w
WHERE w.headwaiter = (
    SELECT s.headwaiter
    FROM restStaff s
    WHERE s.first_name = 'Zoe' AND s.surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT w.first_name, w.surname
FROM restStaff w
JOIN restBill b1 ON w.staff_no = b1.waiter_no
JOIN restBill b2 ON b1.table_no = b2.table_no
WHERE b2.bill_no IN (00014, 00017);

-- 6
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = 005 -- Headwaiter of Blue room on 160312
   OR s.headwaiter = 005;
