SELECT d.Line[0].Amount as line_amount,
d.TxnDate as transaction_date,
a.classification as classification,
c.name as class_name,
c.SubClass as class_sub_class,
d.Line[0].Description as line_description,
a.name as account_name,
a.AccountType as account_type,
a.AccountSubType as account_sub_type
FROM qb_rentals.deposits d
JOIN qb_rentals.accounts a ON a.id =JSON_VALUE(d.Line[0].DepositLineDetail.AccountRef.value)
LEFT JOIN qb_rentals.classes c ON c.id = JSON_VALUE(d.Line[0].DepositLineDetail.ClassRef.value)