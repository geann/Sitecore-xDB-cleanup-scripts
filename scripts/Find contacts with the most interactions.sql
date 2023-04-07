SELECT TOP (100)  ContactId, 
                  COUNT(ContactId) as Count
FROM [xdb_collection].[Interactions]
GROUP BY ContactId
ORDER BY Count DESC
