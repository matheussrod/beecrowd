  SELECT acc.id,
         acc.password,
		 MD5(acc.password) AS "MD5"
    FROM account AS acc