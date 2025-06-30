<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .admin-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border-radius: 18px;
            padding: 45px 35px;
            width: 420px;
            text-align: center;
            box-shadow: 0 0 25px rgba(164, 118, 255, 0.3);
            animation: fadeIn 0.8s ease-in-out;
        }

        h1 {
            font-size: 30px;
            margin-bottom: 30px;
            color: #4a148c;
        }

        .btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            width: 100%;
            background: linear-gradient(135deg, #5e35b1, #7b1fa2); /* Dark violet to purple */
            border: none;
            color: #fff;
            padding: 14px;
            margin: 15px 0;
            font-size: 16px;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .btn i {
            font-size: 18px;
        }

        .btn:hover {
            background: linear-gradient(135deg, #4527a0, #6a1b9a);
            transform: translateY(-2px);
        }

        .logout {
            margin-top: 20px;
            display: inline-block;
            color: #4a148c;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .logout:hover {
            color: #311b92;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <h1>Admin Control Panel</h1>

        <form action="addImage.jsp">
            <button class="btn"><i class="fas fa-plus-circle"></i> Add Room</button>
        </form>
        <form action="updateImage.jsp">
            <button class="btn"><i class="fas fa-edit"></i> Update Room</button>
        </form>
        <form action="deleteImage.jsp">
            <button class="btn"><i class="fas fa-trash-alt"></i> Delete Room</button>
        </form>

        <a class="logout" href="index.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</body>
</html>
