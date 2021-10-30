  SELECT CONCAT('Approved: ', sdt.name),
         sdt.grade
    FROM students AS sdt
   WHERE sdt.grade >= 7
ORDER BY sdt.grade DESC