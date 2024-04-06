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





@WebServlet("/trainServlet")

public class trainServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("text/html");



        String fromCity = request.getParameter("fromCity");

        String toCity = request.getParameter("toCity");

        String departureDateString = request.getParameter("departureDate");



        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/samplejfst", "root", "Mysql@123");



            // Convert the string to a java.sql.Date object

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date departureUtilDate = sdf.parse(departureDateString);

            java.sql.Date departureDate = new java.sql.Date(departureUtilDate.getTime());



            // Query the database based on the from, to, and departure date

            PreparedStatement ps = con.prepareStatement("SELECT * FROM trains WHERE source=? AND dest=? AND date_of_departure=?");

            ps.setString(1, fromCity);

            ps.setString(2, toCity);

            ps.setDate(3, departureDate);

            ResultSet rs = ps.executeQuery();



            // Set the result set as an attribute to be used in the JSP

            request.setAttribute("resultSet", rs);
            



            // Set the attributes for fromCity, toCity, and departureDate to be used in the JSP

            request.setAttribute("fromCity", fromCity);

            request.setAttribute("toCity", toCity);

            request.setAttribute("departureDate", departureDate);



            // Forward the request to the trainlist.jsp

            request.getRequestDispatcher("trainlist.jsp").forward(request, response);



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