public class Cortazar {
  /*Strings*/
  String lasbuenas = "Una noche un turista venezolano se anima a preguntarle a Gómez por qué ha comprado solamente un metro cuadrado de tierra y para qué puede servir esa tierra, aparte de colocar la reposera, en tanto el turista venezolano como los otros estupefactos contertulios, escuchan esta respuesta: Usted parece ignorar que la propiedad de un terreno se extiende desde de la superficie hasta el centro de la tierra: ¡Calcule entonces!.- Nadie calcula, pero todos tienen la visión de un pozo cuadrado que baja, baja y baja hasta no se sabe dónde y de alguna manera eso parece más importante que cuando se tienen trece hectáreas y se tiene que imaginar un agujero de semejante superficie que baje, baje y baje.";
  String cruz = "Y extraño las esquinas con almacenes dormilones donde el perfume de la yerba tiembla en la piel del aire. Extraño tu voz, tu caminar conmigo por la ciudad. Comprender que eso está siempre allá como un bolsillo donde a cada rato la mano busca una moneda, el peine, llaves, la mano infatigable de una oscura memoria que recuenta sus muertos.\nLa Cruz del Sur, el mate amargo y las voces de amigos usándose con otros. Me duele un tiempo amargo lleno de perros y desgracia la agazapada convicción de que volver es vano.\nComprender que un mar es más que un mar, que la muerte se viste de distancia para llegar de a poco, lenta, interminable, como una melodía que se resuelve al fin en humo de silencio.";

  /*Booleanas*/
  boolean d, c;
  boolean inicia;

  /*Control*/
  float amp, frec;
  int alpha, cont, regula;
  byte azar;

  Cortazar() {
    background(255);

    cities = new City[maxnum];
    discs = new Disc[120];

    ///////////////////////////

    azar = (byte)random(0, 2);
  }

  void texto() {
    takecolor("cortazar.gif");
    if (azar == 0) {
      d = true;
      c = false;
    } else if (azar == 1) {
      c = true;
      d = false;
    }

    amp = amp_;
    frec = frec_;
    if (amp < 1) {
      amp = 0;
    }

    if (amp < 20) {
      cont++;
      if (cont > 60) {
        alpha+=2;
      }
    } else {
      cont = 0;
      alpha = 0;
    }

    textFont(elite);
    pushStyle();
    noStroke();
    fill(255);
    rect(0, 0, width/2, height);
    popStyle();

    fill(0);

    if (d) {
      textSize(16);
      textAlign(LEFT);
      text(lasbuenas, 20, 20, 350, height);
      /*Firma*/
      text("\"Las Buenas Inversiones\"\nVuelta al día en ochenta Mundos,\n"+firma_cortazar, 20, height-70);
    }

    if (c) {
      textSize(16);
      textAlign(LEFT);
      text(cruz, 20, 20, 350, height);
      /*Firma*/
      text("\"La Cruz del Sur\"\nSalvo el Crepúsculo,\n"+firma_cortazar, 20, height-70);
    }
  }

  void evaluar() {
    if (frec > 46 && frec < 70) {
      if (amp > 5) {
        regula++;
      }
    }
    if (amp > 5) {
      if (d && regula == 10) {
        daleArena();
        inicia = true;
      } else if (c && regula == 10) {
        daleDisco();
        inicia = true;
      }
    }
    if (alpha > 255) {
      regula = 0;
      inicia = false;
    }

    if (npagina == true) {
      azar++;
      alpha = 256;
      if (azar >= 2) {
        azar = 0;
      }
    }
  }

  void mover() {
    if (d && inicia == true) {
      for (int c=0; c<99; c++) {
        pushMatrix();
        translate(400, 200);
        cities[c].move();
        popMatrix();
      }
    }

    if (c && inicia == true) {
      for (int c=0; c<120; c++) {
        pushMatrix();
        translate(430, 0);
        discs[c].move();
        discs[c].render();
        popMatrix();
      }
    }

    image(mascara, width/2, 0);

    pushStyle();
    fill(255, alpha);
    noStroke();
    rect(width/2, 0, width/2, height);
    popStyle();
  }
}

