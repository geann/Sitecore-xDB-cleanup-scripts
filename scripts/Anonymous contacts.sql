SELECT ContactId INTO TempContacts FROM [xdb_collection].[Contacts] 
	WHERE LastModified < DATEADD(year, -1, GetDate()) 
	AND ContactId IN (
			  SELECT DISTINCT contactId
			  FROM [xdb_collection].[ContactIdentifiers]
			  WHERE IdentifierType = 0 
			  AND ContactId NOT IN (
						SELECT contactId
						FROM [xdb_collection].[ContactIdentifiers]
						WHERE IdentifierType = 1
					  )
			  )
