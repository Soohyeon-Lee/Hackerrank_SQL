SET @RD=0, @RP=0, @RS=0, @RA=0;

SELECT
    MAX(SQ.DR) AS DR,
    MAX(SQ.PF) AS PF,
    MAX(SQ.SI) AS SI,
    MAX(SQ.AC) AS AC
FROM
    (
    SELECT
        CASE OCCUPATION
            WHEN 'Doctor' THEN @RD:=@RD+1
            WHEN 'Professor' THEN @RP:=@RP+1
            WHEN 'Singer' THEN @RS:=@RS+1
            WHEN 'Actor' THEN @RA:=@RA+1
        END AS RN,
        IF(OCCUPATION='Doctor', NAME, NULL) AS DR,
        IF(OCCUPATION='Professor', NAME, NULL) AS PF,
        IF(OCCUPATION='Singer', NAME, NULL) AS SI,
        IF(OCCUPATION='Actor', NAME, NULL) AS AC
    FROM
        OCCUPATIONS
    ORDER BY
        NAME
    ) AS SQ
GROUP BY
    SQ.RN
;