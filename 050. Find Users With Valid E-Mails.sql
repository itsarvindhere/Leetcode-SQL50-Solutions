SELECT  
    user_id,
    name,
    mail
FROM Users
WHERE mail REGEXP '^[[:alpha:]]+[[:alnum:]_.-]*@leetcode[.]com$'