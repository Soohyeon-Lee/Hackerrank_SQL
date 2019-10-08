SELECT
    A.HACKER_ID AS HID,
    A.NAME AS NAME,
    COUNT(B.CHALLENGE_ID) AS CNT
FROM
    HACKERS AS A
INNER JOIN CHALLENGES AS B
ON A.HACKER_ID=B.HACKER_ID
GROUP BY
    HID,
    NAME
HAVING
    CNT = 
        (
        SELECT
            COUNT(CHALLENGE_ID)
        FROM
            CHALLENGES
        GROUP BY
            HACKER_ID
        ORDER BY
            COUNT(CHALLENGE_ID) DESC
        LIMIT 1
        )
    OR CNT IN 
            (
            SELECT
                SQ.CNT
            FROM
                (
                SELECT
                    HACKER_ID AS HID,
                    COUNT(CHALLENGE_ID) AS CNT
                FROM
                    CHALLENGES
                GROUP BY
                    HACKER_ID
                ) AS SQ
            GROUP BY
                SQ.CNT
            HAVING
                COUNT(SQ.HID)=1
            )
ORDER BY
    CNT DESC,
    HID
;