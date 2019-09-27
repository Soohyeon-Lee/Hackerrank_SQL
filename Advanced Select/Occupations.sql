SET @rd=0, @rp=0, @rs=0, @ra=0;

SELECT
    MAX(SQ.DR) AS DOCTOR,
    MAX(SQ.PF) AS PROFESSOR,
    MAX(SQ.SI) AS SINGER,
    MAX(SQ.AC) AS ACTOR
FROM
    (
    SELECT
        CASE OCCUPATION
            WHEN 'Doctor' THEN @rd:=@rd+1
            WHEN 'Professor' THEN @rp:=@rp+1
            WHEN 'Singer' THEN @rs:=@rs+1
            WHEN 'Actor' THEN @ra:=@ra+1
        END AS RN,
        CASE OCCUPATION WHEN 'Doctor' THEN NAME END AS DR,
        CASE OCCUPATION WHEN 'Professor' THEN NAME END AS PF,
        CASE OCCUPATION WHEN 'Singer' THEN NAME END AS SI,
        CASE OCCUPATION WHEN 'Actor' THEN NAME END AS AC
    FROM
        OCCUPATIONS
    ORDER BY
        NAME
    ) AS SQ
GROUP BY
    SQ.RN
;