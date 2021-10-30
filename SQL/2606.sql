SELECT pdt.id,
       pdt.name
  FROM products AS pdt
       INNER JOIN categories AS cat
       ON pdt.id_categories = cat.id
          AND starts_with(cat.name, 'super')