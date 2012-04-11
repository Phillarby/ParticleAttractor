class Particle
{
  PVector vPos, vVel, vAcc, vPrevious;
  PVector vY = new PVector(0,1,0);
  float momentum = 50;
  float friction = 0.999;
  float r = 0;
  
  public Particle(float x, float y, float z)
  {
    vPos = new PVector(x, y, z);
    vVel = new PVector();
    vAcc = new PVector();
    vPrevious = new PVector();
  }
  
  public void attractor(PVector a)
  {
    //get distance from position to m
    float d = vPos.dist(a);
    
    //Get vector from current position to m
    vAcc.x = vPos.x - a.x;
    vAcc.y = vPos.y - a.y;
    
    //Multiply acceleration by distance
    vAcc.div(d*momentum);
    
    vVel.add(vAcc);
    vVel.mult(friction);
    vPos.sub(vVel);
  }
  
  public void update()
  {
    //point(vPos.x, vPos.y, vPos.z);
    
    //Calculate direction of travel
    r = PI - atan2((vPrevious.x - vPos.x) , (vPrevious.y - vPos.y));
    
    pushMatrix();
    translate(vPos.x, vPos.y, vPos.z);
    rotateZ(r);
    triangle(-3,-3,3,-3,0,6);
    popMatrix();
    
    //print("Prev: (" + vPrevious.x + "," + vPrevious.y + "," +  vPrevious.z + ") "); 
    //print("Current: (" + vPos.x + "," + vPos.y + "," +  vPos.z + ") ");
    //print("Distance: " + (vPrevious.x - vPos.x) / (vPrevious.y - vPos.y) + " ");
    //print("Angle: " + r + " ");
    //print("\n"); 
    
    vPrevious.x = vPos.x;
    vPrevious.y = vPos.y;
  }
}

