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

@WebServlet("/cancelServlet")
public class cancelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String passengerId = request.getParameter("passengerId");
        String trainId = request.getParameter("trainId");
        String payId = request.getParameter("payId");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/samplejfst", "root", "Mysql@123");

            // Check if there is an entry in the payment table with the given train ID, passenger ID, and payment ID
            PreparedStatement ps = con.prepareStatement("SELECT * FROM payment WHERE train_id_id=? AND passenger_id_id=? AND id=?");
            ps.setString(1, trainId);
            ps.setString(2, passengerId);
            ps.setString(3, payId);

            // Process the result and handle the cancellation
            if (ps.executeQuery().next()) {
                // Entry found, delete the entry to cancel the reservation
                PreparedStatement deletePs = con.prepareStatement("DELETE FROM payment WHERE train_id_id=? AND passenger_id_id=? AND id=?");
                deletePs.setString(1, trainId);
                deletePs.setString(2, passengerId);
                deletePs.setString(3, payId);
                deletePs.executeUpdate();
                PreparedStatement deletePs1 = con.prepareStatement("DELETE FROM booking WHERE train_id_id=? AND passenger_id_id=? AND id=?");
                deletePs1.setString(1, trainId);
                deletePs1.setString(2, passengerId);
                deletePs1.setString(3, payId);
                deletePs1.executeUpdate();
                PreparedStatement deletePs2 = con.prepareStatement("DELETE FROM passenger WHERE id=?");
                deletePs2.setString(1, passengerId);
                deletePs2.executeUpdate();
            }

            // Redirect to cancelnext.html
            response.sendRedirect("cancelnext.html");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
