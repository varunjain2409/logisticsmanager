<%@page import="java.sql.*"%>
<%@page import="com.logistics.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Shipments</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            table { border-collapse: collapse; width: 100%; margin-top: 20px; }
            th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
            th { background-color: #f2f2f2; }
            a { text-decoration: none; padding: 5px 10px; border-radius: 3px; }
            .btn-edit { background-color: #ffc107; color: black; }
            .btn-delete { background-color: #dc3545; color: white; }
            .nav-link { display: inline-block; margin-bottom: 20px; color: blue; }
        </style>
    </head>
    <body>
        <h2>Shipment Records</h2>
        <a href="index.jsp" class="nav-link">&larr; Back to Add Shipment</a>

        <table>
            <tr>
                <th>ID</th>
                <th>Tracking No</th>
                <th>Sender</th>
                <th>Receiver</th>
                <th>Destination</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    Connection conn = DBConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM shipments");
                    
                    while(rs.next()) {
                        int id = rs.getInt("shipment_id");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= rs.getString("tracking_number") %></td>
                <td><%= rs.getString("sender_name") %></td>
                <td><%= rs.getString("receiver_name") %></td>
                <td><%= rs.getString("destination") %></td>
                <td>
                    <a href="editShipment.jsp?id=<%= id %>" class="btn-edit">Edit</a>
                    <a href="deleteShipment?id=<%= id %>" class="btn-delete" onclick="return confirm('Are you sure you want to delete this shipment?');">Delete</a>
                </td>
            </tr>
            <%
                    }
                    conn.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='6'>Error loading data: " + e.getMessage() + "</td></tr>");
                }
            %>
        </table>
    </body>
</html>