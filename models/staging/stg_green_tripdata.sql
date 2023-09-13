{{ config(materialized='view') }}

select 

--identifiers
cast(VendorID as integer) as vendorID,
cast(RatecodeID as integer) as ratecodeid,
cast(PULocationID as integer) as pickup_locationdid,
cast(DOLocationID as integer) as dropoff_locationdid,	

--timestamps
cast(lpep_pickup_datetime as timestamp) as pickup_datetime,	
cast(lpep_dropoff_datetime as timestamp) as dropoff_datetime,

--trip info
store_and_fwd_flag,
cast(passenger_count as integer) as passenger_count,
cast(trip_distance	as numeric) as trip_distance,
cast(trip_type as integer) as trip_type,

--payment info
cast(fare_amount as numeric) as fare_amount,
cast(extra as numeric) as extra,
cast(mta_tax as numeric) as mta_tax,
cast(tip_amount as numeric) as tip_amount,
cast(tolls_amount as numeric) as tolls_amount,
cast(ehail_fee	integer) as ehail_fee,
cast(improvement_surcharge as numeric) as improvement_surcharge,
cast(total_amount as numeric) as total_amount,
cast(payment_type	integer) as payment_type,	
cast(congestion_surcharge as numeric) congestion_surcharge

from {{ source('staging', 'green_tripdata') }}
limit 100