SELECT
    ROUND(ABS(SQ.A-SQ.C)+ABS(SQ.B-SQ.D), 4)
FROM
    (
    SELECT
        MIN(LAT_N) AS A,
        MIN(LONG_W) AS B,
        MAX(LAT_N) AS C,
        MAX(LONG_W) AS D
    FROM
        STATION
    ) AS SQ
;