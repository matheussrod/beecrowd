SELECT pdt.name,
       pvd.name
  FROM products AS pdt
       INNER JOIN categories AS ctg
       ON pdt.id_categories = ctg.id
          AND ctg.id = 6
       
       INNER JOIN providers AS pvd
       ON pdt.id_providers = pvd.id