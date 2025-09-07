select distinct t2.student_id, t2.student_name, t2.subject_name, 
case when attended_exams is null then 0 else attended_exams end as attended_exams
from 
(
	select student_id, subject_name, count(*) as attended_exams
    from examinations
    group by student_id, subject_name
)t1
right join
(
	select s.student_id, s.student_name, sub.subject_name
    from students s left join examinations e on s.student_id = e.student_id
    cross join subjects sub
)t2 on t1.student_id = t2.student_id and t1.subject_name = t2.subject_name
order by student_id asc, subject_name asc;