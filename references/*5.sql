-- This is finding roles that would be outliers from this analysis as their Closed Date is before their Open date.
-- As all vacancies have an open date and they cannot be closed before starting.
-- I have not included 'equal to' as this is a legitimate action.
-- Further investigation would be required to understand the logic of these results.
SELECT
  *
FROM
  `stately-equinox-394719.Beamery.vacancy-stages`
WHERE
  vacancy_closed_date < vacancy_opened_date
