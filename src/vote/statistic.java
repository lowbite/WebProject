package vote;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class statistic extends dispatcherServlet{
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			HashMap<String, Integer> stat = new HashMap<String, Integer>();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/voting?user=root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM candidates");
			while(rs.next()){
				Statement st1 = con.createStatement();
				Statement st2 = con.createStatement();
				ResultSet rs1 = st1.executeQuery("SELECT COUNT(*) FROM voted WHERE voted_id="+rs.getInt(1));
				ResultSet rs2 = st2.executeQuery("SELECT * FROM candidates WHERE candidate_id="+rs.getInt(1));
				rs1.next();
				rs2.next();
				stat.put(rs2.getString(2)+" "+rs2.getString(3)+" "+rs2.getString(4), rs1.getInt(1));
				rs2.close();
				rs1.close();
				st1.close();
				st2.close();
			}
			session.setAttribute("statistic", stat);
			session.setAttribute("error", null);
			super.forward("/statistic.jsp", request, response);
			rs.close();
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
