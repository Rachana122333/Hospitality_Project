create database Hospitality;
use Hospitality;
CREATE TABLE dim_date (
    date_raw VARCHAR(15),
    mmm_yy VARCHAR(10),
    week_no VARCHAR(10),    
    day_type VARCHAR(10)
);
-- Creating a new column with corrected date format:
ALTER TABLE dim_date ADD COLUMN date DATE;
-- Updating using STR_TO_DATE to convert formats:
UPDATE dim_date
SET date = STR_TO_DATE(date_raw, '%d-%b-%y');
-- Removing date_raw after conversion
ALTER TABLE dim_date DROP COLUMN date_raw;



CREATE TABLE dim_hotels (
    property_id VARCHAR(10),
    property_name VARCHAR(100),
    category VARCHAR(20),
    city VARCHAR(50)
);

CREATE TABLE dim_rooms (
    room_id VARCHAR(10),
    room_class VARCHAR(30)
);

CREATE TABLE fact_aggregated_bookings (
    property_id VARCHAR(10),
    check_in_date varchar(10),
    room_category VARCHAR(10),
    successful_bookings INT,
    capacity INT
);

CREATE TABLE fact_bookings (
    booking_id VARCHAR(20) PRIMARY KEY,
    property_id INT,
    booking_date DATE,
    check_in_date DATE,
    checkout_date DATE,
    no_guests INT,
    room_category VARCHAR(10),
    booking_platform VARCHAR(50),
    ratings_given DECIMAL(3,1),  -- can hold values like 5.0, 4.5, etc.
    booking_status VARCHAR(20),
    revenue_generated INT,
    revenue_realized INT
);
select * from fact_bookings;


SHOW VARIABLES LIKE 'secure_file_priv';






