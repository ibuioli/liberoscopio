public class Sabato {
  /*Strings*/
  String eltunel = "\"¿En la oficina?\", me pregunté de pronto en voz alta, casi a gritos, sintiendo que las piernas se me aflojaban de nuevo. ¿Y quién me había dicho que trabajaba en esa oficina? ¿Acaso sólo entra en una oficina la gente que trabaja allí? La idea de perderla por varios meses más, o quizá para siempre, me produjo un vértigo y ya sin reflexionar sobre las conveniencias corrí como un desesperado; pronto me encontré en la puerta de la Compañía T. y ella no se veía por ningún lado.¿Habría tomado ya el ascensor? Pensé interrogar al ascensorista, pero ¿cómo preguntarle? Podían haber subido ya muchas mujeres y tendría entonces que especificar detalles: ¿qué pensaría el ascensorista? Caminé un rato por la vereda, indeciso. Luego crucé a la otra vereda y examiné el frente del edificio, no comprendo por qué. ¿Quizá con la vaga esperanza de ver asomarse a la muchacha por una ventana?.";
  String rostros = "-Tomá- le dijo a Martín -, llevala, que en seguida voy con el mate.\nEl muchacho llevó las sillas, las puso al lado del viejo, se sentó con timidez y esperó.\n-Eh, sí...- murmuró el cochero-, así con la cosa...\n-Eh, sí...- repitió el viejo, meneando la cabeza, como si asintiera a un interlocutor invisible. Y de pronto, dijo:\n-Yo era chiquito como ése que tiene la pelota y mi padre cantaba. Quando la tromba sonaba alarma co Garibaldi doviamo partí.\nSe rió, asintió varias veces con la cabeza y repitió \"eh, sí...\" \nLa pelota vino hacia ellos y casi le pega al viejo. Don Francisco amenazó distraídamente con el bastón nudoso, mientras los chicos llegaban corriendo, recogían la pelota y se retiraban haciéndole morisquetas.";

  /*Booleanas*/
  boolean d, c;
  boolean inicia;

  /*Control*/
  float amp, frec;
  int alpha, cont, regula;
  byte azar;

  Sabato() {
    background(255);

    friends = new Friend[70];
    discs = new Disc[120];

    ///////////////////////////

    azar = (byte)random(0, 2);
  }

  void texto() {
    takecolor("sabato.gif");
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
      textSize(15);
      textAlign(LEFT);
      text(eltunel, 20, 20, 350, height);
      /*Firma*/
      textSize(16);
      text("\"El Túnel\"\nEl Túnel,\n"+firma_sabato, 20, height-70);
    }
    if (c) {
      textSize(15);
      textAlign(LEFT);
      text(rostros, 20, 20, 350, height);
      /*Firma*/
      textSize(16);
      text("\"Los Rostros Invisibles\"\nSobre Héroes y Tumbas,\n"+firma_sabato, 20, height-70);
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
        daleTunel();
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
      pushMatrix();
      translate(400, 100);
      for (int c=0; c<70; c++) {
        friends[c].move();
      }
      for (int c=0; c<70; c++) {
        friends[c].expose();
        friends[c].exposeConnections();
      }
      for (int c=0; c<70; c++) {
        friends[c].findHappyPlace();
      }
      popMatrix();
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

