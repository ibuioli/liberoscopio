public class Friend {
  float x, y;
  float dx, dy;
  float vx, vy;
  int id;

  int numcon;
  int maxcon = 10;
  int lencon = 10+int(random(50));
  int[] connections = new int[maxcon];

  // sand painters
  int numsands = 3;
  SandLine[] sands = new SandLine[numsands];

  color myc = somecolor();

  Friend(float X, float Y ,int Id) {
    dx = x = X;
    dy = y = Y;
    id = Id;

    numcon = 0;

    for (int n=0;n<numsands;n++) {
      sands[n] = new SandLine();
    }
  }

  void expose() {
    for (int dx=-2;dx<3;dx++) {
      float a = 0.5-abs(dx)/5.0;
      stroke(0,256*a);
      point(x+dx,y);
      stroke(255,256*a);
      point(x+dx-1,y-1);
    }
    for (int dy=-2;dy<3;dy++) {
      float a = 0.5-abs(dy)/5.0;
      stroke(0,256*a);
      point(x,y+dy);
      stroke(255,256*a);
      point(x-1,y+dy-1);
    }
  }

  void exposeConnections() {
    for (int n=0;n<numcon;n++) {
      float ox = friends[connections[n]].x;
      float oy = friends[connections[n]].y;

      for (int s=0;s<numsands;s++) {
        sands[s].render(x,y,ox,oy);
      }
    }
  }

  void render() {
    for(int xx=int(x-numcon);xx<int(x+numcon);xx++) {
      for(int yy=int(y-numcon);yy<int(y+numcon);yy++) {
        stroke(myc);
        point(xx,yy);
      }
    }
  }
  
  void renderConnections() {
    for (int n=0;n<numcon;n++) {
      float ddx = friends[connections[n]].x-x;
      float ddy = friends[connections[n]].y-y;
      int m = int(1 + sqrt(ddx*ddx+ddy*ddy)/6);
      for (int k=0;k<m;k++) {
        float t = (1 + cos(k*PI/m))/2;
        int px = int(x + t*ddx);
        int py = int(y + t*ddy);
        stroke(#333333);
        point(px,py);
      }
    }  
  }


  void move() {
    x+=vx;
    y+=vy;

    vx*=0.92;
    vy*=0.92;
  }

  void connectTo(int f) {
    if (numcon<maxcon) {
      if (!friendOf(f)) {
        connections[numcon] = f;
        numcon++;
      }
    }
  }

  boolean friendOf(int x) {
    boolean isFriend = false;
    for (int n=0;n<numcon;n++) {
      if (connections[n]==x) isFriend=true;
    }
    return isFriend;
  }

  void findHappyPlace() {
    float ax = 0.0;
    float ay = 0.0;

    for (int n=0;n<70;n++) {
      if (friends[n]!=this) {
        float ddx = friends[n].x-x;
        float ddy = friends[n].y-y;
        float d = sqrt(ddx*ddx + ddy*ddy);
        float t = atan2(ddy,ddx);

        boolean friend = false;
        for (int j=0;j<numcon;j++) if (connections[j]==n) friend=true;
        if (friend) {
          if (d>lencon) {
            ax += 4.0*cos(t);
            ay += 4.0*sin(t);
          }
        } else {
          if (d<lencon) {
            ax += (lencon-d)*cos(t+PI);
            ay += (lencon-d)*sin(t+PI);
          }
        }
      }
    }

    vx+=ax/42.22;
    vy+=ay/42.22;
  }
}

class SandLine {
  float p;
  color c;
  float g;

  SandLine() {
    p = random(1.0);
    c = somecolor();
    g = random(0.01,0.1);
  }

  void render(float x, float y, float ox, float oy) {
    g+=random(-0.050,0.050);
    float maxg = 0.22;
    if (g<-maxg) g=-maxg;
    if (g>maxg) g=maxg;
    p+=random(-0.050,0.050);
    if (p<0) p=0;
    if (p>1.0) p=1.0;

    float w = g/10.0;
    for (int i=0;i<11;i++) {
      float a = 0.1-i/110;
      stroke(red(c),green(c),blue(c),256*a);
      point(ox+(x-ox)*sin(p + sin(i*w)),oy+(y-oy)*sin(p + sin(i*w)));
      point(ox+(x-ox)*sin(p - sin(i*w)),oy+(y-oy)*sin(p - sin(i*w)));
    }
  }
}

void daleTunel() {
  for (int x=0;x<70;x++) {
    float fx = 400/2 + 0.4*400*cos(TWO_PI*x/70);
    float fy = 400/2 + 0.4*400*sin(TWO_PI*x/70);
    friends[x] = new Friend(fx,fy,x);
  }

  for (int k=0;k<70*2.2;k++) {
    int a = int(floor(random(70)));
    int b = int(floor(a+random(22))%70);
    if (b>=70) {
      b=0;
      print("+");
    } else if (b<0) {
      b=0;
      print("+");
    }
    if (a!=b) {
      friends[a].connectTo(b);
      friends[b].connectTo(a);
    }
  }
}
