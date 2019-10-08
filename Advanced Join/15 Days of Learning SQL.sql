SELECT
    SQ.SD,
    (
    SELECT
        COUNT(DISTINCT A.HACKER_ID)
    FROM
        SUBMISSIONS AS A
    WHERE
        A.SUBMISSION_DATE=SQ.SD
        AND (
                (
                SELECT
                    COUNT(DISTINCT B.SUBMISSION_DATE)
                FROM
                    SUBMISSIONS AS B
                WHERE
                    A.HACKER_ID=B.HACKER_ID
                    AND B.SUBMISSION_DATE<=SQ.SD
                ) = DATEDIFF(SQ.SD, '2016-03-01')+1
            )
    ) AS N_SERIAL,
    (
    SELECT
        A.HACKER_ID
    FROM
        SUBMISSIONS AS A
    WHERE
        A.SUBMISSION_DATE=SQ.SD
    GROUP BY
        A.HACKER_ID
    ORDER BY
        COUNT(A.SUBMISSION_ID) DESC,
        A.HACKER_ID
    LIMIT 1
    ) AS HID,
    (
    SELECT
        NAME
    FROM
        HACKERS
    WHERE 
        HACKER_ID=HID
    ) AS NAME
FROM
    (SELECT DISTINCT SUBMISSION_DATE AS SD FROM SUBMISSIONS ORDER BY SD) AS SQ
;