Dot dot;
Fish fish;
ArrayList<Dot> dots = new ArrayList<Dot>();
boolean fc = false;
PImage img;

void setup() {
  size(800,600);
  frameRate(60);
  background(0);
  //dot = new Dot(new Vector(10,10),new Vector(0,0),new Vector(0,0),1,10);
  fish = new Fish(new Vector(100,200),new Vector(0,0),new Vector(0,0),10,50);
  //fish.setTarget(new Vector(width,height));
  img = loadImage("fish.png");
}

void draw() {
  if (fc && !mousePressed) {
      dots.add(dot);
      fc = false;
    }
     fill(64);
      rect(0,0,width,height/4);
      fill(0);
      rect(0,height/4,width,height);
    if (dots.size() > 0) {    
      for (int i = 0; i < dots.size(); i++) {
        Dot dot = dots.get(i);
        if (dot.pos.y > height/4) {
          dot.addForce(new Vector(-dot.velo.x*2,-dot.velo.y*2));
        }
       dot.addForce(new Vector(0,dot.mass*1)); 
       dot.update();
       
       if (dot.pos.y > height - 10)
         dots.remove(i);
       }
       if (dots.size() > 0) fish.setTarget(dots.get(0));
    }
    fish.update();
    
  if (mousePressed) { 
    if(fish.overBox == true) {
      fish.setPos(new Vector(mouseX,mouseY));
    }
  }
  
  if(frameCount % 30 == 0 ) {
    println(fish.overBox);

    if (!fc) {
      dot = new Dot(new Vector(mouseX*frameCount%width,height/10),new Vector(0,0),new Vector(0,0),5,10);
      
      fc = true; 
    }

  }
    
    
  
  
}
void drawbackground() {
    
}
