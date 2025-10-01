SELECT * FROM `Bank Loan DB`.bank_loan_data;

-- 1. TOTAL LOAD APPLICATIONS
SELECT 
    COUNT('id') AS Total_Loan_Applications
FROM
    `Bank Loan DB`.bank_loan_data;

-- Month To Date Loan Applications
SELECT 
    COUNT('id') AS MTD_Loan_Applications
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;
        
-- Previous Month To Date Loan Applications
SELECT 
    COUNT('id') AS PMTD_Loan_Applications
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;

-- Month on Month Loan Application
SELECT 
    (
      COUNT(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12 
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                THEN 'id' 
            END)
      -
      COUNT(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                THEN 'id' 
            END)
    )
    /
    NULLIF(
      COUNT(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                THEN 'id' 
            END), 0
    ) AS MoM_Growth
FROM `Bank Loan DB`.bank_loan_data;



-- 2. Total Funded Amount 
SELECT 
    SUM(loan_amount) AS Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data;

-- Month To Date Total Funded Amount
SELECT 
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;
        
-- Previous Month To Date Total Funded Amount
SELECT 
    SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;
        
-- Month on Month Total Funded Amount
SELECT 
    (
      (
        SUM(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021
                THEN loan_amount
            END)
        -
        SUM(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021
                THEN loan_amount
            END)
      )
      /
      NULLIF(SUM(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021
                    THEN loan_amount
                 END), 0)
    ) AS MoM_Total_Funded_Amount
FROM `Bank Loan DB`.bank_loan_data;



-- 3. Total Amount Received
SELECT 
    SUM(total_payment) AS Total_Amount_Received
FROM
    `Bank Loan DB`.bank_loan_data;
    
-- Month To Date Total Funded Amount
SELECT 
    SUM(total_payment) AS MTD_Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;
        
-- Previous Month To Date Total Funded Amount
SELECT 
    SUM(total_payment) AS PMTD_Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;
        
-- Month on Month Total Funded Amount        
SELECT 
    (
      (
        SUM(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12 
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                THEN total_payment 
            END)
        -
        SUM(CASE 
                WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                 AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                THEN total_payment 
            END)
      )
      /
      NULLIF(SUM(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN total_payment 
                 END), 0)
    ) AS MoM_Amount_Received
FROM `Bank Loan DB`.bank_loan_data;

-- 4. Average Interest Rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate
FROM
    `Bank Loan DB`.bank_loan_data;

-- Month To Date Average Interest Rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Interest_Rate
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;


-- Previous Average Interest Rate
SELECT 
    ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Interest_Rate
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;



-- Month on Month Average Interest Rate
SELECT 
    ROUND(
        (
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN int_rate
                END)
            -
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN int_rate
                END)
        )
        /
        NULLIF(
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN int_rate
                END), 0
        ) * 100, 2
    ) AS MoM_Avg_Interest_Rate
FROM `Bank Loan DB`.bank_loan_data;

-- 5. Average Debt To Income Ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS Avg_DTI
FROM
    `Bank Loan DB`.bank_loan_data;

-- Month To Date Average Debt To Income Ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS MTD_Avg_DTI
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;

-- Previous Month To Date Average Debt Income Ratio
SELECT 
    ROUND(AVG(dti) * 100, 2) AS MTD_Avg_DTI
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11
        AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021;

-- Month on Month Average Debt To Income Ratio
SELECT 
    ROUND(
        (
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN dti
                END)
            -
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN dti
                END)
        )
        /
        NULLIF(
            AVG(CASE 
                    WHEN MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 11 
                     AND YEAR(STR_TO_DATE(issue_date, '%c/%e/%y')) = 2021 
                    THEN dti
                END), 0
        ) * 100, 2
    ) AS MoM_Avg_DTI
FROM `Bank Loan DB`.bank_loan_data;


-- Good Loan VS Bad Loan
-- Good Loan Perentage (%)
SELECT 
    ROUND(
        (COUNT(CASE
            WHEN loan_status = 'Fully Paid' OR loan_status = 'Current'
            THEN 'id'
        END) * 100.0) / COUNT('id'), 0
    ) AS Good_Loan_Percentage
FROM `Bank Loan DB`.bank_loan_data;

-- Good Loan Applications
SELECT 
    COUNT('id') AS Good_Loan_Appliations
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current';
        
-- Good Loan Funded Amount
SELECT 
    SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current';
        
-- Good Loan Received Amount
SELECT 
    SUM(total_payment) AS Good_Loan_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Fully Paid'
        OR loan_status = 'Current';
        
-- Bad Loan Percentage (%)
SELECT 
    ROUND(
        (COUNT(CASE
            WHEN loan_status = 'Charged Off' THEN 'id'
        END) * 100.0) / COUNT('id'), 0
    ) AS Bad_Loan_Percentage
FROM `Bank Loan DB`.bank_loan_data;

-- Bad Loan Application
SELECT 
    COUNT('id') AS Bad_Loan_Appliations
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT 
    SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Charged Off';
    
-- Bad Loan Received Amount
SELECT 
    SUM(total_payment) AS Bad_Loan_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    loan_status = 'Charged Off';
    
-- Loan Status
SELECT 
    loan_status,
    COUNT('id') AS Loan_Count,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY loan_status;

--
SELECT 
    loan_status,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM
    `Bank Loan DB`.bank_loan_data
WHERE
    MONTH(STR_TO_DATE(issue_date, '%c/%e/%y')) = 12
GROUP BY loan_status;

-- Monthly Trend By Issue Date
SELECT 
    MONTHNAME(STR_TO_DATE(issue_date, '%c/%e/%y')) AS Month_Name,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY MONTHNAME(STR_TO_DATE(issue_date, '%c/%e/%y')) , MONTH(STR_TO_DATE(issue_date, '%c/%e/%y'))
ORDER BY MONTH(STR_TO_DATE(issue_date, '%c/%e/%y'));

-- Regional Analysis By Sate
SELECT 
    address_state,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY address_state
ORDER BY address_state;

-- Loan Term Analysis
SELECT 
    term,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY term
ORDER BY term;

-- Employee Length Analysis
SELECT 
    emp_length,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;

-- Loan Purpose Breakdown
SELECT 
    purpose,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY purpose
ORDER BY purpose;

-- Home Ownership Analysis
SELECT 
    home_ownership,
    COUNT('id') AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM
    `Bank Loan DB`.bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;
