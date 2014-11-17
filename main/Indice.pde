/*public class Indice {
  String indice = " ";
  int x = width/2 + 35;
  int y = 0;
  int b, c, d, g, s;

  float frec, amp;

  boolean borges, cortazar, dolina, girondo, sabato, nada;
  boolean record, seMueve;

  void fondo() {
    background(255);
    pushStyle();
    fill(0);
    rect(0, 0, width/2, height);
    popStyle();
  }

  void lista() {
    textFont(elite);

    if (control > 500) {
      fill(255);
    } else {
      fill(0);
    }

    textSize(30);
    text("Índice", width/2+150, 140);

    pushMatrix();
    translate(0, 210);
    textSize(18+b);
    text("Borges", x, y);

    textSize(18+c);
    text("Cortázar", x, y*0.853+60);

    textSize(18+d);
    text("Dolina", x, y*-0.5395+120);

    textSize(18+g);
    text("Girondo", x, y*0.62221+180);

    textSize(18+s);
    text("Sábato", x, y*-0.46668+240);
    popMatrix();
  }

  void evaluar() {
    indice = texto;                 //Recibe el Texto hablado
    indice = indice.toLowerCase();  //Convierte a Minúsculas para evitar errores

    println(indice);

    if (indice.equals("borges") == true || indice.equals("borge") == true || indice.equals("borja") == true || 
      indice.equals("porque") == true || indice.equals("bor") == true || indice.equals("por") == true || 
      indice.equals("boe") == true || indice.equals("jorge") == true || indice.equals("borde") == true || 
      indice.equals("barco") == true || indice.equals("bo") == true || indice.equals("bo bo") == true || 
      indice.equals("bo bo bo") == true || indice.equals("bosques") == true || indice.equals("martes") == true
      || indice.equals("vortex") == true || indice.equals("postres") == true || indice.equals("horgue") == true) { 
      borges = true;
      cortazar = false;
      dolina = false;
      girondo = false;
      sabato = false;
    } else if (indice.equals("cortázar") == true || indice.equals("cortazar") == true ||
      indice.equals("cortar") == true || indice.equals("cortas") == true || 
      indice.equals("corta") == true || indice.equals("por casa") == true) {
      borges = false;
      cortazar = true;
      dolina = false;
      girondo = false;
      sabato = false;
    } else if (indice.equals("dolina") == true || indice.equals("molina") == true || indice.equals("gallina") == true ||
      indice.equals("gallina") == true) {
      borges = false;
      cortazar = false;
      dolina = true;
      girondo = false;
      sabato = false;
    } else if (indice.equals("girondo") == true || indice.equals("don") == true || indice.equals("dondo") == true || 
      indice.equals("ando") == true || indice.equals("iron") == true || indice.equals("fondo") == true || 
      indice.equals("will hondo") == true || indice.equals("hondo") == true || indice.equals("pronto") == true ||
      indice.equals("ronda") == true || indice.equals("rondo") == true || indice.equals("tonto") == true) {
      borges = false;
      cortazar = false;
      dolina = false;
      girondo = true;
      sabato = false;
    } else if (indice.equals("sábato") == true || indice.equals("sabato") == true || indice.equals("sábado") == true ||
      indice.equals("jabato") == true || indice.equals("pato") == true) {
      borges = false;
      cortazar = false;
      dolina = false;
      girondo = false;
      sabato = true;
    } else {
      if (indice.equals(" ") == false) {
        nada = true;
      }
    }
  }

  void mover() {
    if (borges) {
      b+=2;
      c--;
      d--;
      g--;
      s--;
    } else if (cortazar) {
      b--;
      c+=2;
      d--;
      g--;
      s--;
    } else if (dolina) {
      b--;
      c--;
      d+=2;
      g--;
      s--;
    } else if (girondo) {
      b--;
      c--;
      d--;
      g+=2;
      s--;
    } else if (sabato) {
      b--;
      c--;
      d--;
      g--;
      s+=2;
    }

    if (borges == false && cortazar == false && dolina == false
      && girondo == false && sabato == false) {
      b = 0;
      c = 0;
      d = 0;
      g = 0;
      s = 0;
    }

    b = constrain(b, -4, 20);
    c = constrain(c, -4, 20);
    d = constrain(d, -4, 20);
    g = constrain(g, -4, 20);
    s = constrain(s, -4, 20);

    /////////////////////////////////////////////////////

    amp = amp_;

    if (amp < 0.1) {
      amp = 0;
    }

    /////////////////////////////////////////////////////

    if (frec > 46 && frec < 70) {
      if (amp > 10) {
        record = true;
      }
    } else {
      record = false;
    }

    if (b > 19 || c > 19 || d > 19 || g > 19 || s > 19 || nada==true) {
      if (amp < 5) {
        frec = 0;
      }
      if (amp > 10) {
        frec = frec_;
      }
    } else {
      frec = frec_;
    }

    if (record) {
      y = int(random(-8, 8));
    } else {
      y = 0;
    }
  }
}*/
