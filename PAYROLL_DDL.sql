--===============================================--==========================================================================================================
                       -- CREATING DATABASE FOR 'PAYROLL MANAGEMENT SYSTEM'
--===============================================--======================================================================================================================

USE master
GO
IF DB_ID('PayrollDB') IS NOT NULL
	DROP DATABASE PayrollDB
GO

use master
go
declare @data_path nvarchar(256) 
Set @data_path = (select SUBSTRING(Physical_name,1,charindex(N'master.mdf',Lower(Physical_name)) -1)
	from master.sys.master_files
	where database_id=1 and FILE_ID=1);
Execute ('create database PayrollDB
		ON PRIMARY (Name=PayrollDB,Filename=''' +@data_path+'PayrollDB.mdf'', size=100MB, maxsize=unlimited, filegrowth=5MB)
		Log On (Name=PayrollDB_log,Filename=''' +@data_path+'PayrollDB_log.ldf'', size=30MB, maxsize=50MB, filegrowth=2MB)'
		);
		go

--===============================================--=====================================================================================================
									-- CREATING "SCHEMA"
--===============================================--======================================================================================================

use PayrollDB
go
create schema prl
go

--========================================================--=====================================================================================================
									-- CREATING "TABLES"
--========================================================--=====================================================================================================
-- Department Table
CREATE TABLE prl.Departments 
(
    DepartmentID INT PRIMARY KEY Identity,
    DepartmentName NVARCHAR(100) NOT NULL,
);
GO

-- Position Table
CREATE TABLE prl.Positions
(
    PositionID INT PRIMARY KEY Identity,
    PositionName NVARCHAR(100) NOT NULL,
    BaseSalary DECIMAL(10, 2) NOT NULL CHECK (BaseSalary >= 0)
);
GO

-- Employee Table
CREATE TABLE prl.Employees 
(
    EmployeeID INT PRIMARY KEY Identity,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    DepartmentID INT,
    PositionID INT,
    HireDate DATE NOT NULL,
    TerminationDate DATE,
    -- Foreign keys
    FOREIGN KEY (DepartmentID) REFERENCES prl.Departments(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES prl.Positions(PositionID)
);
GO
-- Attendance Table
CREATE TABLE prl.Attendance (
    AttendanceID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    Date DATE NOT NULL,
    Status NVARCHAR(50) NOT NULL CHECK (Status IN ('Present', 'Absent', 'Late')),
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- Leave Table
CREATE TABLE prl.Leave (
    LeaveID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    LeaveType NVARCHAR(50) NOT NULL,
    Status NVARCHAR(50) NOT NULL CHECK (Status IN ('Approved', 'Rejected', 'Pending')),
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- TimeSheet Table
CREATE TABLE prl.TimeSheet 
(
    TimeSheetID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    Date DATE NOT NULL,
    ClockIn TIME NOT NULL,
    ClockOut TIME,
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- Overtime Table
CREATE TABLE prl.Overtime 
(
    OvertimeID INT PRIMARY KEY Identity,
    TimeSheetID INT NOT NULL,
	EmployeeID INT NOT NULL,
    OvertimeHours DECIMAL(5, 2) NOT NULL CHECK (OvertimeHours > 0),
	DATE DATE NOT NULL,
	Description varchar(50),
    -- Foreign keys
    FOREIGN KEY (TimeSheetID) REFERENCES prl.TimeSheet(TimeSheetID),
	FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO


-- Deductions Table
CREATE TABLE prl.Deductions 
(
    DeductionID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    DeductionType NVARCHAR(100) NOT NULL,
    DeductionAmount DECIMAL(10, 2) NOT NULL CHECK (DeductionAmount >= 0),
    DeductionDate DATE NOT NULL,
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- Tax Table
CREATE TABLE prl.Tax (
    TaxID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    TaxAmount DECIMAL(10, 2) NOT NULL CHECK (TaxAmount >= 0),
    TaxYear int NOT NULL,
	TaxType varchar(50),
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO


-- Allowances Table
CREATE TABLE prl.Allowances 
(
    AllowanceID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    AllowanceType NVARCHAR(100) NOT NULL,
    AllowanceAmount DECIMAL(10, 2) NOT NULL CHECK (AllowanceAmount >= 0),
    AllowanceDate DATE NOT NULL,
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- Bonus Table
CREATE TABLE prl.Bonus (
    BonusID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    BonusType NVARCHAR(100) NOT NULL,
    BonusAmount DECIMAL(10, 2) NOT NULL CHECK (BonusAmount >= 0),
    BonusDate DATE NOT NULL,
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO

-- Payroll Table
CREATE TABLE prl.Payroll 
(
    PayrollID INT PRIMARY KEY Identity,
    EmployeeID INT NOT NULL,
    PayPeriodStart DATE NOT NULL,
    PayPeriodEnd DATE NOT NULL,
    GrossPay DECIMAL(10, 2) NOT NULL DEFAULT(0),
    NetPay DECIMAL(10, 2) NOT NULL DEFAULT(0),
    PayDate DATE NOT NULL,
    -- Foreign keys
    FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);
GO
-----========================================================================
                             -- ALTER TABLE
-----========================================================================

ALTER TABLE prl.Employees
ALTER COLUMN HireDate DATETIME NULL;

ALTER TABLE prl.Employees
ADD Salary DECIMAL(12, 2);

--UPDATE prl.Employees
--SET Salary = ROUND(Salary, 2);

ALTER TABLE prl.Employees
DROP COLUMN Salary;





--=========================================================================================
                -- CREATING "INDEX" CLUSTURED + NON CLUSTERED
--===========================================================================================

-- Create Unique Clustered Index on EmployeeID and Date in prl.Attendance
CREATE UNIQUE CLUSTERED INDEX IX_Clustered_Attendance
ON prl.Attendance(EmployeeID, Date);
GO

-- Create Non-Clustered Index on Date in prl.Attendance
CREATE NONCLUSTERED INDEX IX_NonClustered_Attendance_Date
ON prl.Attendance(Date);
GO



---=============================================================================
			-- "VIEW" WITH ENCRYPTION
--==============================================================================
    -- Create a view with encryption
CREATE VIEW prl.EncryptedView
WITH ENCRYPTION
AS
SELECT 
    EmployeeID,
    FirstName,
    LastName,
    Email
FROM 
    prl.Employees;
GO
---=============================================================================
			-- "VIEW" WITH SCHEMA-BINDING
--==============================================================================
-- Create a view with schema binding
CREATE VIEW prl.SchemaBoundView
WITH SCHEMABINDING
AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM 
    prl.Employees e
JOIN
    prl.Departments d ON e.DepartmentID = d.DepartmentID;
GO


---===================================================================================================
							 -- CREATING A "TABULAR FUNCTION"
--==================================================================================================

-- Create a table-valued function
CREATE FUNCTION prl.GetEmployeesInDepartment
(
    @DepartmentID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        Email
    FROM 
        prl.Employees
    WHERE 
        DepartmentID = @DepartmentID
);
GO


--============================================================--================================================================================================
								--CREATING "SCALAR FUNCTION" FOR CALCULATION 
--============================================================--================================================================================================================


/*Function To calculate DEDUCTIONS*/
CREATE FUNCTION prl.CalculateDeductions
(@EmployeeID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalDeductions DECIMAL(10, 2);

    SELECT @TotalDeductions = ISNULL(SUM(DeductionAmount), 0)
    FROM prl.Deductions
    WHERE EmployeeID = @EmployeeID;

    RETURN @TotalDeductions;
END;
GO



/*Function To calculate GossPAY*/
CREATE FUNCTION prl.CalculateGrossPay
(
@EmployeeID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @BaseSalary DECIMAL(10, 2);
    DECLARE @TotalBonuses DECIMAL(10, 2);
    DECLARE @TotalAllowances DECIMAL(10, 2);
    DECLARE @GrossPay DECIMAL(10, 2);
	 

    SELECT @BaseSalary = BaseSalary
    FROM prl.Positions
    WHERE PositionID IN (SELECT PositionID FROM prl.Employees WHERE EmployeeID = @EmployeeID);

    SELECT @TotalBonuses = ISNULL(SUM(BonusAmount), 0)
    FROM prl.Bonus
    WHERE EmployeeID = @EmployeeID;

    SELECT @TotalAllowances = ISNULL(SUM(AllowanceAmount), 0)
    FROM prl.Allowances
    WHERE EmployeeID = @EmployeeID;

    SET @GrossPay = @BaseSalary + @TotalBonuses + @TotalAllowances ;

    RETURN @GrossPay;
END;
GO



/******* OVERTIMEFUNCTION   ****/
CREATE FUNCTION prl.CalculateOvertimeAmount
(
    @EmployeeID INT,
    @PayPeriodStart DATE,
    @PayPeriodEnd DATE
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @HourlyRate DECIMAL(10, 2);
    DECLARE @OvertimeHours INT;
    DECLARE @OvertimeMultiplier DECIMAL(10, 2);
    DECLARE @OvertimeAmount DECIMAL(10, 2);

    -- Retrieve the hourly rate for the employee
    SELECT @HourlyRate =BaseSalary/160
    FROM prl.Positions p
	join prl.Employees e
    on p.PositionID =e.PositionID ;

    -- Retrieve the number of overtime hours worked by the employee in the pay period
    SELECT @OvertimeHours = SUM(OvertimeHours)
    FROM prl.Overtime
    WHERE EmployeeID = @EmployeeID
    AND Date BETWEEN @PayPeriodStart AND @PayPeriodEnd;

    -- Define the overtime multiplier (e.g., 1.5 for 50% more than the regular pay)
    SET @OvertimeMultiplier = 1.5;

    -- Calculate the overtime amount
    SET @OvertimeAmount = @HourlyRate * @OvertimeHours * @OvertimeMultiplier;

    RETURN @OvertimeAmount;
END;
GO


--=================================================================--============================================================================================
							-- "STORE PROCEDURE" TO CALCULATE NET PAY AND UPDATE PAYROLL TABLE--
--==================================================================--==========================================================================================
CREATE PROCEDURE prl.CalculateNetPay
(
@EmployeeID INT
)
AS
BEGIN
    DECLARE @GrossPay DECIMAL(10, 2);
    DECLARE @TotalDeductions DECIMAL(10, 2);
    DECLARE @TotalTaxes DECIMAL(10, 2);
    DECLARE @NetPay DECIMAL(10, 2); 

    -- Calculate gross pay
    SET @GrossPay = prl.CalculateGrossPay(@EmployeeID);

    -- Calculate total deductions
    SET @TotalDeductions = prl.CalculateDeductions(@EmployeeID);

    -- Calculate total taxes
    SELECT @TotalTaxes = ISNULL(SUM(TaxAmount), 0)
    FROM prl.Tax
    WHERE EmployeeID = @EmployeeID;

    -- Calculate net pay
    SET @NetPay = @GrossPay - @TotalDeductions - @TotalTaxes;

    -- Update the Payroll table
    UPDATE prl.Payroll
    SET GrossPay = @GrossPay, NetPay = @NetPay
    WHERE EmployeeID = @EmployeeID;

    -- Return the net pay
    SELECT @NetPay AS NetPay;
END;
go
--==================================================================================================================
						 --"STORE PROCEDURE" FOR "INSERT" "UPDATE" "DELETE"
--================================================================================================================
-- Create a stored procedure for insert, update, and delete in the Employees table

CREATE PROCEDURE prl.ProcessEmployee
    @Operation NVARCHAR(10), -- 'INSERT', 'UPDATE', or 'DELETE'
    @EmployeeID INT = NULL,
    @FirstName NVARCHAR(50) = NULL,
    @LastName NVARCHAR(50) = NULL,
    @Email NVARCHAR(100) = NULL,
    @Phone NVARCHAR(15) = NULL,
    @Address NVARCHAR(255) = NULL,
    @DepartmentID INT = NULL,
    @PositionID INT = NULL,
    @HireDate DATE = NULL,
    @TerminationDate DATE = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Operation = 'INSERT'
    BEGIN
        -- Insert operation
        INSERT INTO prl.Employees (FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate)
        VALUES (@FirstName, @LastName, @Email, @Phone, @Address, @DepartmentID, @PositionID, @HireDate, @TerminationDate);
    END
    ELSE IF @Operation = 'UPDATE'
    BEGIN
        -- Update operation
        UPDATE prl.Employees
        SET 
            FirstName = @FirstName,
            LastName = @LastName,
            Email = @Email,
            Phone = @Phone,
            Address = @Address,
            DepartmentID = @DepartmentID,
            PositionID = @PositionID,
            HireDate = @HireDate,
            TerminationDate = @TerminationDate
        WHERE EmployeeID = @EmployeeID;
    END
    ELSE IF @Operation = 'DELETE'
    BEGIN
        -- Delete operation
        DELETE FROM prl.Employees WHERE EmployeeID = @EmployeeID;
    END
    ELSE
    BEGIN
        
		-- Invalid operation
		BEGIN TRANSACTION
         PRINT 'INVALID OPERATION'
		COMMIT TRANSACTION
    END
END;
GO

--=====================================================================================
			--STORE PROCEDURE FOR MULTIPLE TABLE(INCLUDING TEMPORARY TABLE)
--======================================================================================

-- Create a stored procedure for multiple tables
CREATE PROCEDURE prl.GetEmployeeDetailsByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare a temporary table to store the result
    CREATE TABLE #EmployeeDetails
    (
        EmployeeID INT,
        FirstName NVARCHAR(50),
        LastName NVARCHAR(50),
        Email NVARCHAR(100),
        Phone NVARCHAR(15),
        Address NVARCHAR(255),
        DepartmentName NVARCHAR(100),
        PositionName NVARCHAR(100),
        HireDate DATE,
        TerminationDate DATE
    );

    -- Insert data into the temporary table by joining Employees and Departments tables
    INSERT INTO #EmployeeDetails (EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentName, PositionName, HireDate, TerminationDate)
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        e.Email,
        e.Phone,
        e.Address,
        d.DepartmentName,
        p.PositionName,
        e.HireDate,
        e.TerminationDate
    FROM 
        prl.Employees e
    INNER JOIN
        prl.Departments d ON e.DepartmentID = d.DepartmentID
    LEFT JOIN
        prl.Positions p ON e.PositionID = p.PositionID
    WHERE 
        e.DepartmentID = @DepartmentID;

    -- Select data from the temporary table
    SELECT * FROM #EmployeeDetails;

    -- Drop the temporary table
    DROP TABLE #EmployeeDetails;
END;
GO
--====================================================================================================--==================================================================================
				         --  "AFTER TRIGGERS" FOR INSERT, UPDATE, AND DELETE
--====================================================================================================--==================================================================================

-- Create an audit table for Employee changes
CREATE TABLE prl.EmployeeAuditLog
(
    AuditLogID INT PRIMARY KEY IDENTITY,
    Operation NVARCHAR(10) NOT NULL,
    EmployeeID INT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    DepartmentID INT,
    PositionID INT,
    HireDate DATE,
    TerminationDate DATE,
    AuditDateTime DATETIME DEFAULT GETDATE()
);
GO

-- Create an AFTER INSERT, UPDATE, DELETE trigger on the Employees table
CREATE TRIGGER tr_EmployeeChanges
ON prl.Employees
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert records into the audit table for INSERT operations
    INSERT INTO prl.EmployeeAuditLog (Operation, EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate)
    SELECT 'INSERT', EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate
    FROM inserted;

    -- Insert records into the audit table for UPDATE operations
    INSERT INTO prl.EmployeeAuditLog (Operation, EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate)
    SELECT 'UPDATE', EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate
    FROM deleted;

    -- Insert records into the audit table for DELETE operations
    INSERT INTO prl.EmployeeAuditLog (Operation, EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate)
    SELECT 'DELETE', EmployeeID, FirstName, LastName, Email, Phone, Address, DepartmentID, PositionID, HireDate, TerminationDate
    FROM deleted;
END;
GO


---========================================================================================================================
								--INSTEAD OF INSERT, UPDATE, DELETE TRIGGER
--===============================================================================================================================
-- Create an audit table for Department changes
CREATE TABLE prl.DepartmentAuditLog
(
    AuditLogID INT PRIMARY KEY IDENTITY,
    Operation NVARCHAR(10) NOT NULL,
    DepartmentID INT,
    DepartmentName NVARCHAR(100),
    AuditDateTime DATETIME DEFAULT GETDATE()
);
GO

-- Create an INSTEAD OF INSERT, UPDATE, DELETE trigger on the Departments table
CREATE TRIGGER tr_DepartmentChanges
ON prl.Departments
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Handle INSERT operation
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO prl.DepartmentAuditLog (Operation, DepartmentID, DepartmentName)
        SELECT 'INSERT', DepartmentID, DepartmentName
        FROM inserted;
    END

    -- Handle UPDATE operation
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO prl.DepartmentAuditLog (Operation, DepartmentID, DepartmentName)
        SELECT 'UPDATE', DepartmentID, DepartmentName
        FROM inserted;

        UPDATE d
        SET
            DepartmentName = u.DepartmentName
        FROM
            prl.Departments d
        INNER JOIN
            inserted u ON d.DepartmentID = u.DepartmentID;
    END

    -- Handle DELETE operation
    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO prl.DepartmentAuditLog (Operation, DepartmentID, DepartmentName)
        SELECT 'DELETE', DepartmentID, DepartmentName
        FROM deleted;

        DELETE FROM d
        FROM prl.Departments d
        INNER JOIN deleted del ON d.DepartmentID = del.DepartmentID;
    END
END;
GO
---=================================================================================================================
						-- TRIGGER "DROP", "DISABLE", "ENABLE"
----=================================================================================================================

-- Drop the tr_DepartmentChanges trigger
DROP TRIGGER tr_DepartmentChanges;

-- Disable the tr_DepartmentChanges trigger
DISABLE TRIGGER tr_DepartmentChanges ON prl.Departments;

-- Enable the tr_DepartmentChanges trigger
ENABLE TRIGGER tr_DepartmentChanges ON prl.Departments;
GO

---==========================================================================================================
							--- CREATE, DROP AND TRUNCATE TABLE 
---=========================================================================================================
CREATE TABLE EmployeePayroll
(
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(100),
    BaseSalary DECIMAL(10, 2) NOT NULL,
    HireDate DATE NOT NULL,
    TerminationDate DATE,
    CONSTRAINT FK_EmployeePayroll_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES prl.Employees(EmployeeID)
);

	-- Drop the table
DROP TABLE EmployeePayroll;

-- Truncate the table
TRUNCATE TABLE EmployeePayroll;
GO

--==================================================================
					--CREATING SEQUENCE
--==================================================================

CREATE SEQUENCE sq_EmployeeIDSequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 1000000
    NO CYCLE ;

-- Example of using the sequence to generate IDs
DECLARE @NewEmployeeID INT;
SET @NewEmployeeID = NEXT VALUE FOR EmployeeIDSequence;
PRINT 'New Employee ID: ' + CAST(@NewEmployeeID AS NVARCHAR(10));
GO

---============================================================================================================
                               -- MERGE TABLES
---===============================================================================================================

MERGE INTO prl.Attendance AS target
USING prl.Employees AS source
ON target.EmployeeID = source.EmployeeID
WHEN MATCHED THEN
    UPDATE SET target.Status = 'PRESENT'  -- Update when matched
WHEN NOT MATCHED BY TARGET THEN
    INSERT (EmployeeID, Date, Status) 
    VALUES (source.EmployeeID, '2023-01-01', 'ABSENT')  -- Insert when not matched in target
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;  -- Delete action when not matched in source
GO


--=========================================--==========================================================
							--"VIEW" FOR SALARY DETAILS
--=========================================--============================================================
go
CREATE VIEW vw_SalaryDetails
AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    prl.CalculateDeductions(e.EmployeeID) AS TotalDeductions,
    prl.CalculateGrossPay(e.EmployeeID) AS GrossPay,
    p.NetPay,
    DATENAME(MONTH, p.PayDate) AS PayMonth,
    YEAR(p.PayDate) AS PayYear
FROM 
    prl.Employees e
JOIN 
    prl.Payroll p ON e.EmployeeID = p.EmployeeID;

GO








