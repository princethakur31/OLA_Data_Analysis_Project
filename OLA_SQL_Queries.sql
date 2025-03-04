USE Ola;
#1. Retrieve all successful bookings:
CREATE VIEW Successful_Bookings AS
SELECT * FROM bookings
WHERE Booking_Status = "Success";

SELECT * FROM Successful_Bookings;


#2. Find the average ride distance for each vehicle type:
CREATE VIEW Average_Ride_Distance AS
SELECT Vehicle_Type, AVG(Ride_Distance) FROM bookings
GROUP BY Vehicle_Type; 

SELECT * FROM Average_Ride_Distance;

#3. Get the total number of cancelled rides by customers:
CREATE VIEW Canceled_Rides_By_Customer AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = "Canceled by Customer";

SELECT * FROM Canceled_Rides_By_Customer;

#4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) FROM bookings
GROUP BY Customer_ID
Order by COUNT(Booking_ID) DESC LIMIT 5;

SELECT * FROM Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Cancelled_by_Drivers_Due_to_Personal_and_Car_Related_Issue AS
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Rides_Cancelled_by_Drivers_Due_to_Personal_and_Car_Related_Issue;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW Prime_Sedan_Driver_ratings AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM Prime_Sedan_Driver_ratings;

#7. Retrieve all rides where payment was made using UPI:
CREATE VIEW Payment_by_Upi_Rides AS
SELECT * FROM bookings 
WHERE Payment_Method = 'UPI';

SELECT * FROM Payment_by_Upi_Rides;

#8. Find the average customer rating per vehicle type:
CREATE VIEW Average_Rating_of_Different_Vehicles AS
SELECT Vehicle_Type,ROUND(AVG(Driver_Ratings),2) AS average_rating FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM Average_Rating_of_Different_Vehicles;

#9. Calculate the total booking value of rides completed successfully:
CREATE VIEW total_booking_value_of_successful_rides AS
SELECT SUM(Booking_Value) AS total_successful_rides FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM total_booking_value_of_successful_rides;

#10. List all incomplete rides along with the reason:
CREATE VIEW incomplete_rides_with_reason AS 
SELECT Booking_ID, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';


SELECT * FROM incomplete_rides_with_reason;