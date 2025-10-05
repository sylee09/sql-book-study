select student_id, course_id, grade as best_grade
from
(
	SELECT
		student_id,
		course_id,
		grade,
		RANK() OVER (PARTITION BY student_id ORDER BY grade DESC, course_id asc) AS rank_in_student_id
	FROM
		examinations
)t
where rank_in_student_id = 1
