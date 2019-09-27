SELECT
    H.HACKER_ID AS HID,
    H.NAME AS NAME,
    COUNT(C.CHALLENGE_ID) AS CNT
FROM
    CHALLENGES AS C
INNER JOIN HACKERS AS H
ON C.HACKER_ID=H.HACKER_ID
GROUP BY
    H.HACKER_ID,
    H.NAME
HAVING
    CNT = 
        (
        SELECT
            COUNT(A.CHALLENGE_ID) AS CNT
        FROM
            CHALLENGES AS A
        INNER JOIN HACKERS AS B
        ON A.HACKER_ID=B.HACKER_ID
        GROUP BY
            B.HACKER_ID
        ORDER BY
            CNT DESC
        LIMIT 1
        )
    OR CNT IN 
                (
                SELECT
                    SQ.CNT
                FROM
                    (
                    SELECT
                        COUNT(A.CHALLENGE_ID) AS CNT
                    FROM
                        CHALLENGES AS A
                    INNER JOIN HACKERS AS B
                    ON A.HACKER_ID=B.HACKER_ID
                    GROUP BY
                        B.HACKER_ID
                    ) AS SQ
                GROUP BY
                    SQ.CNT
                HAVING
                    COUNT(SQ.CNT)=1
                )
ORDER BY
    CNT DESC,
    HID
;