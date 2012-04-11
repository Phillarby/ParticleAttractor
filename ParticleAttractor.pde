import processing.opengl.*;

Particle[] p = new Particle[250];
PVector m = new PVector();
PVector centre = new PVector(256,256,256);
PVector att1 = new PVector(150,400,0);
PVector att2 = new PVector(77,250,0);

void setup()
{
  size(512, 512, OPENGL);
  
  //build particle array
  for(int i = 0; i < p.length; i++)
  {
    p[i] = new Particle(random(width), random(height), 0);
  }
  
  fill(0x33FFFFFF); //Transparency for fade
}

void draw()
{ 

  rect(0,0,width,height);
  m.x = mouseX;
  m.y = mouseY;
  
  for(int i = 0; i < p.length; i++)
  {
    p[i].attractor(m);
    p[i].update();
  }
}


