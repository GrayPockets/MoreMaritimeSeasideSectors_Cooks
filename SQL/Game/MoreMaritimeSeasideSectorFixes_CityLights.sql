-- Arsenals should give adjacency bonuses to Rural Communities, similar to Encampments

INSERT INTO Adjacency_YieldChanges
	(	ID,								Description,								YieldType,				YieldChange,	OtherDistrictAdjacent,			TilesRequired,	AdjacentNaturalWonder,	AdjacentSeaResource,	AdjacentImprovement,			AdjacentFeature,				PrereqCivic,			PrereqTech,							AdjacentDistrict						)
VALUES
	(	'RurCom_ARSENAL',				'LOC_DISTRICT_RURALCOMMUNITYA_ARSENAL',		'YIELD_PRODUCTION',		1,				0,								1,				0,						0,						NULL,							NULL,							NULL,					NULL,								'DISTRICT_ARSENAL'					);

INSERT INTO "District_Adjacencies"
	(	"DistrictType",				"YieldChangeID"		)
VALUES
	(	'DISTRICT_RURALCOMMUNITYA',	'RurCom_ARSENAL'	),
	(	'DISTRICT_RURALCOMMUNITYB',	'RurCom_ARSENAL'	),
	(	'DISTRICT_RURALCOMMUNITYC',	'RurCom_ARSENAL'	);
