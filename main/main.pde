/*************************************/
// Liberoscopio                      //
// Processing v 2.2.1                //
//                                   //
// Librerias:                        //
// oscP5                             //
/*************************************/

import oscP5.*;
import netP5.*;
//import com.getflourish.stt.*;

//Objetos
String texto;
//String api_1 = "AIzaSyAn9rFcjijRzK_d3bMdCHx7dDhYyrmVPvI";
PFont elite;
PImage mascara;
//STT stt1;
//Indice indice;
OscP5 oscP5;

/*String Firmas*/
String firma_borges = "Jorge Luis Borges";
String firma_girondo = "Oliverio Girondo";
String firma_dolina = "Alejandro Dolina";
String firma_cortazar = "Julio Cortázar";
String firma_sabato = "Ernesto Sábato";

char autor;

//Detectar Movimiento
PImage prevFrame;
PVector boton;
int contador = 100;
int cuentapagina, inactividad;
boolean inicio, paginas, npagina;

//Palabra
float frec_, amp_, mov_;

//Páginas
Borges pagina_borges;
Cortazar pagina_cortazar;
Dolina pagina_dolina;
Girondo pagina_girondo;
Sabato pagina_sabato;

float sen = 0;
float t, dx, dy;
int dimx = 400;
int dimy = 600;
int maxnum = 100;
int maxpal = 512;
int numpal = 0;
int mind = 128;
int num = 0;
int a, b;

byte nazar;

int[] cgrid;
Crack[] cracks;
Orbital[] orbitals;
City[] cities;
Friend[] friends;
Disc[] discs;
Pixi[] citios;
SandPainter[] sands;

color[] goodcolor = new color[512];

public void setup () {
  size(800, 600, P3D);
  frame.setBackground(new java.awt.Color(0, 0, 0));
  
  smooth(1);

  //Conexión OSC
  oscP5 = new OscP5(this, 12000);

  //Configuración STT del API 1
  //stt1 = new STT(this, api_1);
  //stt1.setLanguage("es");
  //stt1.disableHistory();

  //Configuración Global
  noCursor();

  //Configuración Indice
  //indice = new Indice();

  //Configuración Páginas
  pagina_borges = new Borges();
  pagina_cortazar = new Cortazar();
  pagina_dolina = new Dolina();
  pagina_girondo = new Girondo();
  pagina_sabato = new Sabato();

  inactividad = 0;

  mascara = loadImage("mascara.png");

  //Configuración de Texto
  elite = createFont("SmallTypeWriting-Medium", 24);
  texto = " ";

  nazar = (byte)random(1, 6);
}

public void draw () {
  
  switch(nazar) {
  case 1:
    autor = 'b';
    break;
  case 2:
    autor = 'c';
    break;
  case 3:
    autor = 'd';
    break;
  case 4:
    autor = 'g';
    break;
  case 5:
    autor = 's';
    break;
  }

  ////////////////////////////////////////////////////////////////

  if (paginas == false) {
    //stt1.enableAutoRecord(80);
    //indice.fondo();
    //indice.lista();
    //indice.evaluar();
    //indice.mover();
  } else {

    //stt1.disableAutoRecord();

    if (autor == 'b') {
      pagina_borges.texto();
      pagina_borges.evaluar();
      pagina_borges.mover();
    }
    if (autor == 'c') {
      pagina_cortazar.texto();
      pagina_cortazar.evaluar();
      pagina_cortazar.mover();
    }
    if (autor == 'd') {
      pagina_dolina.texto();
      pagina_dolina.evaluar();
      pagina_dolina.mover();
    }
    if (autor == 'g') {
      pagina_girondo.texto();
      pagina_girondo.evaluar();
      pagina_girondo.mover();
    }
    if (autor == 's') {
      pagina_sabato.texto();
      pagina_sabato.evaluar();
      pagina_sabato.mover();
    }

    /*if (indice.borges == true) {
     pagina_borges.texto();
     pagina_borges.evaluar();
     pagina_borges.mover();
     }
     if (indice.cortazar == true) {
     pagina_cortazar.texto();
     pagina_cortazar.evaluar();
     pagina_cortazar.mover();
     }
     if (indice.dolina == true) {
     pagina_dolina.texto();
     pagina_dolina.evaluar();
     pagina_dolina.mover();
     }
     if (indice.girondo == true) {
     pagina_girondo.texto();
     pagina_girondo.evaluar();
     pagina_girondo.mover();
     }
     if (indice.sabato == true) {
     pagina_sabato.texto();
     pagina_sabato.evaluar();
     pagina_sabato.mover();
     }*/
  }

  ////////////////////////////////////////////////////////////////

  if (autor == 'b' || autor == 'c' || autor == 'd' || autor == 'g' || autor == 's') {
    if (mov_ > 0.64) {
      if (inicio == false) {
        inicio = true;
      }
    }

    if (inicio == true) {
      contador--;
      paginas = true;
      if (contador <= 0) {
        inicio = false;
        contador = 100;
      }
    }

    if (contador == 99 && paginas == true) {
      nazar = (byte)random(1, 6);
    }

    /*if (indice.borges == true || indice.cortazar == true || 
     indice.dolina == true || indice.girondo == true || 
     indice.sabato == true) {
     
     if (mov_ > 0.64) {
      if (inicio == false) {
        inicio = true;
      }
    }
     
     if (inicio == true) {
     contador--;
     paginas = true;
     if (contador <= 0) {
     inicio = false;
     contador = 100;
     }
     }
     
     if (contador == 99 && paginas == true) {
     npagina=true;
     }
     else {
     npagina=false;
     }*/
  }
  
  //resetAr();  //¿Tiempo sin Interacción? ¡Devuelta al Setup!
}

void keyPressed() {
 // paginas = false;
 setup();

  /*indice.borges = false;
  indice.cortazar = false;
  indice.dolina = false;
  indice.girondo = false;
  indice.sabato = false;*/
}

