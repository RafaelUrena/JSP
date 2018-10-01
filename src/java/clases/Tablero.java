/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

/**
 *
 * @author rafael
 */
public class Tablero {

    private char tablero[];
    private static int mosca;

    public Tablero() {
        this.tablero = new char[5];
    }

    public Tablero(int casillas) {
        this.tablero = new char[casillas];
    }

    public char[] obtenerTablero() {
        return new char [this.tablero.length];
    }
    
    public String mostrar() {
        String output = "<h4 class='pt-3'>D&oacute;nde est&aacute; la mosca?<h4>";
        output += "<div class='py-4'>";
        output += "<form method='POST'>";

        for (int i = 0; i < this.length(); i++) {
            output += "<input type='submit' name='boton' class='casilla btn btn-lg btn-success mr-2 mb-2' value='Celda " + (i + 1) + "'>";
        }
        
        output += "</form>";
        output += "</div>";
        return output;
    }

    public int situarMosca() {
        revolotear();
        
        System.out.println("****************************");
        System.out.println("La mosca se ha parado en la casilla " + this.mosca);
        return this.mosca;
    }
    
    public int posicionDeLaMosca() {
        System.out.println("posicion de la mosca: " + this.mosca);
        return this.mosca;
    }
    
    public void ponerMoscaEnCasilla(int posicion) {
        this.mosca = posicion;
    }
    
    public boolean matarMosca(int casilla) {
        System.out.println("manotazo en la casilla: " + casilla);
        System.out.println("la mosca esta en la casilla " + this.mosca);
        if (this.mosca == casilla) {
            System.out.println("Has matado la mosca");
            return true;
        } 
            
        if (casilla == this.mosca - 1 || casilla == this.mosca + 1) {
            // revolotear si la posicion es adyacente a donde esta la mosca
            revolotear();
                        
            return false;
        }
        
        return false;
    }

    public void revolotear() {
        this.mosca = (int) (Math.random() * this.length());
        
        System.out.println("la mosca ha revoloteado a la casilla " + this.mosca);
    }
    
    public boolean haRevoloteado() {
        return false;
    }
    
    public int length(){
        return this.tablero.length;
    }
}
