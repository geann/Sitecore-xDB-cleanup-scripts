SELECT InteractionId INTO TempInteractions FROM [xdb_collection].[Interactions] 
	WHERE UserAgent = 'Sitecore/9.0 (EXM)' --replace with another user agent if using a different version of Sitecore
	AND CampaignId = '0F5C6F03-0682-4279-BD60-B06A399E8824' -- replace with your campaign ID or remove this condition
	AND StartDateTime < '2022-09-01'

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
