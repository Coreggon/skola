package monteCarlo;

import java.util.Random;


public class MonteCarloV1 {

    public static void main(String[] args) {
        
        monteCarlo2();
        
    }
    
    private static void monteCarlo1(){
        double x;
        double y;
        Random r = new Random();
        int steps = 1000000;
        int success = 0;
        
        for(int i = 0; i <steps; i++){
            
            x = r.nextDouble();
            y = r.nextDouble();
            
            if(x >= 0.2 && x <= 0.5 && y >= 0.3 && y <= 0.9)
                success++;
            
        }
        
        double estimate = (double)success / steps;
        
        System.out.println("Odhad:" + estimate);
    }
    
    private static void monteCarlo2(){
        
        Random r = new Random();
        double cP = 0.89;
        double cN = 0.0d;
        double cV = 0.0d;
        
        int objednavka = 80;
        double predane = 0.0;
        
        int steps = 1000000;
        
        double HV = 0.0d;
        double sumHV = 0.0d;
        
        double max = 0.0d;
        int maxObjednavka = 0;
        
        for(; objednavka < 110; objednavka++){
        
            sumHV = 0;
            
            for(int i = 0; i <steps; i++){
            
                // novy den
                cN = uniform(0.4, 0.7);
                cV = cN / 2;
                predane = min(triangular(70,90,110), objednavka);
                HV = predane * cP + (objednavka - predane) * cV - objednavka * cN;
                sumHV += HV;
            
            }
            
            if(sumHV / steps > max){
                max = sumHV / steps;
                maxObjednavka = objednavka;
            }
            
        }
        
        System.out.println("maxOb: " + max + "\n kusov:" + maxObjednavka);
        
    }
    
    private static double uniform(double min, double max){
        
        Random r = new Random();
        return (r.nextDouble() * (max - min)) + min;
        
    }
    
    private static double triangular(double min, double mod, double max){
        
        Random r = new Random();
        return min + (((max - min) / 2) * (r.nextDouble() + r.nextDouble()));
        
    }
    
    private static double min(double a, double b){
        
        return a < b ? a : b;
        
    }
    
}
