SELECT
    ROUND(SQRT(POW(SQ.A-SQ.B,2)+POW(SQ.C-SQ.D,2)),4)
FROM
    (
    SELECT
        MIN(LAT_N) AS A,
        MAX(LAT_N) AS B,
        MIN(LONG_W) AS C,
        MAX(LONG_W) AS D
    FROM
        STATION
    ) AS SQ
;