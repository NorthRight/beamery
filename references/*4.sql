-- Generate table
CREATE TABLE vacancy_stages (
    vacancy_id INT PRIMARY KEY,
    candidate_id VARCHAR(255),
    company_id VARCHAR(255),
    vacancy_id VARCHAR(255),
    event_name VARCHAR(255),
    occourance_date DATE
);

-- When a change in the vacancy stage is triggered new record is added, this allows for stages with multiple interviews to know how far along they are in that process
INSERT INTO vacancy_stages (candidate_id, company_id, vacancy_id, event_name,occourance_date)
VALUES ('46bf78b4-44e2-4763-ab51-6c818c5b9360','232bea0c72085a99a781','2c39ae6f-69c7-48d9-9fb0-3beb26d0549f', 'entered_interview_date', '2021-04-14');
