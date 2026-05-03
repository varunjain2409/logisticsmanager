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

@WebServlet(name = "UpdateServlet", urlPatterns = {"/updateShipment"})
public class UpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Retrieve modified form data
        int id = Integer.parseInt(request.getParameter("shipmentId"));
        String trackingNo = request.getParameter("trackingNumber");
        String sender = request.getParameter("senderName");
        String receiver = request.getParameter("receiverName");
        String destination = request.getParameter("destination");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE shipments SET tracking_number=?, sender_name=?, receiver_name=?, destination=? WHERE shipment_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, trackingNo);
            pstmt.setString(2, sender);
            pstmt.setString(3, receiver);
            pstmt.setString(4, destination);
            pstmt.setInt(5, id);
            
            pstmt.executeUpdate();
            
            // Redirect back to the view page
            response.sendRedirect("viewShipments.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating record: " + e.getMessage());
        }
    }
}
