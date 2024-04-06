import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userSignupServlet")
public class userSignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost/samplejfst";
        String dbUser = "root";
        String dbPassword = "Mysql@123";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            // Prepare a SQL statement to insert user data into the table
            String insertQuery = "INSERT INTO user_login (name, username, password) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, password);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                // User data inserted successfully, redirect to userLogin.jsp
                response.sendRedirect("userLogin.jsp");
            } else {
                // Error occurred during insertion, redirect to error.html
                response.sendRedirect("error.html");
            }

            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle the exception here or redirect to an error page
            response.sendRedirect("error.html");
        }
    }
}
