SELECT 
FROM crime_scene_reports
WHERE location LIKE '%Muizz%'
AND time BETWEEN '23:15' AND '23:20';


-- Theft occurred between 11:15 PM and 11:20 PM. Witness A saw a man carrying a large bag drop a receipt from "Sobia King" for 2 Sobia and 1 Kharoub before jumping into a White Hyundai Verna that sped away towards Salah Salem road.


SELECT customer_phone
FROM sobia_king_sales
WHERE order_details LIKE '%2 Sobia, 1 Kharoub%';

-- 010-9999-8888

SELECT receiver_number FROM phone_calls
WHERE caller_number LIKE '%010-9999-8888%';

-- 011-7777-6666


SELECT license_plate
FROM vehicle_owners
WHERE phone_number LIKE '%011-7777-6666%';

-- أ ج د - 1234


SELECT license_plate
FROM traffic_cameras
WHERE location LIKE '%Salah Salem%' AND car_make LIKE '%Hyundai%'
AND car_color = 'White';


-- ن ج ن - 2562
-- هـ هـ د - 2551
-- أ ج د - 1234
-- هـ ج ب - 6097
-- د س ن - 2577



SELECT owner_name, national_id
FROM vehicle_owners
WHERE license_plate = 'أ ج د - 1234';


-- Sayed El-Tayer    -->   29011122233344



SELECT seat_number  FROM ramses_station_tickets
WHERE national_id = '29011122233344' 
AND passenger_name = 'Sayed El-Tayer';


-- 14B






