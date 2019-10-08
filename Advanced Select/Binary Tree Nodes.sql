SELECT
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN
                (
                SELECT
                    A.N
                FROM
                    BST AS A
                LEFT JOIN BST AS B ON A.N=B.P
                WHERE B.P IS NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS Node_type
FROM
    BST
ORDER BY
    N
;