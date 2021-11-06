PRAGMA foreign_keys=ON;
.mode column
.headers ON

DROP TABLE IF EXISTS "Patient";
DROP TABLE IF EXISTS "PressureMapping";
DROP TABLE IF EXISTS "PosteriorAuscultation";

CREATE TABLE "Patient" (
    "identification" TEXT PRIMARY KEY,
    "temperature" REAL,
    "moisture" REAL
);

CREATE TABLE "PressureMapping" (
    "patient" TEXT REFERENCES "Patient",
    "x" INTEGER,
    "y" INTEGER,
    "value" REAL,
    PRIMARY KEY("patient","x","y")
);

CREATE TABLE "PosteriorAuscultation" (
    "patient" TEXT REFERENCES "Patient",
    "audio" BLOB,
    "date" TEXT
);

INSERT INTO "Patient"("identification","temperature","moisture") VALUES("001", 38, 27);
INSERT INTO "Patient"("identification","temperature","moisture") VALUES("002", 37.5, 30);
INSERT INTO "Patient"("identification","temperature","moisture") VALUES("003", 36, 25);

INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("001",1,1,1.2);
INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("001",1,2,1.2);
INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("002",1,1,1.5);
INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("002",1,2,1.5);
INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("003",1,1,1.7);
INSERT INTO "PressureMapping"("patient","x","y","value") VALUES("003",1,2,1.7);