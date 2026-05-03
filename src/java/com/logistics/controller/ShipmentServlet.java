package com.logistics.controller;

import com.logistics.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ShipmentServlet", urlPatterns = {"/addShipment"})
public class ShipmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve form data
        String trackingNo = request.getParameter("trackingNumber");
        String sender = request.getParameter("senderName");
        String receiver = request.getParameter("receiverName");
        String destination = request.getParameter("destination");

        try (Connection conn = DBConnection.getConnection()) {
            // SQL Insert Statement
            String sql = "INSERT INTO shipments (tracking_number, sender_name, receiver_name, destination) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, trackingNo);
            pstmt.setString(2, sender);
            pstmt.setString(3, receiver);
            pstmt.setString(4, destination);
            
            pstmt.executeUpdate();
            
            // Redirect back to the main page after successful insertion
            response.sendRedirect("index.jsp?success=true");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error saving shipment: " + e.getMessage());
        }
    }
}
