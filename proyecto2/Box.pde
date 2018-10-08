
class Box {

  
  Body body;
  float w;
  float h;
  color col;
 
  Box(float x, float y) {
    w = random(8,16);
    h = w;
   
    makeBody(new Vec2(x,y),w,h);
    col = color(#1DF0D5);
  }

  
  void killBody() {
    box2d.destroyBody(body);
  }


  void attract(float x,float y) {
    
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    
    worldTarget.subLocal(bodyVec);
    
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    
    body.applyForce(worldTarget, bodyVec);
  }


  
  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    fill(col);
    if (rotate==1)
    {
    float a = body.getAngle();
    rotate(-a);
    }
    fill(#FFF63E);
    stroke(0);
    rect (0,0,w,h);
    stroke (0);
    fill (0);
    ellipse (4, -2, 2, 2);
    ellipse (-1,  -2, 2, 2);
    noFill();
    arc(0.5, 4.4, 8, 8, -PI, 0);
    popMatrix();
  }

  
  void makeBody(Vec2 center, float w_, float h_) {

    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createFixture(fd);
  }
}
