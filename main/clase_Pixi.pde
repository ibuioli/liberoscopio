public class Pixi {
  int x;
  int y;
  float destx, desty;
  float xp, yp;
  float vx, vy;
  int idx;
  color myc = somecolor();

  Pixi(int Dx, int Dy, int Idx) {
    xp = Dx;
    yp = Dy;
    x = Dx;
    y = Dy;
    idx = Idx;

    destx = int(random(10))*40+40/2;
    desty = int(random(10))*40+40/2;
  }

  void draw() {
    stroke(255,136);
    point(x,y);
  }
  void move() {
    vx+=(destx-xp)/1500;
    vy+=(desty-yp)/2000;

    xp+=vx;
    yp+=vy;
    
    x = int(xp);
    y = int(yp);

    draw();
  }
}

void dalePixi(){
  int i=0;
  for (int x=0;x<10;x++) {
    for (int y=0;y<10;y++) {
      citios[i] = new Pixi(int(x*40+40/2),int(y*40+40/2),i);
      i++;
    }
  }
}
