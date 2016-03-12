package vote;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class check extends dispatcherServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String key = request.getParameter("key");
		LinkedList<Container> candidates = new LinkedList<Container>();
		LinkedList<String> name = new LinkedList<String>();
		try {
			HttpSession session = request.getSession();
			session.setAttribute("error", null);
			session.setAttribute("elector", null);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/voting?user=root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"SELECT * FROM electorate WHERE elector_id='" + id + "' AND elector_key='" + key + "'");
			if (rs.next()) {
				name.add(rs.getString(3));
				name.add(rs.getString(2));
				name.add(rs.getString(4));
				ResultSet rs1 = st.executeQuery("SELECT elector_voted FROM electorate WHERE elector_id='" + id
						+ "' AND elector_key='" + key + "'");
				rs1.next();
				if (rs1.getInt(1) == 0) {
					ResultSet rs2 = st.executeQuery("SELECT * FROM candidates");
					while (rs2.next())
						candidates.add(new Container(rs2.getInt(1), rs2.getString(2), rs2.getString(3), rs2.getString(4),
								rs2.getString(5), rs2.getString(6)));
					session.setAttribute("name", name);
					session.setAttribute("list", candidates);
					session.setAttribute("elector", id);
					super.forward("/choose.jsp", request, response);
				} else {
					session.setAttribute("error", "voted");
					super.forward("/loginIn.jsp", request, response);
				}
			} else {
				if(id!=null){
					session.setAttribute("error", "wrong");
				}
				super.forward("/loginIn.jsp", request, response);
			}
			st.close();
			rs.close();
			con.close();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
