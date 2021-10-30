  SELECT CONCAT(SUBSTRING(np.cpf, 1, 3), '.',
			    SUBSTRING(np.cpf, 4, 3), '.',
			    SUBSTRING(np.cpf, 7, 3), '-',
			    SUBSTRING(np.cpf, 10, 2)) AS "CPF"
    FROM customers AS ctm
	     INNER JOIN natural_person AS np
		 ON ctm.id = np.id_customers