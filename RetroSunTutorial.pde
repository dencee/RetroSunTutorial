color bgColor = color(31, 0, 48);
int sunRadius = 300;

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

void setup(){
  // 1. Set the size of your sketch
  size(1000, 800);

}


void draw(){
  // 2. Draw the bgColor background color
  background(bgColor);

  /*
   * PART I: Drawing the sun
   *
   * See 1st image 
   */
  
  // Draw an ellipse for the sun in the center of the window
  // Use fill(sunColors[0]) to make it yellow
  // Use noStroke() to remove the black outline
  noStroke();
  fill(sunColors[0]);
  ellipse(width/2, height/2, 2*sunRadius, 2*sunRadius);
  
  // Do you see a yellow sun like in the 1st image?
  // If not, fix your code before proceeding.
  
  /*
   * PART II: Drawing a color gradient on the sun
   *
   * See 2nd image
   * This will make the sun have gradually different colors from the 
   * top to bottom
   */
  
  // Call the loadPixels() method  
  loadPixels();
  
  // Loop through all the pixels in your window.
  // A pixel is a 1x1 square, so if your window width is 600 and the 
  // height is 400 (600x400), then there are 600 * 400 = 240,000 pixels 
  for( int i = 0; i < width * height; i++ ){

    // We want to change the color of our sun so use an if statement
    // to check if the pixel is the color of the yellow circle. 
    if( pixels[i] == sunColors[0] ){
      
       // If it's the same color we need to map the pixel to a
       // color in our sunColors[] array (see 2nd gradient image)
       
       // The top of the sun is yellow (sunColors[0]) and the bottom
       // of the sun is red (sunColors[sunColors.length - 1]
       
       // In order to get the right color, the y value from the top of
       // the sun to the bottom has to be mapped to a range from 0 to 1.
       // Use the map() function to do that:
       // int y = i / width;
       // float step = map(y, sunTopY, sunBottomY, 0, 1);
       float originY = height/2 - sunRadius;
       float endY = height/2 + sunRadius;
       int y = i / width;
       float step = map(y, originY, endY, 0, 1);

       // Call interpolateColor(sunColors, step) and save the color
       // variable that's returned
       color lc = interpolateColor(sunColors, step);
          
       // Set pixels[i] to the returned color 
       pixels[i] = lc;
    }
  }
  
  // Call updatePixels() after your loop through all the pixels
  updatePixels();
  
  /*
   * PART III: Drawing the missing sections at the bottom of the sun
   *
   * See 3rd image
   * The missing parts of the sun are created by drawing rectangles
   # over the sun with the same color as the background.
   */
   
   // Set the fill color to the background color
   fill(bgColor);
   
   // To draw each rectangle we need to find its x, y, width, height
   // *The y position can be any value within the sun:
   //   y = width / 2;
   // *The height can be any value you choose:
   //   h = 40;
   // *The x position is the intersection of a line (the y value you picked)
   //  and the perimeter of the sun (a circle). The general equation is:
   //   x = sunCenterX - sqrt( sq(sunRadius) - sq(y - sunCenterY) );
   // * The equation for the width is:
   //   w = sunCenterX + sqrt( sq(sunRadius) - sq(y - sunCenterY) ) - x;
   
   // Do you see a section missing from the sun like in the 3rd image?
   // If so, create 2 more missing sections.
   int x, y, w, h;
   h = 40;
   y = width / 2;
   x = int( (width/2) - sqrt( sq(sunRadius) - sq(y - (height/2)) ));
   w = int( (width/2) + sqrt( sq(sunRadius) - sq(y - (height/2)) )) - x;
   rect(x, y, w, h);
   
/*
   // Draw other rectangles to create more missing sections in the sun
   h = 50;
   y = (width/2) + 80;
   x = int( (width/2) - sqrt( sq(sunRadius) - sq(y - (height/2)) ));
   w = int( (width/2) + sqrt( sq(sunRadius) - sq(y - (height/2)) )) - x;
   rect(x, y, w, h);
   
   h = 30;
   y = (width/2) - 60;
   x = int( (width/2) - sqrt( sq(sunRadius) - sq(y - (height/2)) ));
   w = int( (width/2) + sqrt( sq(sunRadius) - sq(y - (height/2)) )) - x;
   rect(x, y, w, h);
*/
  /*
   * PART IV: Moving the missing sun sections
   *
   * To move a section upwards each rectangle's y value needs to decrease.
   * Also, as the rectangles move upwards their height also has to decrease.
   * Can you figure out how to do that?
   * What should happen when the rectangle reaches the top?
   */
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
