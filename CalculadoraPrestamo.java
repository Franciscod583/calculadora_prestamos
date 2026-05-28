package PAQUETE
        ;

public class CalculadoraPrestamo {

    private double importe;
    private double interesAnual;
    private int meses;

    public CalculadoraPrestamo() {
    }

    public CalculadoraPrestamo(double importe, double interesAnual, int meses) {
        this.importe = importe;
        this.interesAnual = interesAnual;
        this.meses = meses;
    }

    public double calcularCuotaMensual() {
        double interesMensual = (interesAnual / 100) / 12;

        if (interesMensual == 0) {
            return importe / meses;
        }

        double cuota = (importe * interesMensual) /
                (1 - Math.pow(1 + interesMensual, -meses));

        return cuota;
    }

    public double calcularTotalPagar() {
        return calcularCuotaMensual() * meses;
    }

    public double calcularTotalInteres() {
        return calcularTotalPagar() - importe;
    }
}