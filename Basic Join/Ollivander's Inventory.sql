SELECT
    W.ID,
    WP.AGE,
    W.COINS_NEEDED,
    W.POWER
FROM
    WANDS AS W
INNER JOIN WANDS_PROPERTY AS WP
ON W.CODE=WP.CODE
WHERE
    WP.IS_EVIL=0
    AND W.COINS_NEEDED =
                        (
                        SELECT
                            MIN(A.COINS_NEEDED)
                        FROM
                            WANDS AS A
                        WHERE
                            A.CODE=W.CODE
                            AND A.POWER=W.POWER
                        )
ORDER BY
    W.POWER DESC,
    WP.AGE DESC
;