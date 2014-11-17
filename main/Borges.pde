public class Borges {
  /*Strings*/
  String texto = " ";
  String elaleph1 = "¿Cómo transmitir a los otros el infinito Aleph, que mi temerosa memoria apenas abarca? Los místicos, en análogo trance, prodigan los emblemas: para significar la divinidad, un persa habla de un pájaro que de algún modo es todos los pájaros; Alanus de Insulis, de una esfera cuyo centro está en todas partes y la circunferencia en ninguna; Ezequiel, de un ángel de cuatro caras que a un tiempo se dirige al Oriente y al Occidente, al Norte y al Sur. (No en vano rememoro esas inconcebibles analogías; alguna relación tienen con el Aleph.)";
  String lascalles = "Las calles de Buenos Aires ya son mi entraña. No las ávidas calles, incómodas de turba y de ajetreo, sino las calles desganadas del barrio, casi invisibles de habituales, enternecidas de penumbra y de ocaso y aquellas más afuera ajenas de árboles piadosos donde austeras casitas apenas se aventuran, abrumadas por inmortales distancias, a perderse en la honda visión de cielo y de llanura.";
  String librodearena = "Las páginas, que me parecieron gastadas y de pobre tipografía, estaban impresas a dos columnas a la manera de una biblia. El texto era apretado y estaba ordenado en versículos.\n En el ángulo superior de las páginas había cifras arábigas. Llevaba una pequeña ilustración, como es de uso en los diccionarios: un ancla dibujada a la pluma, como por la torpe mano de un niño. Fue entonces que el desconocido me dijo: \n—Mírela bien. Ya no la verá nunca más. \nHabía una amenaza en la afirmación, pero no en la voz. \nMe fijé en el lugar y cerré el volumen. Inmediatamente lo abrí. En vano busqué la figura del ancla, hoja tras hoja. Para ocultar mi desconcierto, le dije:\n—Se trata de una versión de la Escritura en alguna lengua indostánica, ¿no es verdad?\n—No —me replicó.";

  /*Booleanas*/
  boolean g;
  boolean d;
  boolean cor;
  boolean inicia;

  /*Control*/
  float amp, frec;
  int alpha, cont, regula;
  byte azar;

  Borges() {
    background(255);

    orbitals = new Orbital[200];

    cgrid = new int[dimx*dimy];
    cracks = new Crack[maxnum];

    cities = new City[maxnum];

    ///////////////////////////

    azar = (byte)random(3);
  }

  void texto() {
    takecolor("borges.gif");

    if (azar == 0) {
      g = true;
      d = false;
      cor = false;
    } else if (azar == 1) {
      d = true;
      cor = false;
      g = false;
    } else if (azar == 2) {
      cor = true;
      g = false;
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

    if (g) {      
      textSize(16);
      textAlign(LEFT);
      text(elaleph1, 20, 40, 350, height);
      /*Firma*/
      textAlign(LEFT);
      text("\"El Aleph\"\nEl Aleph,\n"+firma_borges, 20, height-70);
    }

    if (d) {
      textSize(16);
      textAlign(LEFT);
      text(lascalles, 20, 40, 350, height);
      /*Firma*/
      text("\"Las Calles\"\nFervor de Buenos Aires,\n"+firma_borges, 20, height-70);
    }

    if (cor) {
      textSize(15);
      textAlign(LEFT);
      text(librodearena, 20, 20, 350, height);
      /*Firma*/
      text("\"El libro de Arena\"\nEl libro de Arena,\n"+firma_borges, 20, height-70);
    }
  }

  void evaluar() {
    if (frec > 46 && frec < 70) {
      if (amp > 5) {
        regula++;
      }
    }
    if (amp > 5) {
      if (g && regula == 10) {
        daleAleph();
        inicia = true;
      } else if (d && regula == 10) {
        daleCalles();
        inicia = true;
      } else if (cor && regula == 10) {
        daleArena();
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
      if (azar >= 3) {
        azar = 0;
      }
    }
  }

  void mover() {
    if (g && inicia == true) {
      for (int k=0; k<20; k++) {
        for (int n=0; n<200; n++) {
          orbitals[n].orbit();
        }
        for (int n=0; n<200; n++) {
          pushMatrix();
          translate(200, 0);
          orbitals[n].draw();
          popMatrix();
        }
      }
    }

    if (d && inicia == true) {
      for (int n=0; n<num; n++) {
        pushMatrix();
        translate(400, 0);
        cracks[n].move();
        popMatrix();
      }
    }

    if (cor && inicia == true) {
      for (int c=0; c<99; c++) {
        pushMatrix();
        translate(400, 200);
        cities[c].move();
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

