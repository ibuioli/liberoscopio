public class Orbital {
  int id;
  int pid;
  float r;
  float t;  
  float tv, tvd;
  float x, y;
  int d;
  color myc;

  Orbital(int Id, int Pid) {
    id=Id;
    pid=Pid;
    if (id!=pid) {
      d=orbitals[pid].d+1;
      r=random(1, 1+0.4*1000/d);
      t=-HALF_PI;
      tv=random(0.0001, 0.02/(d+1));
      if (random(100)<50) tv*=-1;
      tvd=random(1.001, 1.010);
    } else {
      r = 0;
    }
    myc = somecolor();
  }

  void setPosition(float X, float Y) {
    x = X-100;
    y = Y-200;
  }

  void orbit() {
    t+=tv;
    x = orbitals[pid].x+r*cos(t)*0.2;
    y = orbitals[pid].y+r*sin(t)*0.2;

    tv*=0.99942;
  }

  void draw() {
    float fzx = random(-0.22, 0.22);
    float fzy = random(-0.22, 0.22);

    stroke(red(myc), green(myc), blue(myc), 10);
    point(x+fzx, y+fzy);

    if (sumtv()<1.00001) {
      float o = random(TWO_PI);
      fzx = orbitals[pid].x+r*cos(o);
      fzy = orbitals[pid].y+r*sin(o);
      stroke(red(myc), green(myc), blue(myc), 18);
      point(fzx, fzy);

      o = random(2.0);
      fzx = x+o*(orbitals[pid].x-x);
      fzy = y+o*(orbitals[pid].y-y);
      stroke(0, 12);
      point(fzx, fzy);
    }
  }

  float sumtv() {
    if (pid!=id) {
      return (orbitals[pid].sumtv() + tv);
    } else {
      return tv+0.5;
    }
  }
}

void daleAleph() {
  for (int n=0;n<200;n++) {
    int npid = n;
    if (n>200*0.1) {
      npid = int(random(n));
    }
    orbitals[n] = new Orbital(n, npid);
    if (n==npid) {
      orbitals[n].setPosition(1000/2, 1000/2);
    }
  }
}

