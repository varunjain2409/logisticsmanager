<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logistics Management System</title>
       <style>
    :root {
        --primary: #2A4365;
        --secondary: #3182CE;
        --bg: #F7FAFC;
        --text: #2D3748;
    }
    
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        background-color: var(--bg);
        color: var(--text);
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center; /* Centers everything on the page */
        padding-top: 50px;
    }

    /* --- THE ANIMATION DEFINITION --- */
    @keyframes slideUpFadeIn {
        0% {
            opacity: 0;
            transform: translateY(40px); /* Starts 40px lower */
        }
        100% {
            opacity: 1;
            transform: translateY(0); /* Glides into final position */
        }
    }

    h2 {
        color: var(--primary);
        /* Applies the animation to the title: lasts 0.6 seconds */
        animation: slideUpFadeIn 0.6s ease-out forwards; 
    }

    .form-container {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 10px 15px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 400px;
        /* Applies the animation to the form: slightly delayed (0.2s) for a cascading effect */
        opacity: 0; /* Hides it initially */
        animation: slideUpFadeIn 0.8s ease-out 0.2s forwards; 
    }

    .form-group { margin-bottom: 20px; }
    
    label { 
        display: block; 
        margin-bottom: 8px; 
        font-weight: 600;
        color: var(--primary);
    }

    input[type="text"] { 
        width: 100%; 
        padding: 10px; 
        border: 1px solid #CBD5E0;
        border-radius: 4px;
        box-sizing: border-box;
    }

    button { 
        width: 100%;
        padding: 12px; 
        background-color: var(--secondary); 
        color: white; 
        border: none; 
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.3s ease; /* Animates the hover effect */
    }

    button:hover { background-color: #2b6cb0; }
    
    .nav-link { display: inline-block; margin-bottom: 20px; color: var(--secondary); text-decoration: none; font-weight: 600;}
    .nav-link:hover { text-decoration: underline; }
    .success { color: #38A169; font-weight: bold; text-align: center; margin-bottom: 15px;}
</style>
    </head>
    <body>
    <h2>Logistics Management System</h2>
    
    <a href="viewShipments.jsp" class="nav-link">View All Shipments &rarr;</a>

    <div class="form-container">
        <% if("true".equals(request.getParameter("success"))) { %>
            <div class="success">Shipment registered successfully!</div>
        <% } %>

        <form action="addShipment" method="POST">
            <div class="form-group">
                <label>Tracking Number:</label>
                <input type="text" name="trackingNumber" required>
            </div>
            <div class="form-group">
                <label>Sender Name:</label>
                <input type="text" name="senderName" required>
            </div>
            <div class="form-group">
                <label>Receiver Name:</label>
                <input type="text" name="receiverName" required>
            </div>
            <div class="form-group">
                <label>Destination:</label>
                <input type="text" name="destination" required>
            </div>
            <button type="submit">Save Shipment</button>
        </form>
    </div>
</body>
     
</html> 