/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author rafa
 */
public class Tablero {

    private char tab[];

    public Tablero() {
        this.tab = new char[5];
    }

    public Tablero(int tam) {
        this.tab = new char[tam];
    }

    public void generarTablero() {

        for (int i = 0; i < this.tab.length; i++) {
            this.tab[i] = '-';
        }
        this.tab[(int) (Math.random() * this.tab.length)] = '*';
    }

    public void revolotear() {
        char aux = '-';
        int i;

        for (int j = 0; j < this.tab.length; j++) {
            if (this.tab[j] != '-') {
                aux = this.tab[j];
                this.tab[j] = '-';
            }
        }
        i = (int) (Math.random() * this.tab.length);
        this.tab[i] = aux;

    }

    public void queHaPasado() {
        

    }
    
    public void mostrar(){
        for (int i = 0; i < this.tab.length; i++) {
            System.out.print(this.tab[i]);
        }
    }
    
    public int length(){
        
        return this.tab.length;
    }
}
