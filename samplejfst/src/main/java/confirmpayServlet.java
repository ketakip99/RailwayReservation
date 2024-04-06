import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.io.PrintWriter;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;

import com.mysql.cj.xdevapi.Statement;





@WebServlet("/confirmpayServlet")

public class confirmpayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("text/html");



        String fromCity = request.getParameter("fromCity");

        String toCity = request.getParameter("toCity");

        String departureDateString = request.getParameter("departureDate");
        System.out.println("XHECKKKKKK"+departureDateString);
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthdateString = request.getParameter("birthdate");
        String gender = request.getParameter("gender");
        String paymentMethod = request.getParameter("select");
        String fare = request.getParameter("fare");
        
        long trainId = Long.parseLong(id);
        double fareSQL = Double.parseDouble(fare);
        
        String arrival_time="";
        String departure_time ="";
        String arrival_date="";
        
        System.out.println(fromCity);
        System.out.println(id);
        System.out.println(name);
        System.out.println(email);
        System.out.println(phone);
        System.out.println(gender);
        System.out.println(birthdateString);
        
        



        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/samplejfst", "root", "Mysql@123");
            
            



            // Convert the string to a java.sql.Date object
            LocalDate currentDate = LocalDate.now();
            java.sql.Date dateOfBooking = java.sql.Date.valueOf(currentDate);
            
            LocalDate birthdate = LocalDate.parse(birthdateString);
            Period age = Period.between(birthdate, currentDate);

            // Extract years, months, and days from the age period
            int years = age.getYears();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date birthdateDate = sdf.parse(birthdateString);

            java.sql.Date birthdateSQL = new java.sql.Date(birthdateDate.getTime());
            
            long passengerId =0; long paymentId=0;
            

            // Query the database based on the from, to, and departure date

            PreparedStatement ps = con.prepareStatement("INSERT INTO passenger (name, age, sex, phno, email, train_id_id) VALUES (?, ?, ?, ?, ?, ?)", new String[]{"passid"});
            ps.setString(1, name);
            ps.setInt(2, years);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setLong(6, trainId);

            int rowsInserted = ps.executeUpdate();
//            ps.close();

            if (rowsInserted > 0) {
                // Data inserted successfully
                ResultSet generatedKeys = ps.getGeneratedKeys();

                if (generatedKeys.next()) {
                    passengerId = generatedKeys.getLong(1); // Retrieve the generated passenger ID
                    ps.close();

                    // Step 2: Insert data into the "payment" table
                    PreparedStatement ps2 = con.prepareStatement("INSERT INTO payment (amount, mode, train_id_id, passenger_id_id) VALUES (?, ?, ?, ?)", new String[]{"paymentid"});
                    ps2.setDouble(1, fareSQL);
                    ps2.setString(2, paymentMethod);
                    ps2.setLong(3, trainId);
                    ps2.setLong(4, passengerId); // Use the retrieved passenger ID
                   
          

                    int rowsInserted2 = ps2.executeUpdate();
                    ResultSet generatedPaymentID = ps2.getGeneratedKeys();
                    if(generatedPaymentID.next()) {
                    	paymentId =generatedPaymentID.getLong(1); 
                    }
                    ps2.close();

                    // Step 3: Insert data into the "booking" table
                    PreparedStatement ps3 = con.prepareStatement("INSERT INTO booking (date_of_booking, train_id_id, passenger_id_id) VALUES (?, ?, ?)");
                    ps3.setDate(1, dateOfBooking);
                    ps3.setLong(2, trainId);
                    ps3.setLong(3, passengerId); // Use the retrieved passenger ID

                    int rowsInserted3 = ps3.executeUpdate();
                    ps3.close();
                    
                    PreparedStatement ps4 = con.prepareStatement("UPDATE trains SET remaining_seats = remaining_seats - 1 WHERE id = ?");
                    ps4.setLong(1, trainId);
                    int rowsUpdated = ps4.executeUpdate();
                    ps4.close();

                    // Check if data was inserted successfully into all three tables
                    if (rowsInserted2 > 0 && rowsInserted3 > 0) {
                        System.out.println("Data inserted into all tables successfully.");
                    } else {
                        System.out.println("Failed to insert data into one or more tables.");
                    }
                }
            } else {
                System.out.println("Failed to insert data into the passengers table.");
            }
            
         // Define the SQL query to retrieve data from the table
            PreparedStatement ps5 = con.prepareStatement("SELECT * from trains WHERE id=?");
            ps5.setLong(1, trainId);

            // Execute the query
            ResultSet resultSet = ps5.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                // Retrieve data from the result set
                arrival_time = resultSet.getString("arrival_time");
                departure_time = resultSet.getString("departure_time");
                arrival_date = resultSet.getString("date_of_arrival");
            }
    

           

            request.setAttribute("fromCity", fromCity);
            request.setAttribute("toCity", toCity);
            request.setAttribute("departureDate", departureDateString);
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("birthdate", birthdateString);
            request.setAttribute("gender", gender);
            request.setAttribute("paymentMethod", paymentMethod);
            request.setAttribute("fare", fare);
            request.setAttribute("passengerId", passengerId);
            request.setAttribute("age", years);
            request.setAttribute("arrival_time", arrival_time);
            request.setAttribute("departure_time", departure_time);
            request.setAttribute("currentDate", currentDate);
            request.setAttribute("arrivalDate", arrival_date);
            request.setAttribute("paymentId", paymentId);
            
            System.out.println("Nothing"+years);
            System.out.println(id);
            System.out.println(name);

            // Forward the request to the JSP page
            request.getRequestDispatcher("receipt.jsp").forward(request, response);



        } catch (ClassNotFoundException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} catch (SQLException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		} catch (ParseException e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		};

    }

}