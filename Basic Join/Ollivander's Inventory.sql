SELECT
    W.ID AS ID,
    WP.AGE AS AGE,
    W.COINS_NEEDED AS CN,
    W.POWER AS POWER
FROM
    WANDS AS W
INNER JOIN WANDS_PROPERTY AS WP
ON W.CODE = WP.CODE
WHERE WP.IS_EVIL = 0 AND
W.COINS_NEEDED IN
                (
                SELECT
                    MIN(A.COINS_NEEDED)
                FROM
                    WANDS AS A
                INNER JOIN WANDS_PROPERTY AS B
                ON A.CODE = B.CODE
                WHERE B.IS_EVIL = 0 AND A.CODE = W.CODE AND A.POWER = W.POWER AND B.AGE = WP.AGE
                GROUP BY
                    A.CODE,
                    A.POWER,
                    B.AGE
                )
ORDER BY
    POWER DESC,
    AGE DESC
;