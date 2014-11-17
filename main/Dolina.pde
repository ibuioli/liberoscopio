public class Dolina {
  /*Strings*/
  String lacalle = "Como bien lo sabemos, la cuadra del Ángel Gris está en la calle Artigas entre Bogota y Bacacay. Sucede allí algo muy particular: en una de las veredas no es posible ser bueno. En la otra es imposible ser malo. Una noche pasé con una muchacha rubia por la vereda oeste. La arrinconé en un umbral oscuro, la besé con pasión y logré poseerla allí mismo. Después cruzamos la calle. Y mientras caminábamos por la vereda oriental, le pedí que me olvidara y la abandoné para siempre. En la cuadra del Ángel Gris hay dos veredas. En una no es posible ser bueno, en la otra no se puede ser malo. Aún no tengo decidido cual es cual. ";
  String novias = "Hay una calle en Flores en la que viven todas las novias abandonadas. Al atardecer salen a la vereda y miran ansiosas hacia las esquinas para ver si vuelven los novios que se fueron. A veces conversan entre ellas y rememoran viejos paseos por el Rosedal. Dicen que no es posible encontrar esa calle. Pero se sabe que algún día desembocará en la esquina el batallón de los novios vencedores de la muerte para rescatar a las novias perdidas y llevarlas de paseo al Rosedal. Existen por ahí infinidad de personas confiables que juran que el amor es posible en todos los barrios. Pero el que tuviera que vivir pasiones locas, es mejor que no pierda el tiempo en rumbos equivocados. Una historia terrible está esperando en Flores.";

  /*Booleanas*/
  boolean d, c;
  boolean inicia;

  /*Control*/
  float amp, frec;
  int alpha, cont, regula;
  byte azar;

  Dolina() {
    background(255);

    cgrid = new int[dimx*dimy];
    cracks = new Crack[maxnum];

    citios = new Pixi[100];

    ///////////////////////////

    azar = (byte)random(0, 2);
  }

  void texto() {
    takecolor("dolina.gif");
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
      text(lacalle, 20, 20, 350, height);
      /*Firma*/
      text("\"La Calle del Bien y el Mal\"\nCrónicas del Ángel Grís,\n"+firma_dolina, 20, height-70);
    }
    if (c) {
      textSize(16);
      textAlign(LEFT);
      text(novias, 20, 20, 350, height);
      /*Firma*/
      text("\"La Calle de las Novias Perdidas\"\nCrónicas del Ángel Grís,\n"+firma_dolina, 20, height-70);
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
        daleCalles();
        inicia = true;
      } else if (c && regula == 10) {
        dalePixi();
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
      for (int n=0; n<num; n++) {
        pushMatrix();
        translate(400, 0);
        cracks[n].move();
        popMatrix();
      }
    }

    if (c && inicia == true) {
      pushMatrix();
      translate(400, 100);
      for (int n=0; n<4000; ) {
        a = int(floor(random(100)));
        b = int(floor(random(100)));
        if ((a>=100) || (b>=100)) {
        } else if (a!=b) {
          if (citydistance(a, b)<100) {
            t = random(PI);
            dx = sin(t)*(citios[b].x-citios[a].x)+citios[a].x;
            dy = sin(t)*(citios[b].y-citios[a].y)+citios[a].y;
            if (random(1000)>990) {
              dx += random(-1.5, 1.5);
              dy += random(-1.5, 1.5);
            }
            stroke(red(citios[b].myc), green(citios[b].myc), blue(citios[b].myc), 44);
            point(dx, dy);
            stroke(red(citios[a].myc), green(citios[a].myc), blue(citios[a].myc), 44);
            point(dx, dy);
            n++;
          }
        }
      }
      for (int c=0; c< (100); c++) {
        citios[c].move();
      }
      popMatrix();
    }

    image(mascara, width/2, 0);

    pushStyle();
    fill(255, alpha);
    noStroke();
    rect(width/2, 0, width/2, height);
    popStyle();
  }

  float citydistance(int a, int b) {
    if (a!=b) {
      float Dx = citios[b].x-citios[a].x;
      float Dy = citios[b].y-citios[a].y;
      float D = sqrt(Dx*Dx+Dy*Dy);
      return D;
    } else {
      return 0.0;
    }
  }
}

