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

    public Tablero() {
        this.tablero = new char[5];
    }

    public Tablero(int casillas) {
        this.tablero = new char[casillas];
    }

    public char[] obtenerTablero() {
//        return new char [this.tablero.length];
        char [] tablero = new char[this.length()];

        int celda = situarMosca();
        tablero[celda] = 'M';
        
        return tablero;
    }
    
    private int situarMosca() {
        return (int) (Math.random() * this.length());
    }

    // prueba a hacer tu esta logica :)
    public void revolotear() {
        char aux = '-';
        int i;

        for (int j = 0; j < this.tablero.length; j++) {
            if (this.tablero[j] != '-') {
                aux = this.tablero[j];
                this.tablero[j] = '-';
            }
        }

        // no uses this.tablero.length (usa this.length() que para eso has creado el metodo :)
        i = (int) (Math.random() * this.tablero.length);
        this.tablero[i] = aux;
    }
    
    public int length(){
        return this.tablero.length;
    }
}
