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

@WebServlet(name = "DeleteServlet", urlPatterns = {"/deleteShipment"})
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String shipmentId = request.getParameter("id");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM shipments WHERE shipment_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(shipmentId));
            
            pstmt.executeUpdate();
            
            // Redirect back to the view page after deleting
            response.sendRedirect("viewShipments.jsp");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting record: " + e.getMessage());
        }
    }
}