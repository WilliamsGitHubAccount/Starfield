Particle particles[] = new Particle[1000];
void setup(){
  size(800, 800);
  background(200, 200, 255);
      for(int i = 0 ; i < particles.length-300 ; i++){
    particles[i] = new Particle();
  }
  for(int i = particles.length-300 ; i < 1000; i++){
    particles[i] = new Shrapnel();
  }
}

void draw(){
  background(200, 200, 255);
  for(int i = 0 ; i < particles.length ; i++){
    particles[i].update();
  }
}

void mouseClicked(){
      for(int i = 0 ; i < particles.length-300 ; i++){
    particles[i] = new Particle();
  }
  for(int i = particles.length-300 ; i < 1000; i++){
    particles[i] = new Shrapnel();
  }
}

class Particle{
  public int size;
  public double x, y, speed, acceleration, direction;
  public color c;
  public Particle(){
    c = color(255, 220);
    size = 10;
    x = (Math.random()*100-50)+mouseX;
    y = (Math.random()*100-50)+mouseY;
    speed = Math.random()*10;
    acceleration = -Math.random()*1;
    direction = Math.random()*2*Math.PI;
  }
  public void move(){
    speed += acceleration;
    x = x+Math.cos(direction) * speed;
    y = y+Math.sin(direction) * speed;
  }
  
  public void plot(){
    noStroke();
    fill(c);
    ellipse((float)x, (float)y, size, size);
  }
  
  public void update(){
    move();
    plot();
  }
}

class Shrapnel extends Particle{
  double acceleration, acceleration_direction, xvelocity, yvelocity;
  Shrapnel(){
    size = 5;
    c = color(255, 100, 100, 200);
    acceleration = 0.2;
  }


  void accelerate(){
    yvelocity = yvelocity + acceleration;
  }
      public void move(){
 
    x = x+Math.cos(direction) * speed;
    
    
    y = y+yvelocity+Math.sin(direction) * speed;
  }
  void update(){
    accelerate();
    move();
    plot();
  }
}
