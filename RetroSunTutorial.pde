// RGB colors
color[] sunColors = {
  color(212, 202, 11), 
  color(214, 198, 30), 
  color(211, 170, 26), 
  color(216, 157, 51), 
  color(217, 124, 64), 
  color(213, 104, 81), 
  color(212, 51, 98), 
  color(215, 29, 121), 
  color(217, 11, 139), 
  color(217, 0, 151)
};

color bgColor = #251935;
float sunRadius = 300;
float topSlitY;
Rectangle[] slits;

class Rectangle{
 float x, y, w, h;
  
  Rectangle(float y, float h){
    this.x = width/2 - sunRadius;
    this.w = 2*sunRadius;
    this.y = y;
    this.h = h;
  }
  
  void draw(){
    fill(bgColor);
    rect(x,y,w,h);
  }
  
  void update(){
    y -= 0.5;
    
    if( y < topSlitY ){
     y = height/2 + sunRadius; 
    }
  
    h = map(y, topSlitY, height/2 + sunRadius, 1.0, 40.0);
  }
}


void setup(){
  size(1200, 800);
  topSlitY = height/2 - (sunRadius/4);
  
  slits = new Rectangle[6];
  
  float y = topSlitY;
  float h = 1.0;
  for( int i = 0; i < slits.length; i++ ){
    slits[i] = new Rectangle(y, h);
    
    y += ((height/2 + sunRadius) - topSlitY) / slits.length;
    h = map(y, topSlitY, height/2 + sunRadius, 1.0, 40.0);
  }
}

void draw(){
  background(bgColor);
  
  noStroke();
  fill(sunColors[0]);
  ellipse(width/2, height/2, 2*sunRadius, 2*sunRadius);
  
  loadPixels();
  
  for( int i = 0; i < pixels.length; i++ ){
    
    if( pixels[i] == sunColors[0] ){
      int y = i / width;
      
      float step = map(y, height/2 - sunRadius, height/2 + sunRadius, 0, 1.0);
      
      pixels[i] = interpolateColor(sunColors, step);
    }
    
  }
  
  updatePixels();
  
  for( Rectangle r : slits ){
    r.update();
    r.draw();
  }
}

// Placed here so it can be used by all classes
// Variable step should be between 0 and 1, inclusive
color interpolateColor(color[] arr, float step) {
  int sz = arr.length;
  
  if (sz == 1 || step <= 0.0) {
    return arr[0];
  } else if (step >= 1.0) {
    return arr[sz - 1];
  }
  
  float scl = step * (sz - 1);
  int i = int(scl);
  
  return lerpColor(arr[i], arr[i + 1], scl - i);
}
