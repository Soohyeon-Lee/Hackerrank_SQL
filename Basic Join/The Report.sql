SELECT
    CASE
        WHEN G.GRADE >= 8 THEN S.NAME
    END AS N,
    G.GRADE,
    S.MARKS
FROM
    STUDENTS AS S
INNER JOIN GRADES AS G
ON S.MARKS BETWEEN G.MIN_MARK AND G.MAX_MARK
ORDER BY
    G.GRADE DESC,
    N,
    S.MARKS
;