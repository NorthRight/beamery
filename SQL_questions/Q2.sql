CREATE OR REPLACE TABLE events AS
SELECT
    event_id,
    MIN(event_at) AS event_at,
    event_name,
    user_id
FROM
    events
GROUP BY
    event_id, event_name, user_id;
