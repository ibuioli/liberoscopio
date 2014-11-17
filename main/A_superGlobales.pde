/*public void transcribe (String utterance, float confidence) {
  texto = utterance;
}*/

public color somecolor() {
  return goodcolor[int(random(numpal))];
}

public void takecolor(String fn) {
  PImage b;
  b = loadImage(fn);
  image(b, 0, 0);

  for (int x=0;x<b.width;x++) {
    for (int y=0;y<b.height;y++) {
      color c = get(x, y);
      boolean exists = false;
      for (int n=0;n<numpal;n++) {
        if (c==goodcolor[n]) {
          exists = true;
          break;
        }
      }
      if (!exists) {
        if (numpal < 512) {
          goodcolor[numpal] = c;
          numpal++;
        }
      }
    }
  }
}

public void oscEvent(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/fre")) {

    if (theOscMessage.checkTypetag("f")) {
      frec_ = theOscMessage.get(0).floatValue();
    }
  }
  else if (theOscMessage.checkAddrPattern("/amp")) {

    if (theOscMessage.checkTypetag("f")) {
      amp_ = theOscMessage.get(0).floatValue();
    }
  }
  else if (theOscMessage.checkAddrPattern("/mov")) {

    if (theOscMessage.checkTypetag("f")) {
      mov_ = theOscMessage.get(0).floatValue();
    }
  }
}

public void resetAr() {
  if(amp_ < 30){
    inactividad++;
  }else{
    inactividad = 0;
  }
  
  if(inactividad > 800){
    setup();
  }
}

public void stop() {
  //stt1.end();
  super.stop();
}

