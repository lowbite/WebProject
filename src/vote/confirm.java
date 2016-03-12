package vote;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class confirm extends dispatcherServlet{
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String str = request.getParameter("choose");
		String i = (String) request.getSession().getAttribute("elector");
		HttpSession session = request.getSession();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/voting?user=root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT elector_voted FROM electorate WHERE elector_id="+i);
			rs.next();
			if(rs.getInt(1)==0)
				st.execute("INSERT INTO voted (voted_id) VALUES ("+str+")");
			st.execute("UPDATE electorate SET elector_voted=1 WHERE elector_id="+i);
			session.setAttribute("voted", null);
			session.setAttribute("error", null);
			session.setAttribute("elector", null);
			super.forward("/Congratulations.jsp", request, response);
			st.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
}
