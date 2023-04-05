CREATE TABLE
    driver(
        driverid VARCHAR2(10) CONSTRAINT DRIVERID_FORMAT CHECK (driverid LIKE 'DR%') CONSTRAINT DRIVERID_PK PRIMARY KEY,
        licensenumber NUMBER CONSTRAINT UNIQUE_LN UNIQUE,
        licenseexpiry DATE,
        first_name VARCHAR2(20),
        last_name VARCHAR(20),
        street VARCHAR(20),
        city VARCHAR(20)
    );

CREATE TABLE
    vehicle(
        vehicleid VARCHAR(10) CONSTRAINT VEHICLEID_PK PRIMARY KEY CONSTRAINT VEHICLEID_FORMAT CHECK (vehicleid LIKE 'VH%'),
        model VARCHAR(10),
        mileage NUMBER(10),
        regyear VARCHAR(4) CONSTRAINT YEAR_FORMAT CHECK (
            regyear LIKE '19__'
            OR regyear LIKE '2___'
        ),
    );

CREATE TABLE
    trip(
        tripid VARCHAR2(10) CONSTRAINT TRIPID_PK PRIMARY KEY CONSTRAINT TRIPID_FORMAT CHECK (tripid LIKE 'TR%'),
        startdate DATE,
        enddate DATE,
        startlocation VARCHAR2(20),
        destination VARCHAR(20),
        distance NUMBER(20),
        passengercount NUMBER(10),
        CONSTRAINT END_GREATER_START CHECK (enddate >= startdate);

);

CREATE TABLE
    cost(
        costid VARCHAR2(10) CONSTRAINT COSTID_PK PRIMARY KEY CONSTRAINT COSTID_FORMAT CHECK (costid LIKE 'CS%'),
        tripid VARCHAR2(10) CONSTRAINT TRIPID_FK REFERENCES trip,
        fuelcost NUMBER(20) CONSTRAINT GREATERTHAN0 CHECK (fuelcost > 0),
        totalcost NUMBER(20),
        CONSTRAINT TC_GREATER_FC CHECK (totalcost > fuelcost)
    );

CREATE TABLE
    vehicle_involved(
        tripid VARCHAR2(10) CONSTRAINT TRIPID_FK REFERENCES trip,
        vehicleid VARCHAR2(10) CONSTRAINT VEHICLEID_FK REFERENCES vehicle,
        CONSTRAINT VI_PK PRIMARY KEY (tripid, vehicleid)
    );

CREATE TABLE
    driver_involved(
        tripid VARCHAR2(10) CONSTRAINT TRIPID_FK REFERENCES trip,
        driverid VARCHAR2(10) CONSTRAINT DRIVERID_FK REFERENCES driver,
        CONSTRAINT DI_PK PRIMARY KEY (tripid, driverid)
    );

CREATE TABLE
    driver_phone(
        driverid VARCHAR2(10) CONSTRAINT DRIVERID_FK REFERENCES driver,
        phone VARCHAR2(10) CONSTRAINT TEN_DIGIT CHECK (phone LIKE '__________'),
        CONSTRAINT DI_PK PRIMARY KEY (phone, driverid)
    );
