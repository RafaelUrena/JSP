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

    public char[] generarTablero() {
        for (int i = 0; i < this.tablero.length; i++) {
            this.tablero[i] = 'o';
        }
        
        return this.tablero;
        
//        this.tablero[(int) (Math.random() * this.tablero.length)] = '*';
    }

    // no se para que es esto ...
    public void revolotear() {
        char aux = '-';
        int i;

        for (int j = 0; j < this.tablero.length; j++) {
            if (this.tablero[j] != '-') {
                aux = this.tablero[j];
                this.tablero[j] = '-';
            }
        }

        i = (int) (Math.random() * this.tablero.length);
        this.tablero[i] = aux;
    }

    public void queHaPasado() {    

    }
    
    public void mostrar(){
        for (int i = 0; i < this.tablero.length; i++) {
            System.out.print(this.tablero[i]);
        }
    }
    
    public int length(){
        return this.tablero.length;
    }
}
