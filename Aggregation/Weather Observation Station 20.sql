SET @R=-1;

SELECT
    ROUND(AVG(SQ.LAT_N), 4)
FROM
    (
    SELECT
        @R:=@R+1 AS RN,
        LAT_N
    FROM
        STATION
    ORDER BY
        LAT_N
    ) AS SQ
WHERE
    SQ.RN IN (CEIL(@R/2), FLOOR(@R/2))
;