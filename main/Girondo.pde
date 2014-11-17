public class Girondo {
  /*Strings*/
  String nosenada = "Yo  no  sé  nada\nTú no sabes nada\nUd. no sabe nada\nÉl  no  sabe  nada\nEllos no saben nada\nEllas no saben nada\nUds. no saben nada\nNosotros no sabemos nada.\nLa desorientación de mi generación tiene su expli-\ncación en la dirección de nuestra educación, cuya\nidealización de la acción, era —¡sin discusión!—\nuna mistificación, en contradicción\ncon nuestra propensión a la me-\nditación, a la contemplación y\na la masturbación. (Gutural,\nlo más guturalmente que\nse pueda.)   Creo que\ncreo en  lo que  creo\nque no creo. Y creo\nque  no creo  en  lo\nque creo que creo.";
  String doce = "Se miran, se presienten, se desean,\nse acarician, se besan, se desnudan, \nse respiran, se acuestan, se olfatean, \nse penetran, se chupan, se demudan, \nse adormecen, despiertan, se iluminan, \nse codician, se palpan, se fascinan, \nse mastican, se gustan, se babean,\nse confunden, se acoplan, se disgregan, \nse aletargan, fallecen, se reintegran, \nse distienden, se enarcan, se menean, \nse retuercen, se estiran, se caldean, \nse estrangunlan, se aprietan, se estremecen, \nse tantean, se juntan, desfallecen, \nse repelen, se enervan, se apetecen, \nse acometen, se enlazan, se entrechocan, \nse agazapan, se apresan, se dislocan, \nse perforan, se incrustan, se acribillan, \nse remachan, se injertan, se atornillan, \nse desmayan, reviven, resplandecen, \nse contemplan, se inflaman, se enloquecen, \nse derriten, se sueldan, se calcinan, \nse desgarran, se muerden, se asesinan, \nresucitan, se buscan, se refriegan, \nse rehúyen, se evaden y se entregan.";

  /*Booleanas*/
  boolean d, c;
  boolean inicia;

  /*Control*/
  float amp, frec;
  int alpha, cont, regula;
  byte azar;

  Girondo() {
    background(255);

    orbitals = new Orbital[200];
    friends = new Friend[70];

    ///////////////////////////

    azar = (byte)random(0, 2);
  }

  void texto() {
    takecolor("girondo.gif");
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
      textSize(14);
      textLeading(20);
      textAlign(CENTER);
      text(nosenada, 5, 40, 400, height);
      /*Firma*/
      textAlign(LEFT);
      textSize(16);
      text("\"Yo no sé Nada\"\nEspantapájaros (Al alcance de Todos),\n"+firma_girondo, 20, height-70);
    }
    if (c) {
      textSize(15);
      textLeading(20);
      textAlign(LEFT);
      text(doce, 20, 20, 400, height);
      /*Firma*/
      textSize(16);
      text("\"Poema XII\"\nEspantapájaros (Al alcance de Todos),\n"+firma_girondo, 20, height-70);
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
        daleAleph();
        inicia = true;
      } else if (c && regula == 10) {
        daleTunel();
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

    if (c && inicia == true) {
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

    image(mascara, width/2, 0);

    pushStyle();
    fill(255, alpha);
    noStroke();
    rect(width/2, 0, width/2, height);
    popStyle();
  }
}

