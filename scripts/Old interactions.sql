SELECT InteractionId INTO TempInteractions FROM [xdb_collection].[Interactions] 
	WHERE StartDateTime < '2022-09-01'

SELECT * FROM TempInteractions
GO 

DELETE FROM [xdb_collection].[InteractionFacets] WHERE InteractionId IN 
	(SELECT InteractionId FROM TempInteractions)
GO

DELETE FROM [xdb_collection].[Interactions] WHERE InteractionId IN 
	(SELECT InteractionId FROM TempInteractions)
GO

DROP TABLE TempInteractions
GO
