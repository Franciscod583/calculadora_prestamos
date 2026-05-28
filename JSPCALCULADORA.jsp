<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculadora de Préstamo</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .contenedor {
            background: white;
            width: 420px;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
        }

        h1 {
            margin-bottom: 25px;
            color: #1e3c72;
            font-size: 30px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 14px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 17px;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #1e3c72;
            box-shadow: 0 0 8px rgba(30,60,114,0.4);
        }

        button {
            width: 100%;
            padding: 16px;
            background: #1e3c72;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #16325f;
        }

        .resultado {
            margin-top: 25px;
            background: #f2f6ff;
            padding: 20px;
            border-radius: 14px;
            text-align: left;
        }

        .resultado h2 {
            text-align: center;
            color: #1e3c72;
        }

        .resultado p {
            font-size: 18px;
            color: #222;
        }
    </style>
</head>
<body>

    <div class="contenedor">

        <h1>Calculadora de Cuota Mensual</h1>

        <form action="FormulaServlet" method="post">

            <label>Importe del préstamo:</label>
            <input type="number" step="0.01" name="importe" required>

            <label>Interés anual (%):</label>
            <input type="number" step="0.01" name="interes" required>

            <label>Plazo en meses:</label>
            <input type="number" name="meses" required>

            <button type="submit">Calcular</button>

        </form>

        <%
            if (request.getAttribute("cuota") != null) {
        %>
            <div class="resultado">
                <h2>Resultado</h2>

                <p><strong>Cuota mensual:</strong> $<%= request.getAttribute("cuota") %></p>
                <p><strong>Total a pagar:</strong> $<%= request.getAttribute("totalPagar") %></p>
                <p><strong>Total de intereses:</strong> $<%= request.getAttribute("totalInteres") %></p>
            </div>
        <%
            }
        %>

    </div>

</body>
</html>