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
