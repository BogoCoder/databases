package testServlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/testServlet/consultaCursosEstudiante")
public class ConsultaCursosEstudiante extends HttpServlet{

	public void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		out.println("<HEAD><TITLE>Query Result</TITLE></HEAD>");
		out.println("<BODY>");
		String persontype = request.getParameter("tipoBusqueda");
		//String number = request.getParameter("nombre");
		out.println("<table BORDER COLS=5>");
		out.println(" <tr> <td>curso_cod</td> <td>nombre</td>" +
				" <td>nombre_unid</td> <td>creditos</td> <td>num_grupos</td></tr>");
		String ID;
		String nombre;
		String Apellido;

		try (
		Connection conexion =
		DriverManager.getConnection (
		"jdbc:postgresql://localhost:5432/taller4a" ,
		"postgres" ,
		"135890" ) ) {
		Statement statement = conexion.createStatement();

		//Ejemplo 1 consulta parametrizada
		String atributos = "*";  
		String relacion = "curso";
		ResultSet resultSet = statement.executeQuery("select "+atributos+"  from "+relacion+ ";");
		
		while (resultSet.next()) {
			out.println("<tr> <td>" + resultSet.getString("curso_cod") + "</td>" +
			"<td>" + resultSet.getString("nombre") + "</td>" +
			"<td>" + resultSet.getString("nombre_unid") + "</td>" +
			"<td>" + resultSet.getString("creditos") + "</td>" +
			"<td>" + resultSet.getString("num_grupos") + "</td></tr>");
		}
		System.out.println();

		out.println("</table>");
		out.println("</BODY>");
		out.close();


	} catch (SQLException e) {
		System.out.println("Conexión fallida") ;
		e.printStackTrace () ;
		}
	}
}
