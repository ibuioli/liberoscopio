public class City {
  float x,y;
  int friend;
  float vx, vy;
  int idx;
  color myc = somecolor();
  
  int numsands = 3;
  SandPainter[] sands = new SandPainter[numsands];

  City(float Dx, float Dy, float Vx, float Vy, int Idx) {
    x = Dx;
    y = Dy;
    vx = Vx;
    vy = Vy;
    idx = Idx;

    for (int n=0;n<numsands;n++) {
      sands[n] = new SandPainter();
    }
  }

  void move() {
    vx+=(cities[friend].x-x)/1000;
    vy+=(cities[friend].y-y)/1000;

    vx*=.936;
    vy*=.936;
    x+=vx;
    y+=vy;

    drawTravelers();
  }
  void findFriend() {
    friend = (idx + int(random(99/5)))%99;
  }
    
  void drawTravelers() {
    int nt = 11;
    for (int i=0;i<nt;i++) {
      t = random(TWO_PI);  
      float dx = sin(t)*(x-cities[friend].x)/2+(x+cities[friend].x)/2;
      float dy = sin(t)*(y-cities[friend].y)/2+(y+cities[friend].y)/2;
      if (random(1000)>990) {
        // noise
        dx+=random(3)-random(3);
        dy+=random(3)-random(3);
      }
      stroke(red(cities[friend].myc),green(cities[friend].myc),blue(cities[friend].myc),48);
      point(dx,dy);
      dx = -1*sin(t)*(x-cities[friend].x)/2+(x+cities[friend].x)/2;
      dy = -1*sin(t)*(y-cities[friend].y)/2+(y+cities[friend].y)/2;
      if (random(1000)>990) {
        dx+=random(3)-random(3);
        dy+=random(3)-random(3);
      }
      point(dx,dy);
     }
   }
   
  void drawSandPainters() {
    for (int s=0;s<numsands;s++) {
      sands[s].render(x,y,cities[friend].x,cities[friend].y);
    }
  }
}

float citydistance(int a, int b) {
  if (a!=b) {
    float dx = cities[b].x-cities[a].x;
    float dy = cities[b].y-cities[a].y;
    float d = sqrt(dx*dx+dy*dy);
    return d;
  } else {
    return 0.0;
  }
}

void daleArena() {
  float vt = 4.2;
  float vvt = 0.2;
  float ot = random(TWO_PI);
  for (int t=0;t<99;t++) {
    float tinc = ot+(1.1-t/99)*2*t*TWO_PI/99;
    float vx = vt*sin(tinc);
    float vy = vt*cos(tinc);
    cities[t] = new City(dimx/2+vx*30,dimx/2.2+vy*35,vx,vy,t);
    vvt-=0.00033;
    vt+=vvt;
  }
  
  for (int t=0;t<99;t++) {
    cities[t].findFriend();
  }
}
