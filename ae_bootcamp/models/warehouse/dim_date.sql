select
  format_date('%F' ,d) as id,
  d as full_date,
  EXTRACT(YEAR from d) as year,
  EXTRACT(WEEK from d) as year_week,
  EXTRACT(DAY from d) as year_day,
  EXTRACT(YEAR from d) as fiscal_year,
  FORMAT_DATE('%Q', d) as fiscal_qtr,
  EXTRACT(MONTH from d) as month,
  FORMAT_DATE('%B', d) as month_name,
  FORMAT_DATE('%w', d) as week_day,
  FORMAT_DATE('%A', d) as day_name,
  (CASE WHEN FORMAT_DATE('%A', d) IN ('Sunday', 'Saturday') THEN 0 ELSE 1 END) AS day_is_weekday
FROM (
  SELECT *
  FROM UNNEST(GENERATE_DATE_ARRAY('2014-01-01', '2050-01-01', INTERVAL 1 DAY)) AS d
)