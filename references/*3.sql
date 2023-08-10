-- Generate table
CREATE TABLE contact_completeness_level_history (
    history_id INT PRIMARY KEY,
    contact_id VARCHAR(255),
    effective_date DATE,
    end_date DATE,
    contact_completeness_level VARCHAR(50)
);

-- When an update is triggered a change in completeness level is logged
INSERT INTO contact_completeness_level_history (contact_id, effective_date, end_date, contact_completeness_level)
VALUES ('905b6639-c8cb-4836-8761-87369e17fe30', '2022-01-10', '2022-01-27', 'basic');
