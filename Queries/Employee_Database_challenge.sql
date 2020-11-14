-- Challenge 1 Part 1
SELECT ep.emp_no,
	ep.first_name,
	ep.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as ep
INNER JOIN titles as tt
ON (ep.emp_no = tt.emp_no)
WHERE (ep.birth_date BETWEEN '1952-01-01' AND '1955-12-31')	
ORDER BY ep.emp_no;
	

-- Challenge 1 Part 2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

-- Challenge 1 Part 3
SELECT count(ut.emp_no),
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER by count(ut.emp_no) DESC;


-- Challenge 2
SELECT DISTINCT ON (ep.emp_no)
	ep.emp_no,
	ep.first_name,
	ep.last_name,
	ep.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as ep
INNER JOIN dept_emp as de
ON (ep.emp_no = de.emp_no)
INNER JOIN titles as tt
ON (ep.emp_no = tt.emp_no)
WHERE (ep.birth_date BETWEEN '1965-01-01' AND '1965-12-31')	
AND (de.to_date = ('9999-01-01'))
ORDER BY ep.emp_no, de.to_date DESc;
