-- NSS Tutorial
/* Use this table:
Field	Type
ukprn	varchar(8)
institution	varchar(100)
subject	varchar(60)
level	varchar(50)
question	varchar(10)
A_STRONGLY_DISAGREE	int(11)
A_DISAGREE	int(11)
A_NEUTRAL	int(11)
A_AGREE	int(11)
A_STRONGLY_AGREE	int(11)
A_NA	int(11)
CI_MIN	int(11)
score	int(11)
CI_MAX	int(11)
response	int(11)
sample	int(11)
aggregate	char(1)
*/

--1) Show the percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
	FROM nss 
	WHERE question = 'Q01'
	AND institution = 'Edinburgh Napier University'
	AND subject = '(8) Computer Science';

--2) Show the institution and subject where the score is at least 100 for question 15.
SELECT institution, subject
	FROM nss
	WHERE question = 'Q15'
	AND score >= 100;

/*3) Show the institution and score where the score for
 '(8) Computer Science' is less than 50 for question 'Q15' */
SELECT institution, score
	FROM nss	
	WHERE question = 'Q15'
	AND subject = '(8) Computer Science'
	AND score < 50;

/*4) Show the subject and total number of students who responded to question 22 for 
each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'. */
SELECT DISTINCT subject, SUM(response) AS responses
	FROM nss
	WHERE question = 'Q22'
	AND (subject = '(8) Computer Science'
	OR subject = '(H) Creative Arts and Design')
	GROUP BY subject;

/*5) Show the subject and total number of students who A_STRONGLY_AGREE to question 22 
for each of the subjects '(8) Computer Science' and '(H) Creative Arts and Design'. */
SELECT subject, SUM(response * A_STRONGLY_AGREE) /100 as strongly_agree
	FROM nss
	WHERE question = 'Q22'
	AND (subject = '(8) Computer Science'
	OR subject = '(H) Creative Arts and Design')
	GROUP BY subject;

/*6) Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject 
'(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
Use the ROUND function to show the percentage without decimal places. */
SELECT subject, ROUND((SUM(response*A_STRONGLY_AGREE)/100) / sum(response) *100)
	FROM nss
	WHERE question = 'Q22'
	AND (subject = '(8) Computer Science'
	OR subject = '(H) Creative Arts and Design')
	GROUP BY subject;


