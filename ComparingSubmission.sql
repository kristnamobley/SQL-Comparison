

---------------Submission 2-------------
SELECT
                Employee AS Employee2
                , HoursWorked AS HoursWorked2
                , DaysWorked AS DaysWorked2
                , HoursScheduled AS HoursScheduled2
                , PositionCode AS PositionCode2
INTO #Submission2
FROM
                SubmissionTable
WHERE
                ReportYear = 2024
                AND ReportMonth = 12
                AND SubmissionNumber =2
                ;
 
-------------Submission 20---------------
SELECT
                Employeer AS Employee20
                , HoursWorked AS HoursWorked20
                , DaysWorked AS DaysWorked20
                , HoursScheduled AS HoursScheduled20
                , PositionCode AS PositionCode20
INTO #Submission20
FROM
                SubmissionTable
WHERE
                ReportYear = 2024
                AND ReportMonth = 12
                AND SubmissionNumber =20
                ;
 
-------------UNION 3 Statements-----------------          
SELECT
     *
FROM (
        SELECT
              Sub2.Employee2 AS Employee2
            , Sub20.Employee20 AS Employee20
            , Sub2.PositionCode2 AS PositionCode2
            , Sub20.PositionCode20 AS PositionCode20
            , Sub2.DaysWorked2 AS DaysWorked2
            , Sub20.DaysWorked20 AS DaysWorked20
            , Sub2.HoursScheduled2 AS HoursScheduled2
            , Sub20.HoursScheduled20 AS HoursScheduled20
            , Sub2.HoursWorked2 AS HoursWorked2
            , Sub20.HoursWorked20 AS HoursWorked20
            , CASE
                            WHEN Sub2.Employee2 = Sub20.Employee20 THEN 1
                            ELSE 0
                            END AS EmployeeMatch
            , CASE
                            WHEN Sub2.DaysWorked2 = Sub20.DaysWorked20 THEN 1
                            ELSE 0
                END AS DaysWorkedMatch
            , CASE
                            WHEN Sub2.HoursScheduled2 = Sub20.HoursScheduled20 THEN 1
                            ELSE 0
                            END AS HoursScheduledMatch
            , CASE
                            WHEN Sub2.HoursWorked2 = Sub20.HoursWorked20 THEN 1
                            ELSE 0
                            END AS HoursWorkedMatch
        FROM
            #Submission2 AS Sub2
            LEFT JOIN #Submission20 AS Sub20 ON Sub20.Employee20 = Sub2.Employee2
                                        AND Sub20.PositionCode20 = Sub2.PositionCode2
            WHERE Sub20.Employee20 IS NULL
 
UNION
 
		SELECT
                Sub2.Employee2 AS Employee2
                , Sub20.Employee20 AS Employee20
                , Sub2.PositionCode2 AS PositionCode2
                , Sub20.PositionCode20 AS PositionCode20
                , Sub2.DaysWorked2 AS DaysWorked2
                , Sub20.DaysWorked20 AS DaysWorked20
                , Sub2.HoursScheduled2 AS HoursScheduled2
                , Sub20.HoursScheduled20 AS HoursScheduled20
                , Sub2.HoursWorked2 AS HoursWorked2
                , Sub20.HoursWorked20 AS HoursWorked20
                , CASE
                        WHEN Sub2.Employee2 = Sub20.Employee20 THEN 1
                        ELSE 0 END AS EmployeeMatch
                , CASE
                        WHEN Sub2.DaysWorked2 = Sub20.DaysWorked20 THEN 1
                        ELSE 0
						END AS DaysWorkedMatch
                , CASE
                        WHEN Sub2.HoursScheduled2 = Sub20.HoursScheduled20 THEN 1
                        ELSE 0
                        END AS HoursScheduledMatch
                , CASE
                        WHEN Sub2.HoursWorked2 = Sub20.HoursWorked20 THEN 1
                        ELSE 0
                        END AS HoursWorkedMatch
        FROM
            #Submission20 AS Sub20
        LEFT JOIN #Submission2 AS Sub2 ON Sub2.Employee2 = Sub20.Employee20
                                    AND Sub2.PositionCode2 = Sub20.PositionCode20
        WHERE Sub2.Employee2 IS null

UNION
 
        SELECT
              Sub2.Employee2 AS Employee2
            , Sub20.Employee20 AS Employee20
            , Sub2.PositionCode2 AS PositionCode2
            , Sub20.PositionCode20 AS PositionCode20
            , Sub2.DaysWorked2 AS DaysWorked2
            , Sub20.DaysWorked20 AS DaysWorked20
            , Sub2.HoursScheduled2 AS HoursScheduled2
            , Sub20.HoursScheduled20 AS HoursScheduled20
            , Sub2.HoursWorked2 AS HoursWorked2
            , Sub20.HoursWorked20 AS HoursWorked20
            , CASE
                WHEN Sub2.Employee2 = Sub20.Employee20 THEN 1
                ELSE 0 END AS EmployeeMatch
            , CASE
                WHEN Sub2.DaysWorked2 = Sub20.DaysWorked20 THEN 1
                ELSE 0
                END AS DaysWorkedMatch
            , CASE
				WHEN Sub2.HoursScheduled2 = Sub20.HoursScheduled20 THEN 1
				ELSE 0
				END AS HoursScheduledMatch
            , CASE
                WHEN Sub2.HoursWorked2 = Sub20.HoursWorked20 THEN 1
                ELSE 0
                END AS HoursWorkedMatch
        FROM #Submission20 AS Sub20
        INNER JOIN #Submission2 Sub2 ON Sub2.Employee2 = Sub20.Employee20 AND Sub2.PositionCode2 = Sub20.PositionCode20
        ) AS ComparisonResults
WHERE
    EmployeeMatch = 0
    OR HoursWorkedMatch = 0
    OR DaysWorkedMatch = 0
    OR HoursScheduledMatch = 0
 
ORDER BY Employee2, Employee20
 ;
 
DROP TABLE #Submission2;
DROP TABLE #Submission20;
