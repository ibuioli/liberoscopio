public class Disc {
  int id;
  float x, y;
  float r;
  float dr;
  float vx, vy;

  int numsands = 2;
  SandLine[] sands = new SandLine[numsands];

  Disc(int Id, float X, float Y, float Vx, float Vy, float R) {
    id=Id;
    x=X;
    y=Y;
    vx=Vx;
    vy=Vy;
    r=0;
    dr=R;

    for (int n=0;n<numsands;n++) {
      sands[n] = new SandLine();
    }
  }

  void reset(int Id, float X, float Y, float Vx, float Vy, float R) {
    id=Id;
    x=X;
    y=Y;
    vx=Vx;
    vy=Vy;
    r=0;
    dr=R;
  }

  void draw() {
    stroke(10, 50);
    noFill();
    ellipse(x, y, r, r);
  }

  void render() {
    for (int n=id+1;n<120;n++) {
      float dx = discs[n].x-x;
      float dy = discs[n].y-y;
      float d = sqrt(dx*dx+dy*dy);
      if (d<(discs[n].r+r)) {
        if (d>abs(discs[n].r-r)) {
          float a = (r*r - discs[n].r*discs[n].r + d*d ) / (2*d);

          float p2x = x + a*(discs[n].x - x)/d;
          float p2y = y + a*(discs[n].y - y)/d;

          float h = sqrt(r*r - a*a);

          float p3ax = p2x + h*(discs[n].y - y)/d;
          float p3ay = p2y - h*(discs[n].x - x)/d;

          float p3bx = p2x - h*(discs[n].y - y)/d;
          float p3by = p2y + h*(discs[n].x - x)/d;

          for (int s=0;s<numsands;s++) {
            sands[s].render(p3ax, p3ay, p3bx, p3by);
          }
        }
      }
    }
  }

  void move() {
    x+=vx;
    y+=vy;
    if (r<dr) {
      r+=0.1;
    }
    if (x+r<0) x+=400+r+r;
    if (x-r>400) x-=400+r+r;
    if (y+r<0) y+=600+r+r;
    if (y-r>600) y-=600+r+r;
  }
}

void daleDisco() {
  for (int i=0;i<120;i++) {
    float x = random(400);
    float y = random(600);
    float fy = 0;
    float fx = random(-1.2, 1.2);
    float r = 5+random(55);
    discs[i] = new Disc(i, x, y, fx, fy, r);
  }
}
