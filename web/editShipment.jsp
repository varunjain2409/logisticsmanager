<%@page import="java.sql.*"%>
<%@page import="com.logistics.util.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Shipment</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 40px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; }
            input[type="text"] { width: 300px; padding: 8px; }
            button { padding: 10px 15px; background-color: #007bff; color: white; border: none; cursor: pointer;}
        </style>
    </head>
    <body>
        <h2>Edit Shipment</h2>
        <%
            String id = request.getParameter("id");
            try {
                Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM shipments WHERE shipment_id=?");
                pstmt.setString(1, id);
                ResultSet rs = pstmt.executeQuery();
                
                if(rs.next()) {
        %>
        <form action="updateShipment" method="POST">
            <input type="hidden" name="shipmentId" value="<%= rs.getInt("shipment_id") %>">
            
            <div class="form-group">
                <label>Tracking Number:</label>
                <input type="text" name="trackingNumber" value="<%= rs.getString("tracking_number") %>" required>
            </div>
            <div class="form-group">
                <label>Sender Name:</label>
                <input type="text" name="senderName" value="<%= rs.getString("sender_name") %>" required>
            </div>
            <div class="form-group">
                <label>Receiver Name:</label>
                <input type="text" name="receiverName" value="<%= rs.getString("receiver_name") %>" required>
            </div>
            <div class="form-group">
                <label>Destination:</label>
                <input type="text" name="destination" value="<%= rs.getString("destination") %>" required>
            </div>
            <button type="submit">Update Shipment</button>
            <a href="viewShipments.jsp" style="margin-left: 10px;">Cancel</a>
        </form>
        <%
                }
                conn.close();
            } catch(Exception e) {
                out.println("Error loading record: " + e.getMessage());
            }
        %>
    </body>
</html>