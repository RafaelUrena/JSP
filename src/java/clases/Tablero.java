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
    private int mosca;

    public Tablero() {
        this.tablero = new char[5];
    }

    public Tablero(int casillas) {
        this.tablero = new char[casillas];
    }

    public char[] obtenerTablero() {
        return new char [this.tablero.length];
//        char [] tablero = new char[this.length()];
//
//        int celda = situarMosca();
//        tablero[celda] = 'M';
//        
//        return tablero;
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
        
        return this.mosca;
    }
    
    public int posicionDeLaMosca() {
        return this.mosca;
    }
    
    public boolean matarMosca(int casilla) {
        if (this.mosca == casilla) {
            return true;
        } else if (this.mosca == casilla - 1 || this.mosca == casilla + 1) {
            // revolotear si la posicion es adyacente a donde esta la mosca
            revolotear();
            
            return false;
        }
        
        return false;
    }

    public void revolotear() {
        this.mosca = (int) (Math.random() * this.length());
    }
    
    public int length(){
        return this.tablero.length;
    }
}
