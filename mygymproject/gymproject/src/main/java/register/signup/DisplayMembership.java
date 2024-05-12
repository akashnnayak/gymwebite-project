package register.signup;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import register.connection.DbCon;
import register.dao.MembershipDao;
import register.model.Membership;

public class DisplayMembership extends HttpServlet {
   
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MembershipDao membershipDao = null;
		try {
			membershipDao = new MembershipDao(DbCon.getConnection());
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
        
        List<Membership> memberships = membershipDao.getAllMemberships();
        
        // Set membership details as request attributes
        for (Membership membership : memberships) {
            if (membership.getMembershipType().equalsIgnoreCase("Silver")) {
                request.setAttribute("silver_price", membership.getPrice());
                request.setAttribute("silver_details", membership.getDetails());
                request.setAttribute("silver_duration", membership.getDuration());
            } else if (membership.getMembershipType().equalsIgnoreCase("Gold")) {
                request.setAttribute("gold_price", membership.getPrice());
                request.setAttribute("gold_details", membership.getDetails());
                request.setAttribute("gold_duration", membership.getDuration());
            } else if (membership.getMembershipType().equalsIgnoreCase("Platinum")) {
                request.setAttribute("platinum_price", membership.getPrice());
                request.setAttribute("platinum_details", membership.getDetails());
                request.setAttribute("platinum_duration", membership.getDuration());
            }
        }
        
        request.getRequestDispatcher("display_membership.jsp").forward(request, response);
    }
}
