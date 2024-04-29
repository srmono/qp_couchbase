SELECT *
FROM `gamesim-sample`
LIMIT 1;

SELECT jsonType
FROM `gamesim-sample`

SELECT DISTINCT jsonType
FROM `gamesim-sample`

SELECT RAW jsonType
FROM `gamesim-sample`

SELECT DISTINCT RAW jsonType
FROM `gamesim-sample`

SELECT name,
       jsonType
FROM `gamesim-sample`
LIMIT 10


SELECT gs.name,
       gs.jsonType,
       gs.uuid AS unique_id
FROM `gamesim-sample` AS gs
LIMIT 10

SELECT META().id,
       *
FROM `gamesim-sample`

SELECT META().id AS docid,
       name,
       uuid
FROM `gamesim-sample`

SELECT *
FROM `gamesim-sample` USE KEYS "Aaron0"

SELECT name, jsonType
FROM `gamesim-sample` USE KEYS ["Aaron0","Axe_14e3ad7b-8469-444e-8057-ac5aefcdf89e", "Bauchan8"]

SELECT DISTINCT name,
       jsonType
FROM `gamesim-sample`
WHERE jsonType="player"

SELECT DISTINCT gs.name,
       gs.jsonType
FROM `gamesim-sample` gs
WHERE name = "Aaron0"

SELECT name AS items_owned
FROM `gamesim-sample`
WHERE ownerId="Aaron0"

SELECT *
FROM `gamesim-sample`
WHERE jsonType="player"
    AND loggedIn=TRUE

SELECT name,
       experience,
       loggedIn
FROM `gamesim-sample`
WHERE jsonType="player"
    AND loggedIn=FALSE


SELECT name,
       experience,
       hitpoints,
       jsonType
FROM `gamesim-sample`
WHERE jsonType="monster"
    AND (hitpoints > 4500
        OR hitpoints < 100)

INFER `gamesim-sample`


CREATE PRIMARY INDEX ON `student-sample`

-- Insert documents

INSERT INTO `student-sample` (KEY, VALUE)
VALUES ("id_01", {
    "name": "venkat",
    "location": "bangalore",
    "zip": "562125"
});

INSERT INTO `student-sample` (KEY, VALUE)
VALUES ("id_02", {
    "name": "kishore",
    "location": "chennai",
    "zip": "56023"
});

INSERT INTO `student-sample` (KEY, VALUE)
VALUES ("id_03", {
    "name": "karthik",
    "location": "hyd",
    "zip": "527390"
});

INSERT INTO `student-sample` (KEY, VALUE)
VALUES ("id_04", {
    "name": {"first_name": "bvs", "last_name": "rao"},
    "address": {
        "street": "mugalur street",
        "city": "Bangalore",
        "zip": "527390"
    }
})
RETURNING *;

INSERT INTO `student-sample` (KEY, VALUE)
VALUES ("id_05", {
    "name": {"first_name": "venkat", "last_name": "B"},
    "grade": "9",
    "marks": [89, 82, 96, 92],
    "address": {
        "street": "mugalur street",
        "city": "Bangalore",
        "zip": "527390"
    }
})
RETURNING *;

UPDATE `student-sample`
SET name.last_name = "Bvs"
WHERE name.first_name = "venkat" RETURNING *,
                                       META().id AS docid


DELETE
FROM `student-sample` USE KEYS "id_02"

SELECT META().id
FROM `student-sample`;


---------------------------------------
SELECT *
FROM system:datastores

SELECT *
FROM system:keyspaces

SELECT *
FROM system:keyspaces
WHERE id="gamesim-sample"

SELECT *
FROM system:indexes
WHERE is_primary=TRUE

SELECT META().id,
       META().cas,
       META().expiration,
       META().type
FROM `gamesim-sample`
WHERE META().expiration !=0

-----------------------------

CREATE INDEX `gamesim-sample-index1` ON `gamesim-sample`(jsonType);
CREATE INDEX `gamesim-sample-index1` ON `gamesim-sample`(jsonType) USING GSI;

SELECT *
FROM system:indexes
WHERE name="gamesim-sample-index1"

CREATE INDEX idx_gamesim_n1 ON `gamesim-sample`(name) WHERE jsonType="player"

CREATE INDEX idx_gamesim_n2 ON `gamesim-sample`(name, itemProbability) WHERE jsonType="monster"

CREATE INDEX idx_gamesim_n3 ON `gamesim-sample`(name, uuid, ownerId) WHERE jsonType="item" AND hitpoints > 1000


CREATE INDEX `gamesim-sample-index3` ON 
`gamesim-sample``gamesim-sample`(jsonType) with{"defer_build":TRUE}

CREATE INDEX `gamesim-sample-index5` ON 
`gamesim-sample`(jsonType) with {"nodes": ["127.0.0.1:8091"]}

DROP INDEX `gamesim-sample`.idx_gamesim_n2


SELECT name.first_name,
       marks[0] AS math_score,
       marks[1] AS eng_score,
       marks[2] AS chem_score,
       marks[3] AS phy_score
FROM `student-sample`

SELECT name.first_name,
       marks[0] +
       marks[1] +
       marks[2] +
       marks[3] AS total_score
FROM `student-sample`

----------------
SELECT name,
       hitpoints AS old_hitpoints,
       hitpoints * 2 AS boosted_hitpoints
FROM `gamesim-sample`
WHERE jsonType="player"
    AND hitpoints BETWEEN 10 AND 50
ORDER BY boosted_hitpoints DESC

-------------------------



SELECT COUNT(*) AS total_count
FROM `gamesim-sample`
WHERE jsonType="player"


SELECT jsonType,
       COUNT(`level`)
FROM `gamesim-sample`
GROUP BY jsonType


SELECT COUNT(jsonType) AS type_count,
       COUNT(`level`) AS level_count
FROM `gamesim-sample`

















