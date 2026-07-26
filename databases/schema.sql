-- Drop existing tables

DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS collision;

-- Collision table
-- One row per collision event

CREATE TABLE collision (
    collision_id VARCHAR(50) PRIMARY KEY,
    accdate TIMESTAMP,
    stname1 VARCHAR(100),
    stname2 VARCHAR(100),
    stname3 VARCHAR(100),
    per_inv INTEGER,
    acclass VARCHAR(50),
    accloc VARCHAR(100),
    traffictl VARCHAR(100),
    impactype VARCHAR(100),
    visible VARCHAR(100),
    light VARCHAR(100),
    rdsfcond VARCHAR(100),
    road_class VARCHAR(100),
    failtorem BOOLEAN,
    longitude NUMERIC(12,8),
    latitude NUMERIC(12,8),
    wardname VARCHAR(100),
    division VARCHAR(50),
    neighbourhood VARCHAR(100),
    aggressive BOOLEAN,
    distracted BOOLEAN,
    cyclist BOOLEAN,
    motorcyclist BOOLEAN,
    other_micromobility BOOLEAN,
    older_adult BOOLEAN,
    pedestrian BOOLEAN,
    red_light BOOLEAN,
    school_child BOOLEAN,
    heavy_truck BOOLEAN
);

-- Person table
-- One row per involved person

CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    collision_id VARCHAR(50) NOT NULL,
    per_no INTEGER,
    veh_no INTEGER,
    vehtype VARCHAR(100),
    initdir VARCHAR(50),
    road_user VARCHAR(50),
    invage INTEGER,
    injury VARCHAR(50),
    safequip VARCHAR(100),
    drivact VARCHAR(100),
    drivcond VARCHAR(100),
    pedact VARCHAR(100),
    pedcond VARCHAR(100),
    manoeuvre VARCHAR(100),
    pedtype VARCHAR(100),
    cyclistype VARCHAR(100),
    cycact VARCHAR(100),
    cyccond VARCHAR(100),
    fatal_no INTEGER,
    CONSTRAINT fk_collision
        FOREIGN KEY (collision_id)
        REFERENCES collision(collision_id)
);