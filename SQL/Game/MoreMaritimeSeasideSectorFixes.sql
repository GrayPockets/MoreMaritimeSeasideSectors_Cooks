-- Bugfix to make Thanh mutually exclusive with Arsenals

INSERT INTO "MutuallyExclusiveDistricts"
	(	"District",			"MutuallyExclusiveDistrict"	)
VALUES
	(	'DISTRICT_ARSENAL',	'DISTRICT_THANH'			),
	(	'DISTRICT_THANH',	'DISTRICT_ARSENAL'			);

-- Bugfix to make City-State AIs use Arsenals and Waterfronts

INSERT INTO "AiFavoredItems"
	(	"ListType",				"Item",					"Favored",	"Value",	"StringVal",	"MinDifficulty",	"MaxDifficulty",	"TooltipString"	)
VALUES
	(	'MinorCivDistricts',	'DISTRICT_ARSENAL',		0,			0,			NULL,			NULL,				NULL,				NULL			),
	(	'MinorCivDistricts',	'DISTRICT_WATERFRONT',	0,			0,			NULL,			NULL,				NULL,				NULL			);

-- Integrated Space Cell should use Naval Academy instead of Seaport

INSERT INTO "RequirementSets"
	(	"RequirementSetId",								"RequirementSetType"		)
VALUES
	(	'CITY_HAS_MILITARY_ACADEMY_OR_NAVAL_ACADEMY',	'REQUIREMENTSET_TEST_ANY'	);

INSERT INTO "Requirements"
	(	"RequirementId",					"RequirementType",					"Likeliness",	"Impact",	"Inverse",	"Reverse",	"Persistent",	"ProgressWeight",	"Triggered"	)
VALUES
	(	'REQUIRES_CITY_HAS_NAVAL_ACADEMY',	'REQUIREMENT_CITY_HAS_BUILDING',	0,				0,			0,			0,			0,				1,					0			);

INSERT INTO "RequirementSetRequirements"
	(	"RequirementSetId",								"RequirementId"							)
VALUES
	(	'CITY_HAS_MILITARY_ACADEMY_OR_NAVAL_ACADEMY',	'REQUIRES_CITY_HAS_MILITARY_ACADEMY'	),
	(	'CITY_HAS_MILITARY_ACADEMY_OR_NAVAL_ACADEMY',	'REQUIRES_CITY_HAS_NAVAL_ACADEMY'		);

INSERT INTO "RequirementArguments"
	(	"RequirementId",					"Name",			"Type",				"Value",						"Extra",	"SecondExtra"	)
VALUES
	(	'REQUIRES_CITY_HAS_NAVAL_ACADEMY',	'BuildingType',	'ARGTYPE_IDENTITY',	'BUILDING_ARS_NAVALACADEMY',	NULL,		NULL			);

UPDATE "Modifiers"
SET "SubjectRequirementSetId" = 'CITY_HAS_MILITARY_ACADEMY_OR_NAVAL_ACADEMY'
WHERE "ModifierId" = 'INTEGRATEDSPACECELL_SPACE_RACE_PROJECTS_PRODUCTION';

-- Surf Rock should use Waterfront instead of Harbors

DELETE FROM "ModifierArguments"
WHERE "ModifierId" IN ('ROCKBAND_SURF_ROCK_HARBOR', 'ROCKBAND_SURF_ROCK_HARBOR_MODIFIER', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD_MODIFIER', 'ROCKBAND_SURF_ROCK_COTHON', 'ROCKBAND_SURF_ROCK_COTHON_MODIFIER');

DELETE FROM "UnitPromotionModifiers"
WHERE "ModifierId" IN ('ROCKBAND_SURF_ROCK_HARBOR', 'ROCKBAND_SURF_ROCK_HARBOR_MODIFIER', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD_MODIFIER', 'ROCKBAND_SURF_ROCK_COTHON', 'ROCKBAND_SURF_ROCK_COTHON_MODIFIER');

DELETE FROM "Modifiers"
WHERE "ModifierId" IN ('ROCKBAND_SURF_ROCK_HARBOR', 'ROCKBAND_SURF_ROCK_HARBOR_MODIFIER', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD', 'ROCKBAND_SURF_ROCK_ROYAL_NAVY_DOCKYARD_MODIFIER', 'ROCKBAND_SURF_ROCK_COTHON', 'ROCKBAND_SURF_ROCK_COTHON_MODIFIER');

INSERT INTO "Modifiers"
	(	"ModifierId",								"ModifierType",											"RunOnce",	"NewOnly",	"Permanent",	"Repeatable",	"OwnerRequirementSetId",	"SubjectRequirementSetId",	"OwnerStackLimit",	"SubjectStackLimit"	)
VALUES
	(	'ROCKBAND_SURF_ROCK_WATERFRONT',			'MODIFIER_PLAYER_UNIT_ADJUST_ROCK_BAND_LEVEL_DISTRICT',	0,			0,			0,				0,				NULL,						NULL,						NULL,				NULL				),
	(	'ROCKBAND_SURF_ROCK_WATERFRONT_MODIFIER',	'MODIFIER_PLAYER_UNIT_ADJUST_TOURISM_BOMB_DISTRICT',	0,			0,			0,				0,				NULL,						NULL,						NULL,				NULL				);

INSERT INTO "UnitPromotionModifiers"
	(	"UnitPromotionType",	"ModifierId"								)
VALUES
	(	'PROMOTION_SURF_ROCK',	'ROCKBAND_SURF_ROCK_WATERFRONT'				),
	(	'PROMOTION_SURF_ROCK',	'ROCKBAND_SURF_ROCK_WATERFRONT_MODIFIER'	);

INSERT INTO "ModifierArguments"
	(	"ModifierId",								"Name",			"Type",				"Value",				"Extra",	"SecondExtra"	)
VALUES
	(	'ROCKBAND_SURF_ROCK_WATERFRONT',			'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_WATERFRONT',	NULL,		NULL			),
	(	'ROCKBAND_SURF_ROCK_WATERFRONT',			'Amount',		'ARGTYPE_IDENTITY',	1,						NULL,		NULL			),
	(	'ROCKBAND_SURF_ROCK_WATERFRONT_MODIFIER',	'DistrictType',	'ARGTYPE_IDENTITY',	'DISTRICT_WATERFRONT',	NULL,		NULL			),
	(	'ROCKBAND_SURF_ROCK_WATERFRONT_MODIFIER',	'Amount',		'ARGTYPE_IDENTITY',	500,					NULL,		NULL			);

INSERT INTO "Building_TourismBombs_XP2O
	(	"BuildingType",				"TourismBombValue"	)
VALUES
	(	'BUILDING_WTR_BOARDWALK',	500					);
