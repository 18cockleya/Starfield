int xLength = 800, yLength = 600;
Particle[] myParticle = new Particle[200];

void setup(){
  size(800,600);
  background(0);
  for(int i = 0; i < 100; i++){
    myParticle[i] = new NormalParticle();
  }
  for(int i = 100; i < 200; i++){
    myParticle[i] = new OddballParticle();
  }
  myParticle[199] = new JumboParticle();
}

void draw(){
  fill(0,0,0,30);
  rect(0,0,xLength,yLength);
  for(int i = 0; i < myParticle.length; i++){
    myParticle[i].show();
    myParticle[i].move();
  }
}

class NormalParticle implements Particle{
  double speed, theta, x, y;
  int r, g, b;
  public NormalParticle(){
   speed = random(1,5);
   theta = random(0,(float)(2*Math.PI));
   x = 250;
   y = 250;
   r = (int)random(0,255);
   g = (int)random(0,255);
   b = (int)random(0,255);
  }
  public void show(){
    fill(r,g,b);
    ellipse((float)x,(float)y,10,10);
    fill(r,g,b,50);
    ellipse((float)x,(float)y,20,20);
  }
  public void move(){
    x += speed * Math.cos(theta);
    y += speed * Math.sin(theta);
    if(x > xLength || y > yLength || x < 0 || y < 0){
      x = 250;
      y = 250;
    }
  }
}

class OddballParticle implements Particle{
  double speed, x, y, theta;
  int r, g, b;
  public OddballParticle(){
    speed = 2;
    theta = random(0, (float)(2*Math.PI));
    x = 250;
    y = 250;
    r = (int)random(0,255);
    g = (int)random(0,255);
    b = (int)random(0,255);
  }
  public void move(){
    x += speed * Math.cos(theta);
    y += speed * Math.sin(theta);
    if(Math.sqrt(Math.pow(Math.abs(x)-250,2) + Math.pow(Math.abs(y)-250,2)) > 150){
      x = 250;
      y = 250;
    }
  }
  public void show(){
    fill(r,g,b);
    ellipse((float)x,(float)y,20,20);
    fill(r,g,b,30);
    rect((float)x - 15,(float)y - 15,30,30);
  }
}

class JumboParticle extends NormalParticle{
  public JumboParticle(){
    speed = 3;
  }
  void show(){
   fill(245,217,2, 80);
   ellipse((float)(x), (float)(y), 50, 50);
  }
  void move(){
   x += speed*Math.cos(theta);
   y += speed*Math.sin(theta);
   if(x > xLength){
     theta = random(0,(float)Math.PI) - theta;
   }
   if(y > yLength){
     theta *= -1;
   }
   if(x < 0){
     theta = random(0,(float)Math.PI) - theta;
   }
   if(y < 0){
     theta *= -1;
   }
  }
}

interface Particle{
  public void show();
  public void move();
}
