DECLARE nov DATE default '2022-11-01';
DECLARE oct DATE default '2022-10-01';

WITH UserActivity AS (
    SELECT
        user_id,
        SUM(CASE WHEN DATE_TRUNC(event_at, Month) = nov THEN 1 ELSE 0 END) AS frequency_november,
        SUM(CASE WHEN DATE_TRUNC(event_at, Month) = oct THEN 1 ELSE 0 END) AS frequency_october
    FROM events
    GROUP BY user_id
    ORDER BY frequency_november DESC
    LIMIT 5
),

cte_active_days AS (
    SELECT
        user_id,
        COUNT(DISTINCT DATE(event_at)) AS active_days
    FROM events
    WHERE DATE_TRUNC(event_at, Month) = nov
    GROUP BY user_id
)

SELECT
    ua.user_id,
    ad.active_days,
    ua.frequency_november,
    ua.frequency_october,
    CASE WHEN ua.frequency_november > ua.frequency_october THEN 'Yes' ELSE 'No' END AS increased_usage
FROM
    UserActivity as ua
    INNER JOIN cte_active_days as ad
    ON ad.user_id = ua.user_id
