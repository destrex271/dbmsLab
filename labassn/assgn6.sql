SELECT SYSDATE();
-- SELECT to_char(sysdate, 'day') FROM dual;
SELECT TO_CHAR(CURDATE(), 'DD');
-- SELECT TO_CHAR(SYSDATE, 'DDSP-MONTH-YEAR');
-- SELECT to_char(sysdate, 'month') FROM dual;
SELECT TO_CHAR(CURDATE(), 'Month');
-- SELECT to_char(sysdate, 'year') FROM dual;
SELECT TO_CHAR(CURDATE(), 'YYYY Month');
SELECT NEXT_DAY(TO_DATE('07-FEB-23'), 'FRIDAY') FROM dual;
