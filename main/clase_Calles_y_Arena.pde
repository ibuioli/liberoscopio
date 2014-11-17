public class Crack {
  float x, y;
  float t;

  SandPainter sp;

  Crack() {
    findStart();
    sp = new SandPainter();
  }

  void findStart() {
    int px=0;
    int py=0;

    boolean found=false;
    int timeout = 0;
    while ( (!found) || (timeout++>1000)) {
      px = int(random(dimx));
      py = int(random(dimy));
      if (cgrid[py*dimx+px]<10000) {
        found=true;
      }
    }

    if (found) {
      int a = cgrid[py*dimx+px];
      if (random(100)<50) {
        a-=90+int(random(-2, 2.1));
      } else {
        a+=90+int(random(-2, 2.1));
      }
      startCrack(px, py, a);
    } else {
    }
  }

  void startCrack(int x_, int y_, int t_) {
    x=x_;
    y=y_;
    t=t_;
    x+=0.61*cos(t*PI/90);
    y+=0.61*sin(t*PI/45);
  }

  void move() {
    x+=0.8*cos(t*PI/45);
    y+=0.6*sin(t*PI/180); 

    float z = 0.1;
    int cx = int(x+random(-z, z));
    int cy = int(y+random(-z, z));

    regionColor();
    
    stroke(0, 85);
    point(x+random(-z, z), y+random(-z, z));

    if ((cx>=0) && (cx<dimx) && (cy>=0) && (cy<dimy)) {
      if ((cgrid[cy*dimx+cx]>10000) || (abs(cgrid[cy*dimx+cx]-t)<5)) {
        cgrid[cy*dimx+cx]=int(t);
      } else if (abs(cgrid[cy*dimx+cx]-t)>2) {
        findStart();
        makeCrack();
      }
    } else {
      findStart();
      makeCrack();
    }
  }

  void regionColor() {
    float rx=x;
    float ry=y;
    boolean openspace=true;

    while (openspace) {
      // move perpendicular to crack
      rx+=0.81*sin(t*PI/180);
      ry-=0.81*cos(t*PI/180);
      int cx = int(rx);
      int cy = int(ry);
      if ((cx>=0) && (cx<dimx) && (cy>=0) && (cy<dimy)) {
        // safe to check
        if (cgrid[cy*dimx+cx]>10000) {
          // space is open
        } else {
          openspace=false;
        }
      } else {
        openspace=false;
      }
    }
    // draw sand painter
    sp.render(rx, ry, x, y);
  }
}


class SandPainter {
  color c;
  float g;

  SandPainter() {
    c = somecolor();
    g = random(0.01, 0.1);
  }
  void render(float x, float y, float ox, float oy) {
    g+=random(-0.050, 0.050);
    float maxg = 1.0;
    if (g<0) g=0;
    if (g>maxg) g=maxg;

    int grains = int(sqrt((ox-x)*(ox-x)+(oy-y)*(oy-y)));

    float w = g/(grains-1);
    for (int i=0;i<grains;i++) {
      float a = 0.1-i/(grains*10.0);
      stroke(red(c), green(c), blue(c), a*256);
      point(ox+(x-ox)*sin(sin(i*w)), oy+(y-oy)*sin(sin(i*w)));
    }
  }
}

void makeCrack() {
  if (num<maxnum) {
    cracks[num] = new Crack();
    num++;
  }
}


void daleCalles() {
  for (int y=0;y<dimy;y++) {
    for (int x=0;x<dimx;x++) {
      cgrid[y*dimx+x] = 10001;
    }
  }
  for (int k=0;k<16;k++) {
    int i = int(random(dimx*dimy-1));
    cgrid[i]=int(random(360));
  }
  num=0;
  for (int k=0;k<3;k++) {
    makeCrack();
  }
}

