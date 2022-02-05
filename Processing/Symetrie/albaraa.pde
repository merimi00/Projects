void setup(){
  size(900,900);
  background(255);
  
}

void draw(){
  /*
  background(255);
  line(0,0,mouseX,mouseY);
  line(width,0,mouseX,mouseY);
  line(0,height,mouseX,mouseY);
  line(width,height,mouseX,mouseY);*/
  //image(img,mouseX,mouseY);
  

  strokeWeight(10);
  
  /*stroke(233, 92, 167);
  point(mouseX,mouseY);
  stroke(92, 233, 163);
  point(mouseY,mouseX);
  stroke(233, 92, 167);
  point(width-mouseX,height-mouseY);
  stroke(92, 233, 163);
  point(height-mouseY,width-mouseX);*/
  
  stroke(233, 92, 167);
  line(width/2, height/2,mouseX,mouseY);
  stroke(92, 233, 163);
  line(width/2, height/2,mouseY,mouseX);
  stroke(233, 92, 167);
  line(width/2, height/2,width-mouseX,height-mouseY);
  stroke(92, 233, 163);
  line(width/2, height/2,height-mouseY,width-mouseX);
}
