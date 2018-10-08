// Vallejo Tanya
// Basado en el ejemplo de Box 2D "ApplyForceAtrractMouse"
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;

background uno,boton,control;

PFont a,b,c;

PImage f1,f2,f3,f4,f5;

ArrayList<Boundary> boundaries;

ArrayList<Box> boxes;

int pantalla=1, rotate=0;

void setup() {
  size(640,360);
  smooth();

  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
 
  box2d.setGravity(0,0);

  	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  boundaries.add(new Boundary(width/4,height-150,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-22,width/2-50,10));
  boundaries.add(new Boundary(width-5,height/2,10,height));
  boundaries.add(new Boundary(5,height/2,10,height));
  
  uno = new background (0,0,width,height,1);
  boton = new background (280,250,80,80,2);
  control = new background (170,30,300,300,3);
  
  a = loadFont ("a.vlw");
  b = loadFont ("b.vlw");
  c = loadFont ("c.vlw");
  
  f1= loadImage("f1.png");
  f2= loadImage("f2.png");
  f3= loadImage("f3.png");
  f4= loadImage("f4.png");
  f5= loadImage("f5.png");
}

void draw() {
  background(#62E3D3);
  
  if (pantalla==1)
  {
    uno.display();
    println ("pantalla 1");
    textFont (a);
    fill (0);
    text ("DESESPERACION EN COLORES",100,50);
    text ("°-°-°-°-°-°-°",240,100);
    textFont (b);
    text ("Pon a prueba tus emociones interactuando con mi yo interno.",190,130);
    text ("Mi personalidad suele ocultar mis emociones negativas por medio",180,150);
    text ("de bromas crueles a mi propia persona.",230,170);
    text ("Es irónico como las palabras negativas pueden venir",200,190);
    text ("en fondos lindos, flores y corazones...",230,210);
    
    boton.display();
    
    if (mousePressed && (mouseX>280) && (mouseX<=280+80) && (mouseY>250) && (mouseY<250+80))
    {
      background(f4);
      println ("pantalla 2");
      pantalla=2;
    }
  }


  if (pantalla==2)
  {
  keyPressed();
  
  box2d.step();
  
  if (mousePressed && (mouseButton == LEFT)) {
    background(f1);
    for (Box b: boxes) {
     b.attract(mouseX,mouseY);
    }
  }
  
  for (Boundary wall: boundaries) {
    wall.display();
  }

  
  for (Box b: boxes) {
    b.display();
  }

  
  if (random(1)<0.1) {
    Box p = new Box(random(width),10);
    boxes.add(p);
  }
  
  if (mousePressed && (mouseButton == RIGHT))
  {
    control.display();
  }
  
  text ("*DA CLICK DERECHO PARA CONOCER LOS CONTROLES*",140,280);

}
}

void keyPressed()
{
  switch (key)
  {
    case 'a':
    background(f2);
    box2d.setGravity(0,-20);
    break;
    
    case 'b':
    background(f3);
    box2d.setGravity(0,20);
    break;
    
    case 'c':
    rotate=1;
    background(f5);
    break;
    
    case 'z':
    exit();
    break;
    
    case 'd':
    background (#62E3D3);
    rotate=0;
    break;
  }
}
