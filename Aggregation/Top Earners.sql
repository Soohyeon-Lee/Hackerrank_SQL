SELECT
    SQ.EARNINGS,
    COUNT(SQ.EID)
FROM
    (
    SELECT
        EMPLOYEE_ID AS EID,
        MONTHS*SALARY AS EARNINGS
    FROM
        EMPLOYEE
    ) AS SQ
GROUP BY
    SQ.EARNINGS
ORDER BY
    SQ.EARNINGS DESC
LIMIT 1
;