CREATE OR REPLACE TABLE events AS
SELECT
    event_id,
    MIN(event_at) AS first_event_at,
    event_name,
    event_at,
    user_id
FROM
    events
GROUP BY
    event_id, event_name, event_at, user_id;
