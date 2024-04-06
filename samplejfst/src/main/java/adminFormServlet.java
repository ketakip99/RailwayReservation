import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminFormServlet")
public class adminFormServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Handle GET requests here
        // You can provide a form or other information in response to GET requests
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String arrivalDateString = request.getParameter("arrivalDate");
        String departureDateString = request.getParameter("departureDate");
        int remainingSeats = Integer.parseInt(request.getParameter("remainingSeats"));
        String arrivalTime = request.getParameter("arrivalTime");
        String departureTime = request.getParameter("departureTime");
        double fare = Double.parseDouble(request.getParameter("fare"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/samplejfst", "root", "Mysql@123");

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date arrivalUtilDate = sdf.parse(arrivalDateString);
            java.sql.Date arrivalDate = new java.sql.Date(arrivalUtilDate.getTime());

            java.util.Date departureUtilDate = sdf.parse(departureDateString);
            java.sql.Date departureDate = new java.sql.Date(departureUtilDate.getTime());

            PreparedStatement ps = con.prepareStatement("INSERT INTO trains (dest,source, date_of_arrival, date_of_departure,arrival_time, departure_time, remaining_seats, fare) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, destination);
            ps.setString(2, source);
            ps.setDate(3, arrivalDate);
            ps.setDate(4, departureDate);
            ps.setString(5, arrivalTime);
            ps.setString(6, departureTime);
            ps.setInt(7, remainingSeats);
            ps.setDouble(8, fare);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
            	response.sendRedirect("successful.html");
            } else {
            	response.sendRedirect("error.html");
            }

            con.close();
        } catch (ClassNotFoundException | SQLException | ParseException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
