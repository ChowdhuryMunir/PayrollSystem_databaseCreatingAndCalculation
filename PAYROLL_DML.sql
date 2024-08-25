



        --==============================================================================
                  --SELECT(SHOW) PAYROLL MANAGEMENT SYSTEM DATABASE TABLES
		--==============================================================================






USE PayrollDB;
SELECT * FROM prl.Departments;
SELECT * FROM prl.Positions;
SELECT * FROM prl.Employees;
SELECT * FROM prl.Attendance;
SELECT * FROM prl.Leave;
SELECT * FROM prl.Deductions;
SELECT * FROM prl.Overtime;
SELECT * FROM prl.Timesheet;
SELECT * FROM prl.Tax;
SELECT * FROM prl.Allowances;
SELECT * FROM prl.Bonus;
SELECT * FROM prl.Bonus;
SELECT * FROM prl.Payroll;
SELECT * FROM prl.EncryptedView;
SELECT * FROM prl.SchemaBoundView;

GO







--==================================================================================
							-- DML- "INSERT INTO TABLES " 
--====================================================================================

USE PayrollDB;
GO

INSERT INTO prl.Departments (DepartmentName) VALUES
('Software Development'),
('Human Resources'),
('Marketing'),
('Sales'),
('Customer Support'),
('Finance'),
('Research and Development'),
('IT Support'),
('Quality Assurance'),
('Product Management');
GO

INSERT INTO prl.Positions (PositionName, BaseSalary) VALUES
('Software Engineer', 70000.00),
('HR Manager', 60000.00),
('Marketing Coordinator', 50000.00),
('Sales Representative', 45000.00),
('Customer Support Specialist', 40000.00),
('Financial Analyst', 55000.00),
('Research Scientist', 65000.00),
('IT Support Engineer', 48000.00),
('QA Tester', 42000.00),
('Product Manager', 75000.00);
GO

USE PayrollDB;
GO

INSERT INTO prl.Employees (FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate) VALUES
('Aarav', 'Chowdhury', 'aarav.chowdhury@techcompany.com', '88012345601', '123 Bashundhara, Dhaka', 1, 1, '2022-01-05'),
('Aadhya', 'Sengupta', 'aadhya.sengupta@techcompany.com', '88012345602', '456 Gulshan, Dhaka', 1, 2, '2022-02-12'),
('Vihaan', 'Das', 'vihaan.das@techcompany.com', '88012345603', '789 Banani, Dhaka', 2, 3, '2022-03-15'),
('Ananya', 'Mitra', 'ananya.mitra@techcompany.com', '88012345604', '321 Dhanmondi, Dhaka', 2, 4, '2022-04-20'),
('Ishaan', 'Gupta', 'ishaan.gupta@techcompany.com', '88012345605', '654 Mirpur, Dhaka', 3, 5, '2022-05-25'),
('Anika', 'Banerjee', 'anika.banerjee@techcompany.com', '88012345606', '987 Uttara, Dhaka', 3, 6, '2022-06-30'),
('Arjun', 'Kumar', 'arjun.kumar@techcompany.com', '88012345607', '135 Motijheel, Dhaka', 4, 1, '2022-07-05'),
('Diya', 'Roy', 'diya.roy@techcompany.com', '88012345608', '246 Tejgaon, Dhaka', 4, 2, '2022-08-10'),
('Rohan', 'Ali', 'rohan.ali@techcompany.com', '88012345609', '357 Mohakhali, Dhaka', 5, 3, '2022-09-15'),
('Saanvi', 'Khan', 'saanvi.khan@techcompany.com', '88012345610', '468 Jatrabari, Dhaka', 5, 4, '2022-10-20'),
('Ayan', 'Bose', 'ayan.bose@techcompany.com', '88012345611', '579 Rampura, Dhaka', 6, 5, '2022-11-25'),
('Pari', 'Ghosh', 'pari.ghosh@techcompany.com', '88012345612', '680 Shyamoli, Dhaka', 6, 6, '2022-12-30'),
('Aditya', 'Sarkar', 'aditya.sarkar@techcompany.com', '88012345613', '781 Mohammadpur, Dhaka', 7, 1, '2023-01-05'),
('Vivaan', 'Majumdar', 'vivaan.majumdar@techcompany.com', '88012345614', '882 Savar, Dhaka', 7, 2, '2023-02-10'),
('Aarohi', 'Biswas', 'aarohi.biswas@techcompany.com', '88012345615', '983 Keraniganj, Dhaka', 8, 3, '2023-03-17'),
('Ansh', 'Barua', 'ansh.barua@techcompany.com', '88012345616', '084 Demra, Dhaka', 8, 4, '2023-04-22'),
('Sara', 'Islam', 'sara.islam@techcompany.com', '88012345617', '185 Paltan, Dhaka', 9, 5, '2023-05-27'),
('Ishan', 'Chatterjee', 'ishan.chatterjee@techcompany.com', '88012345618', '286 Lalbagh, Dhaka', 9, 6, '2023-06-01'),
('Aarush', 'Dutta', 'aarush.dutta@techcompany.com', '88012345619', '387 Badda, Dhaka', 10, 1, '2023-07-06'),
('Avni', 'Mazumder', 'avni.mazumder@techcompany.com', '88012345620', '488 Hatirjheel, Dhaka', 10, 2, '2023-08-11'),
('Reyansh', 'Nath', 'reyansh.nath@techcompany.com', '88012345621', '589 Azimpur, Dhaka', 1, 3, '2023-09-16'),
('Zara', 'Sheikh', 'zara.sheikh@techcompany.com', '88012345622', '690 Karwan Bazar, Dhaka', 1, 4, '2023-10-21'),
('Ayaan', 'Ahmed', 'ayaan.ahmed@techcompany.com', '88012345623', '791 New Market, Dhaka', 2, 5, '2023-11-26'),
('Anvi', 'Haque', 'anvi.haque@techcompany.com', '88012345624', '892 Farmgate, Dhaka', 2, 6, '2023-12-31'),
('Aarav', 'Hossain', 'aarav.hossain@techcompany.com', '88012345625', '993 Kakrail, Dhaka', 3, 1, '2024-01-05'),
('Anaya', 'Kabir', 'anaya.kabir@techcompany.com', '88012345626', '094 Malibagh, Dhaka', 3, 2, '2024-02-10'),
('Aryan', 'Sheikh', 'aryan.sheikh@techcompany.com', '88012345627', '195 Shantinagar, Dhaka', 4, 3, '2024-03-17'),
('Kiara', 'Rahman', 'kiara.rahman@techcompany.com', '88012345628', '296 Segunbagicha, Dhaka', 4, 4, '2024-04-22'),
('Aaradhya', 'Khan', 'aaradhya.khan@techcompany.com', '88012345629', '397 Elephant Road, Dhaka', 5, 5, '2024-05-27'),
('Ayaansh', 'Siddique', 'ayaansh.siddique@techcompany.com', '88012345630', '498 Purana Paltan, Dhaka', 5, 6, '2024-06-01');
GO

USE PayrollDB;
GO

INSERT INTO prl.Leave (EmployeeID, StartDate, EndDate, LeaveType, Status) VALUES
(1, '2022-03-01', '2022-03-10', 'Annual', 'Approved'),
(2, '2022-04-15', '2022-04-20', 'Sick', 'Approved'),
(3, '2022-05-10', '2022-05-15', 'Maternity/Paternity', 'Approved'),
(4, '2022-06-01', '2022-06-05', 'Unpaid', 'Approved'),
(5, '2022-07-20', '2022-07-25', 'Annual', 'Approved'),
(6, '2022-08-15', '2022-08-20', 'Sick', 'Approved'),
(7, '2022-09-05', '2022-09-10', 'Maternity/Paternity', 'Approved'),
(8, '2022-10-10', '2022-10-15', 'Unpaid', 'Approved'),
(9, '2022-11-01', '2022-11-05', 'Annual', 'Approved'),
(10, '2022-12-15', '2022-12-20', 'Sick', 'Approved'),
(11, '2023-01-10', '2023-01-15', 'Maternity/Paternity', 'Approved'),
(12, '2023-02-20', '2023-02-25', 'Unpaid', 'Approved'),
(13, '2023-03-15', '2023-03-20', 'Annual', 'Approved'),
(14, '2023-04-05', '2023-04-10', 'Sick', 'Approved'),
(15, '2023-05-10', '2023-05-15', 'Maternity/Paternity', 'Approved'),
(16, '2023-06-20', '2023-06-25', 'Unpaid', 'Approved'),
(17, '2023-07-15', '2023-07-20', 'Annual', 'Approved'),
(18, '2023-08-10', '2023-08-15', 'Sick', 'Approved'),
(19, '2023-09-01', '2023-09-05', 'Maternity/Paternity', 'Approved'),
(20, '2023-10-15', '2023-10-20', 'Unpaid', 'Approved'),
(21, '2023-11-10', '2023-11-15', 'Annual', 'Approved'),
(22, '2023-12-05', '2023-12-10', 'Sick', 'Approved'),
(23, '2024-01-20', '2024-01-25', 'Maternity/Paternity', 'Approved'),
(24, '2024-02-15', '2024-02-20', 'Unpaid', 'Approved'),
(25, '2024-03-10', '2024-03-15', 'Annual', 'Approved'),
(26, '2024-04-01', '2024-04-05', 'Sick', 'Approved'),
(27, '2024-05-15', '2024-05-20', 'Maternity/Paternity', 'Approved'),
(28, '2024-06-10', '2024-06-15', 'Unpaid', 'Approved'),
(29, '2024-07-05', '2024-07-10', 'Annual', 'Approved'),
(30, '2024-08-20', '2024-08-25', 'Sick', 'Approved');
GO


----For TimeSheet
USE PayrollDB;
GO

DECLARE @WorkDate DATE
SET @WorkDate = '2022-03-01'

WHILE @WorkDate <= '2022-03-31'
BEGIN
    IF DATENAME(dw, @WorkDate) NOT IN ('Saturday', 'Sunday')
    BEGIN
        INSERT INTO prl.TimeSheet (EmployeeID, Date, ClockIn, ClockOut) VALUES
        (1, @WorkDate, '09:00:00', '17:00:00'),
        (2, @WorkDate, '09:00:00', '17:00:00'),
        (3, @WorkDate, '09:00:00', '17:00:00'),
        (4, @WorkDate, '09:00:00', '17:00:00'),
        (5, @WorkDate, '09:00:00', '17:00:00'),
        (6, @WorkDate, '09:00:00', '17:00:00'),
        (7, @WorkDate, '09:00:00', '17:00:00'),
        (8, @WorkDate, '09:00:00', '17:00:00'),
        (9, @WorkDate, '09:00:00', '17:00:00'),
        (10, @WorkDate, '09:00:00', '17:00:00');
    END
    SET @WorkDate = DATEADD(day, 1, @WorkDate)
END
GO
USE PayrollDB;
GO
---Overtime Table
INSERT INTO prl.Overtime (TimeSheetID, Date, OvertimeHours, Description,EmployeeID) VALUES
(1, '2022-03-02', 2, 'Project Deadline',1),
(1, '2022-03-09', 1.5, 'Project Deadline',1),
(1, '2022-03-16', 3, 'Project Deadline',1),
(2, '2022-03-03', 2, 'System Upgrade',2),
(2, '2022-03-10', 2, 'System Upgrade',2),
(2, '2022-03-17', 2, 'System Upgrade',2),
(3, '2022-03-04', 4, 'Inventory Count',3),
(3, '2022-03-11', 3, 'Inventory Count',3),
(3, '2022-03-18', 2, 'Inventory Count',3),
(4, '2022-03-05', 1.5, 'Customer Support',4),
(4, '2022-03-12', 2, 'Customer Support',4),
(4, '2022-03-19', 2.5, 'Customer Support',4),
(5, '2022-03-06', 3, 'Report Preparation',5),
(5, '2022-03-13', 2, 'Report Preparation',5),
(5, '2022-03-20', 1, 'Report Preparation',5),
(6, '2022-03-07', 2, 'Audit Assistance',6),
(6, '2022-03-14', 2.5, 'Audit Assistance',6),
(6, '2022-03-21', 3, 'Audit Assistance',6),
(7, '2022-03-08', 1, 'Training Session',7),
(7, '2022-03-15', 1.5, 'Training Session',7),
(7, '2022-03-22', 1, 'Training Session',7),
(8, '2022-03-09', 2, 'Emergency Maintenance',8),
(8, '2022-03-16', 3, 'Emergency Maintenance',8),
(8, '2022-03-23', 2, 'Emergency Maintenance',8),
(9, '2022-03-10', 2, 'Product Launch',9),
(9, '2022-03-17', 2.5, 'Product Launch',9),
(9, '2022-03-24', 3, 'Product Launch',9),
(10, '2022-03-11', 1.5, 'Client Onboarding',10),
(10, '2022-03-18', 1, 'Client Onboarding',10),
(10, '2022-03-25', 2, 'Client Onboarding',10);
GO

--For Deductions

USE PayrollDB;
GO

INSERT INTO prl.Deductions (EmployeeID, DeductionDate, DeductionAmount, DeductionType) VALUES
(1, '2022-03-05', 50.00, 'Health Insurance'),
(1, '2022-03-12', 30.00, 'Retirement Plan'),
(1, '2022-03-19', 20.00, 'Union Dues'),
(2, '2022-03-05', 50.00, 'Health Insurance'),
(2, '2022-03-12', 30.00, 'Retirement Plan'),
(2, '2022-03-19', 20.00, 'Union Dues'),
(3, '2022-03-05', 50.00, 'Health Insurance'),
(3, '2022-03-12', 30.00, 'Retirement Plan'),
(3, '2022-03-19', 20.00, 'Union Dues'),
(4, '2022-03-05', 50.00, 'Health Insurance'),
(4, '2022-03-12', 30.00, 'Retirement Plan'),
(4, '2022-03-19', 20.00, 'Union Dues'),
(5, '2022-03-05', 50.00, 'Health Insurance'),
(5, '2022-03-12', 30.00, 'Retirement Plan'),
(5, '2022-03-19', 20.00, 'Union Dues'),
(6, '2022-03-05', 50.00, 'Health Insurance'),
(6, '2022-03-12', 30.00, 'Retirement Plan'),
(6, '2022-03-19', 20.00, 'Union Dues'),
(7, '2022-03-05', 50.00, 'Health Insurance'),
(7, '2022-03-12', 30.00, 'Retirement Plan'),
(7, '2022-03-19', 20.00, 'Union Dues'),
(8, '2022-03-05', 50.00, 'Health Insurance'),
(8, '2022-03-12', 30.00, 'Retirement Plan'),
(8, '2022-03-19', 20.00, 'Union Dues'),
(9, '2022-03-05', 50.00, 'Health Insurance'),
(9, '2022-03-12', 30.00, 'Retirement Plan'),
(9, '2022-03-19', 20.00, 'Union Dues'),
(10, '2022-03-05', 50.00, 'Health Insurance'),
(10, '2022-03-12', 30.00, 'Retirement Plan'),
(10, '2022-03-19', 20.00, 'Union Dues');
GO

---ForTAX
USE PayrollDB;
GO

INSERT INTO prl.Tax (EmployeeID, TaxYear, TaxAmount, TaxType) VALUES
(1, 2022, 300.00, 'Federal Income Tax'),
(1, 2022, 150.00, 'State Income Tax'),
(1, 2022, 100.00, 'Social Security Tax'),
(2, 2022, 300.00, 'Federal Income Tax'),
(2, 2022, 150.00, 'State Income Tax'),
(2, 2022, 100.00, 'Social Security Tax'),
(3, 2022, 300.00, 'Federal Income Tax'),
(3, 2022, 150.00, 'State Income Tax'),
(3, 2022, 100.00, 'Social Security Tax'),
(4, 2022, 300.00, 'Federal Income Tax'),
(4, 2022, 150.00, 'State Income Tax'),
(4, 2022, 100.00, 'Social Security Tax'),
(5, 2022, 300.00, 'Federal Income Tax'),
(5, 2022, 150.00, 'State Income Tax'),
(5, 2022, 100.00, 'Social Security Tax'),
(6, 2022, 300.00, 'Federal Income Tax'),
(6, 2022, 150.00, 'State Income Tax'),
(6, 2022, 100.00, 'Social Security Tax'),
(7, 2022, 300.00, 'Federal Income Tax'),
(7, 2022, 150.00, 'State Income Tax'),
(7, 2022, 100.00, 'Social Security Tax'),
(8, 2022, 300.00, 'Federal Income Tax'),
(8, 2022, 150.00, 'State Income Tax'),
(8, 2022, 100.00, 'Social Security Tax'),
(9, 2022, 300.00, 'Federal Income Tax'),
(9, 2022, 150.00, 'State Income Tax'),
(9, 2022, 100.00, 'Social Security Tax'),
(10, 2022, 300.00, 'Federal Income Tax'),
(10, 2022, 150.00, 'State Income Tax'),
(10, 2022, 100.00, 'Social Security Tax');
GO

---For Allownces

USE PayrollDB;
GO

INSERT INTO prl.Allowances (EmployeeID, AllowanceDate, AllowanceAmount, AllowanceType) VALUES
(1, '2022-03-01', 500.00, 'Housing Allowance'),
(1, '2022-03-15', 200.00, 'Transport Allowance'),
(1, '2022-03-29', 300.00, 'Meal Allowance'),
(2, '2022-03-01', 500.00, 'Housing Allowance'),
(2, '2022-03-15', 200.00, 'Transport Allowance'),
(2, '2022-03-29', 300.00, 'Meal Allowance'),
(3, '2022-03-01', 500.00, 'Housing Allowance'),
(3, '2022-03-15', 200.00, 'Transport Allowance'),
(3, '2022-03-29', 300.00, 'Meal Allowance'),
(4, '2022-03-01', 500.00, 'Housing Allowance'),
(4, '2022-03-15', 200.00, 'Transport Allowance'),
(4, '2022-03-29', 300.00, 'Meal Allowance'),
(5, '2022-03-01', 500.00, 'Housing Allowance'),
(5, '2022-03-15', 200.00, 'Transport Allowance'),
(5, '2022-03-29', 300.00, 'Meal Allowance'),
(6, '2022-03-01', 500.00, 'Housing Allowance'),
(6, '2022-03-15', 200.00, 'Transport Allowance'),
(6, '2022-03-29', 300.00, 'Meal Allowance'),
(7, '2022-03-01', 500.00, 'Housing Allowance'),
(7, '2022-03-15', 200.00, 'Transport Allowance'),
(7, '2022-03-29', 300.00, 'Meal Allowance'),
(8, '2022-03-01', 500.00, 'Housing Allowance'),
(8, '2022-03-15', 200.00, 'Transport Allowance'),
(8, '2022-03-29', 300.00, 'Meal Allowance'),
(9, '2022-03-01', 500.00, 'Housing Allowance'),
(9, '2022-03-15', 200.00, 'Transport Allowance'),
(9, '2022-03-29', 300.00, 'Meal Allowance'),
(10, '2022-03-01', 500.00, 'Housing Allowance'),
(10, '2022-03-15', 200.00, 'Transport Allowance'),
(10, '2022-03-29', 300.00, 'Meal Allowance');
GO

---FOR BONUS
USE PayrollDB;
GO

INSERT INTO prl.Bonus (EmployeeID, BonusType, BonusAmount, BonusDate) VALUES
(1, 'Performance', 1000.00, '2022-03-01'),
(1, 'Holiday', 500.00, '2022-07-04'),
(1, 'Year End', 1500.00, '2022-12-31'),
(2, 'Performance', 1000.00, '2022-03-01'),
(2, 'Holiday', 500.00, '2022-07-04'),
(2, 'Year End', 1500.00, '2022-12-31'),
(3, 'Performance', 1000.00, '2022-03-01'),
(3, 'Holiday', 500.00, '2022-07-04'),
(3, 'Year End', 1500.00, '2022-12-31'),
(4, 'Performance', 1000.00, '2022-03-01'),
(4, 'Holiday', 500.00, '2022-07-04'),
(4, 'Year End', 1500.00, '2022-12-31'),
(5, 'Performance', 1000.00, '2022-03-01'),
(5, 'Holiday', 500.00, '2022-07-04'),
(5, 'Year End', 1500.00, '2022-12-31'),
(6, 'Performance', 1000.00, '2022-03-01'),
(6, 'Holiday', 500.00, '2022-07-04'),
(6, 'Year End', 1500.00, '2022-12-31'),
(7, 'Performance', 1000.00, '2022-03-01'),
(7, 'Holiday', 500.00, '2022-07-04'),
(7, 'Year End', 1500.00, '2022-12-31'),
(8, 'Performance', 1000.00, '2022-03-01'),
(8, 'Holiday', 500.00, '2022-07-04'),
(8, 'Year End', 1500.00, '2022-12-31'),
(9, 'Performance', 1000.00, '2022-03-01'),
(9, 'Holiday', 500.00, '2022-07-04'),
(9, 'Year End', 1500.00, '2022-12-31'),
(10, 'Performance', 1000.00, '2022-03-01'),
(10, 'Holiday', 500.00, '2022-07-04'),
(10, 'Year End', 1500.00, '2022-12-31');
GO


USE PayrollDB;
GO

INSERT INTO prl.Payroll (EmployeeID, PayPeriodStart, PayPeriodEnd,PayDate) VALUES
(1, '2023-03-01', '2023-03-31','2023-04-01'),
(2, '2023-03-01', '2023-03-31','2023-04-01'),
(3, '2023-03-01', '2023-03-31','2023-04-01'),
(4, '2023-03-01', '2023-03-31','2023-04-01'),
(5, '2023-03-01', '2023-03-31','2023-04-01'),
(6, '2023-03-01', '2023-03-31','2023-04-01'),
(7, '2023-03-01', '2023-03-31','2023-04-01'),
(8, '2023-03-01', '2023-03-31','2023-04-01'),
(9, '2023-03-01', '2023-03-31','2023-04-01'),
(10, '2023-03-01','2023-03-31','2023-04-01');
GO

---=====================================================================================================================
							----INSERT UPDATE AND DELETE WITH " STORE PROCEDURE"
--=======================================================================================================================

-- Example of using the stored procedure for insert
EXEC prl.ProcessEmployee 'INSERT', NULL, 'BAKER', 'BHAI', 'BAKER.BHAI@gmail.com', '1234567890', '123 Main St', 1, 1, '2023-01-01', NULL;

-- Example of using the stored procedure for update
EXEC prl.ProcessEmployee 'UPDATE', 1, 'Rabindranath', 'Thakur', 'Rabindranath.Thakur@gmail.com', '9876543210', '456 Updated St', 2, 2, '2023-02-01', NULL;

-- Example of using the stored procedure for delete
EXEC prl.ProcessEmployee 'DELETE', 1;

GO
-----===================================================================================================================================================
                                 ----INSERT UPDATE AND DELETE WITH "VIEW"
--=======================================================================================================================================================

-- Insert data using the EncryptedView
INSERT INTO prl.EncryptedView (FirstName, LastName, Email)
VALUES ('Abraham', 'lincon', 'abraham@gmail.com');

-- Update data using the EncryptedView
UPDATE prl.EncryptedView
SET Email = 'Update@gmail.com'
WHERE EmployeeID=1;

-- Delete data using the EncryptedView
DELETE FROM prl.EncryptedView
WHERE EmployeeID=1;

GO
--===================================================================================================================================
					                                ---DISTINCT
--===================================================================================================================================


SELECT DISTINCT EmployeeID
FROM prl.TimeSheet 
GO


---====================================================================================================================================
													--JOINS--
--======================================================================================================================================
 --INNER JOIN
SELECT
    A.AttendanceID,
    A.EmployeeID,
    A.Date AS AttendanceDate,
    A.Status,
    T.TimeSheetID,
    T.ClockIn,
    T.ClockOut
FROM
    prl.TimeSheet as T
INNER JOIN
    prl.Attendance as A ON A.EmployeeID = T.EmployeeID ;
	GO
	--==================
		-- LEFT JOIN
	--==================
SELECT
    A.AttendanceID,
    A.EmployeeID,
    A.Date AS AttendanceDate,
    A.Status,
    T.TimeSheetID,
    T.ClockIn,
    T.ClockOut
FROM
    prl.Attendance A
LEFT JOIN
    prl.TimeSheet T ON A.EmployeeID = T.EmployeeID;
	GO

	--==================
		-- RIGHT JOIN
	--==================
SELECT *
FROM
    prl.Employees E
RIGHT JOIN
    prl.TimeSheet T ON E.EmployeeID = T.EmployeeID;
	GO

----==================
	--CROSS JOIN
-----==================
SELECT *
FROM
    prl.Employees 
CROSS JOIN
    prl.TimeSheet ;


--=============
--SELF JOIN
--=================
 SELECT DISTINCT E1.LastName, E2.EmployeeID
FROM prl.Employees E1
Join prl.Employees E2
On E1.EmployeeID = E2.EmployeeID
GO

--================================================================================================================
--									        UNION
--================================================================================================================
--UNION
		SELECT FirstName,LastName
		FROM prl.Employees 
		WHERE EmployeeID < 5 
   UNION
		SELECT Email,Address 
		FROM prl.Employees 
		WHERE DepartmentID=1

--UNION ALL
	 SELECT FirstName,LastName
		FROM prl.Employees 
		WHERE EmployeeID < 5 
 UNION All
		SELECT Email,Address 
		FROM prl.Employees 
		WHERE DepartmentID=1


-- ===============================================================================================================================
											--QUERY WITH SIX CLAUSE
--================================================================================================================================
SELECT
    DepartmentID,
    COUNT(EmployeeID) AS TotalEmployees,
    AVG(DATEDIFF(YEAR, HireDate, GETDATE())) AS AverageYearsOfService
FROM prl.Employees
WHERE YEAR(HireDate) = 2023
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 1
ORDER BY DepartmentID;
go
-- ================================================================================================================================
										-- QUERY WITH---CUBE, ROLLUP, OVER
--=================================================================================================================================

-- CUBE query on prl.Employees
SELECT
    DepartmentID,
    AVG(DATEDIFF(YEAR, HireDate, GETDATE())) AS AverageYearsOfService,
    COUNT(EmployeeID) AS TotalEmployees
FROM prl.Employees
GROUP BY CUBE(DepartmentID);

-- ROLLUP query on prl.Employees
SELECT
    DepartmentID,
    AVG(DATEDIFF(YEAR, HireDate, GETDATE())) AS AverageYearsOfService,
    COUNT(EmployeeID) AS TotalEmployees
FROM prl.Employees
GROUP BY ROLLUP(DepartmentID);

-- OVER query on prl.Employees
SELECT
    EmployeeID,
    DepartmentID,
    AVG(DATEDIFF(YEAR, HireDate, GETDATE())) OVER (PARTITION BY DepartmentID) AS AverageYearsOfService,
    COUNT(EmployeeID) OVER (PARTITION BY DepartmentID) AS TotalEmployees
FROM prl.Employees
ORDER BY DepartmentID, EmployeeID;




--=============================================================================================================================
											--SUBQUERY
--=============================================================================================================================


SELECT EmployeeID,FirstName,LastName,DepartmentID
FROM prl.Employees
WHERE
    DepartmentID IN (SELECT DepartmentID FROM prl.Departments WHERE DepartmentName = 'Human Resources');

GO





--============================================================================================================================
											--Common Table Expression (CTE) 
--============================================================================================================================

WITH EmployeeDepartmentCTE AS 
(
SELECT E.EmployeeID,E.FirstName,E.LastName,E.DepartmentID,D.DepartmentName
FROM prl.Employees E
INNER JOIN prl.Departments D 
ON E.DepartmentID = D.DepartmentID
)
SELECT EmployeeID,FirstName,LastName,DepartmentID,DepartmentName
FROM EmployeeDepartmentCTE;
GO





----=========================================================================================================================
												-- OFFSET and FETCH 
--============================================================================================================================

SELECT EmployeeID,FirstName,LastName,DepartmentID
FROM prl.Employees
ORDER BY EmployeeID OFFSET 10 ROWS  -- Skip the first 10 rows
FETCH NEXT 5 ROWS ONLY; -- Return the next 5 rows
go





--=========================================================================================================================
--									 TOP CLAUSES WITH TIES AND PARCENT
--===========================================================================================================================
SELECT TOP 5 WITH TIES
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID
FROM
    prl.Employees
ORDER BY
    DepartmentID DESC;

--PERCENT
SELECT TOP 5 PERCENT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID
FROM
    prl.Employees
ORDER BY
    DepartmentID DESC;

	GO




--============================================================================================================================
										-- Query with GROUPING SETS
--============================================================================================================================

SELECT D.DepartmentID,D.DepartmentName,COUNT(E.EmployeeID) AS TotalEmployees,AVG(DATEDIFF(YEAR, E.HireDate, GETDATE())) AS AverageYearsOfService
FROM prl.Departments D
LEFT JOIN prl.Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY GROUPING SETS ((D.DepartmentID, D.DepartmentName), ());
GO





--========================================================================================================================
								-- Query with ANY, ALL, EXISTS, and IN
--========================================================================================================================


SELECT EmployeeID,FirstName,LastName,DepartmentID,HireDate
FROM prl.Employees
WHERE
    DepartmentID = ANY (SELECT DepartmentID FROM prl.Departments WHERE DepartmentName = 'Human Resources')
    OR EmployeeID > ALL (SELECT EmployeeID FROM prl.Employees WHERE EmployeeID = 1)
    OR EXISTS (SELECT 1 FROM prl.Attendance WHERE EmployeeID = prl.Employees.EmployeeID AND Status = 'Present')
    OR EmployeeID IN (SELECT EmployeeID FROM prl.Leave WHERE Status = 'Approved');
	go


--================================================================================================================
--                                       WILDCARD & LIKE
--================================================================================================================
SELECT * 
FROM prl.Employees
WHERE FirstName+LastName LIKE 'A%'
GO

SELECT * 
FROM prl.Employees
WHERE FirstName+LastName LIKE 'A[^a-r]%'
GO

SELECT * 
FROM prl.Employees
WHERE FirstName+LastName LIKE 'A[a-d]%'
GO
--================================================================================================================
--                                         AGGREGATE FUNCTIONS
--================================================================================================================

-- Query with Aggregate Functions
SELECT DepartmentID,COUNT(EmployeeID) AS TotalEmployees
FROM prl.Employees
GROUP BY DepartmentID;

SELECT PositionName,Avg(BaseSalary) AS AverageSalary
FROM prl.Positions
GROUP BY PositionName

SELECT Sum(BaseSalary) AS TotalSalary
FROM prl.Positions;

SELECT MAX(BaseSalary) AS HighestSalary
FROM prl.Positions;

SELECT MIN(BaseSalary) AS lowestSalary
FROM prl.Positions;


--================================================================================================================
--									CAST,CONVERT,TRY_CONVERT
--================================================================================================================

SELECT 'Today :' + CAST(GETDATE() AS VARCHAR)
SELECT 'Today :' + CONVERT(VARCHAR, GETDATE(),1)  AS VARCHARDATE_1
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 7) AS VARCHARDATE_07
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 10) AS VARCHARDATE_10
SELECT 'Today :' + TRY_CONVERT (VARCHAR, GETDATE(), 12) AS VARCHARDATE_12
GO


Select DATEDIFF (yy, CAST('10/12/1990' as datetime), GETDATE()) As Years,
DATEDIFF (MM, CAST('10/12/1990' as datetime), GETDATE()) As Months,
DATEDIFF (DD, CAST('10/12/1990' as datetime), GETDATE ()) As Days
GO

--================================================================================================================
--									   DATE/TIME Function
--================================================================================================================

-- DATE/TIME Function- 
SELECT DATEDIFF(yy, CAST('02/09/2020' AS Datetime), GETDATE()) AS YEARS
SELECT DATEDIFF(MM, CAST('01/09/2021' AS Datetime), GETDATE()) %12 AS Months
SELECT DATEDIFF(DD, CAST('02/09/2021' AS Datetime), GETDATE())%30 AS YEARS
GO

--Isdate
SELECT ISDATE('2030-10-21')
--Datepart
SELECT DATEPART(MONTH,'2030-07-21')
--Datename
SELECT DATENAME(MONTH,'2030-01-21')
--Sysdatetime
SELECT Sysdatetime()
--UTC
SELECT GETUTCDATE()
--Datediff
SELECT DATEDIFF (YEAR, '2015-12-01', '2016-09-30')
GO

 --================================================================================================================
--								           NUMERIC FUNCTIONS
--================================================================================================================

SELECT FLOOR(OvertimeHours) AS [AVG.Overtime], OvertimeHours 
from prl.Overtime

SELECT CEILING(OvertimeHours) AS [AVG.Overtime], OvertimeHours 
from prl.Overtime

DECLARE @price money = 25.49
SELECT FLOOR(@price) AS FLOORRESULT, ROUND(@price,-1) AS ROUNDRESULT
GO

DECLARE @price decimal (10,2)
SET @price = 15.755
SELECT ROUND(@price,1)		
SELECT ROUND(@price,-1)		
SELECT ROUND(@price,2)		
SELECT ROUND(@price,-2)		
SELECT ROUND(@price,3)		
SELECT ROUND(@price,-3)		
SELECT CEILING(@price)		
SELECT FLOOR(@price)
GO

--================================================================================================================
--                                        MATHEMATICAL OPERATOR
--================================================================================================================

SELECT 500+3916 as [Sum]
GO
SELECT 4067-1535 as [Substraction]
GO
SELECT 3.14*3 as [Multiplication]
GO
SELECT 39/2 as [Divide]
GO
SELECT 100%3 as [Remainder]
GO



Select *

from prl.Employees

 full outer join prl.TimeSheet on prl.TimeSheet.EmployeeID = prl.Employees.EmployeeID

where Date = '2022-03-08'