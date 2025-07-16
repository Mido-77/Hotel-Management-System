# 🏨 Hotel Management System – SQL Project

A relational database project designed to manage operations for a hotel, including guests, rooms, reservations, services, payments, and staff. Built using **SQL Server**, this system supports essential operations such as booking, billing, service requests, and administrative reporting.

---

## 🧱 Database Schema

The system includes the following normalized tables:

- **Guest & GuestName** – Stores guest contact and full name details
- **Room** – Manages room details (type, rate, availability)
- **Staff & StaffRole** – Records staff members and their roles, shifts, and salaries
- **Service** – Defines hotel services and assigns responsible staff
- **Reservation** – Captures check-in/check-out details and guest-room linkage
- **Bill & Payment** – Handles billing and payment tracking
- **Requests** – Manages guest service requests
- **Books** – Associative table connecting guests, rooms, and reservations

Each table is created with relevant **constraints**: primary keys, foreign keys, `CHECK`, and `UNIQUE` constraints for data integrity.

---

## 🖼️ ERD (Entity-Relationship Diagram)

![Hotel Management ERD](./9ba9f798-bccf-40c3-8561-61abc14c5810.png)

> This ERD illustrates relationships among all entities, enforcing foreign keys and key constraints across bookings, billing, services, and staff.

---

## 📦 Features

- Manage **guest check-ins/check-outs** with full room tracking
- Handle **multiple reservations per guest**
- Track **services requested** by guests and assign staff
- Generate **bills and payments** for each reservation
- Support for **staff roles, salaries, and shifts**
- Calculate **stay duration** and **total bill amount**
- Retrieve analytics via **GROUP BY, HAVING**, and **JOIN** queries

---

## 🔍 Key SQL Features Demonstrated

✅ Foreign key relationships  
✅ Identity columns and auto-incremented keys  
✅ Normalized schema (3NF)  
✅ Aggregation with `COUNT`, `AVG`, `MAX`, `MIN`  
✅ Advanced `JOIN` operations  
✅ Derived attributes (e.g., stay duration, total bill amount)  
✅ `GROUP BY` and `HAVING` filtering  
✅ Use of `CHECK`, `DEFAULT`, and `UNIQUE` constraints

---

## 🧪 Sample Queries

```sql
-- List available rooms sorted by highest rate
SELECT * FROM Room WHERE Rstatus = 'Available' ORDER BY Rate DESC;

-- Count reservations per guest with more than 1 booking
SELECT GuestID, COUNT(*) AS ReservationCount
FROM Reservation
GROUP BY GuestID
HAVING COUNT(*) > 1;

-- List all services and assigned staff
SELECT S.SType, Stf.Staff_name
FROM Service S
JOIN Staff Stf ON S.SInCharge = Stf.Staff_ID;

-- Total amount for each reservation
SELECT Res.ResNo, Res.GuestID,
       DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) AS DysStyed,
       (DATEDIFF(DAY, Res.ChkInDate, Res.ChkOutDate) * R.Rate) AS TotalAmnt
FROM Reservation Res
JOIN Room R ON Res.RNo = R.RNo;

