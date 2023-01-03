import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import java.sql.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;



@WebServlet("/AddVenue")

public class AddVenue extends HttpServlet 
{
	private final String UPLOAD_DIRECTORY = "C:/xampp/tomcat/webapps/Java_Project/Images";
    private static final long serialVersionUID = 1L;
	public AddVenue() 
	{
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        doPost(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
        if (ServletFileUpload.isMultipartContent(request))
        {
            try
            {
				
				String inputName = null;
				String inputName1 = null;
				String vname = null;
				String vcapacity = null;
				String vaddress = null;
				String vstate = null;
				String vdistrict = null;
				String vcity = null;
				String varea = null;
				String vpreffernce = null;
				String vrate = null;
				String vphone = null;
				String vmail = null;
				String vphoto = null;
				String query7;
				
                List < FileItem > multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item: multiparts)
                {
					
					if(item.isFormField())
					{
						inputName = (String)item.getFieldName();
						if(inputName.equalsIgnoreCase("V_name"))
						{ 
							vname = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_capacity"))
						{ 
							vcapacity = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_addr"))
						{ 
							vaddress = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_state"))
						{ 
							vstate = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_dist"))
						{ 
							vdistrict = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_city"))
						{ 
							vcity = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_area"))
						{ 
							varea = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_preff"))
						{ 
							vpreffernce = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_rate"))
						{ 
							vrate = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_phone"))
						{ 
							vphone = (String)item.getString(); 
						}
						if(inputName.equalsIgnoreCase("V_email"))
						{ 
							vmail = (String)item.getString(); 
						}
					}
					else
					{
						vphoto = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + vphoto));
					}
					
					Class.forName("org.postgresql.Driver");
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/eventmanage","postgres","mcasc05");
					Statement stmt = con.createStatement();
					ResultSet rs1 = null;
					ResultSet rs2 = null;
					
					String query = "insert into Venue(VNAME,VCAPACITY,VADDRESS,VSTATE,VDISTRICT,VCITY,VAREA,VPREFERABLE_FOR,VRATE,VPHONE,VEMAIL) values('"+vname+"','"+vcapacity+"','"+vaddress+"','"+vstate+"','"+vdistrict+"','"+vcity+"','"+varea+"','"+vpreffernce+"','"+vrate+"','"+vphone+"','"+vmail+"')";
					stmt.executeUpdate(query);

					String query1 = "insert into Venue_Image(VImage) values ('"+vphoto+"')";
					stmt.executeUpdate(query1);

					String query2 = "delete from Venue where VEMAIL='null'";
					stmt.executeUpdate(query2);

					String query3 = "delete from Venue_Image where VImage='null'";
					stmt.executeUpdate(query3);

					String query4 = "delete from Venue where VId not in(select min(VId) from Venue group by VNAME,VCAPACITY,VADDRESS,VSTATE,VDISTRICT,VCITY,VAREA,VPREFERABLE_FOR,VRATE,VPHONE,VEMAIL)";
					stmt.executeUpdate(query4);

					String query5 = "select VId from Venue where VNAME='"+vname+"' and VPREFERABLE_FOR = '"+vpreffernce+"' and VRATE = '"+vrate+"'";
					rs1 = stmt.executeQuery(query5);

					String query6 = "select VIid from Venue_Image where VImage='"+vphoto+"'";
					rs2 = stmt.executeQuery(query6);

					while(rs1.next() && rs2.next())
					{
						query7 = "insert into Venue_VImage(VId,VIid) values ('"+rs1.getInt("VId")+"','"+rs2.getInt("VIid")+"')";
						stmt.executeUpdate(query7);
					}	
                }

				request.setAttribute("message", "Your Data Inserted Successfully");
            }
			catch (Exception ex)
            {
                request.setAttribute("message", "File upload failed due to : " + ex);
            }
        } 
		else
        {
            request.setAttribute("message", "Sorry this servlet only handles file upload request.");
        }
        request.getRequestDispatcher("/venue.jsp").forward(request, response);
    }
}