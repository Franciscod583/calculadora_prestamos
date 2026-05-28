package controlador;

import PAQUETE.CalculadoraPrestamo;
import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FormulaServlet", urlPatterns = {"/FormulaServlet"})
public class FormulaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double importe = Double.parseDouble(request.getParameter("importe"));
        double interes = Double.parseDouble(request.getParameter("interes"));
        int meses = Integer.parseInt(request.getParameter("meses"));

        CalculadoraPrestamo prestamo = new CalculadoraPrestamo(importe, interes, meses);

        double cuota = prestamo.calcularCuotaMensual();
        double totalPagar = prestamo.calcularTotalPagar();
        double totalInteres = prestamo.calcularTotalInteres();

        DecimalFormat df = new DecimalFormat("0.00");

        request.setAttribute("cuota", df.format(cuota));
        request.setAttribute("totalPagar", df.format(totalPagar));
        request.setAttribute("totalInteres", df.format(totalInteres));

        request.getRequestDispatcher("JSPCALCULADORA.jsp").forward(request, response);
    }
}