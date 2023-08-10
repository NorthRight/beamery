SELECT
  vs.candidate_id,
  vs.company_id,
  vs.vacancy_id,
  vs.vacancy_created_date,
  vs.vacancy_opened_date,
  vs.vacancy_closed_date,
  vs.entered_applied_date,
  vs.entered_review_date,
  vs.entered_screen_date,
  vs.entered_interview_date,
  vs.entered_offer_date,
  vs.entered_post_offer_date,
  vs.entered_hired_date,
  dc.contact_id,
  dc.company_id,
  dc.fake_company_name,
  dc.source_name,
  dc.source_category,
  dc.contact_created_date,
  dc.contact_updated_date,
  dc.contact_completeness_level,
  CASE
    WHEN COALESCE(entered_applied_date,entered_review_date, entered_screen_date, entered_interview_date, entered_offer_date, entered_post_offer_date, entered_hired_date) IS NOT NULL THEN 1
  ELSE
  0
END
  AS candidate_passed_screening,
  CASE
    WHEN COALESCE(entered_offer_date, entered_post_offer_date, entered_hired_date) IS NOT NULL THEN 1
  ELSE
  0
END
  AS candidate_received_offer
FROM
  `stately-equinox-394719.Beamery.vacancy-stages` AS vs
INNER JOIN
  `stately-equinox-394719.Beamery.dim-contact` AS dc
ON
  dc.contact_id = vs.candidate_id
WHERE
  vacancy_closed_date > vacancy_opened_date
