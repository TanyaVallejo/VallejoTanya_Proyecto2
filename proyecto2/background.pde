class background
{
  PImage imagen, boton, control;
  int x,y,w,h,i;
  
  background (int x_, int y_, int w_, int h_, int i_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    i = i_;
  }
  
  void display()
  {
    switch (i)
    {
      case 1:
    imagen = loadImage("titulo.jpg");
    image (imagen,x,y,w,h);
    break;
    
      case 2:
    boton = loadImage ("boton.png");
    image (boton,x,y,w,h);
    break;
    
    case 3:
    control = loadImage ("controles.png");
    image (control,x,y,w,h);
    break;
    }
  }
}
