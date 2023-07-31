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

DELETE FROM [xdb_collection].[ContactFacets] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO

DELETE FROM [xdb_collection].[ContactIdentifiersIndex] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO 

DELETE FROM [xdb_collection].[InteractionFacets] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO

DELETE FROM [xdb_collection].[Interactions] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO

DELETE FROM [xdb_collection].[ContactIdentifiers] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO
  
DELETE FROM [xdb_collection].[Contacts] WHERE ContactId IN (SELECT contactId FROM TempContacts)
GO

DELETE FROM [xdb_collection].[DeviceProfiles] WHERE LastKnownContactId IN (select contactId from TempContacts)
GO

DROP TABLE TempContacts
GO
