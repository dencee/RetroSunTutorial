color bgColor = color(31, 0, 48);

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

/*
 * LOOK AT retro_sun.gif IN THIS FOLDER to see what you will be creating!
 */


void setup(){
  // 1. Set the size of your sketch
  
  
}


void draw(){
  // 2. Draw the bgColor background color

  /*
   * PART I: Drawing the sun
   *
   * See 1st image 
   */
  
  // Draw an ellipse for the sun in the center of the window
  // Use fill(sunColors[0]) to make it yellow
  // Use noStroke() to remove the black outline
  
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
  
  // Loop through all the pixels in your window.
  // A pixel is a 1x1 square, so if your window width is 600 and the 
  // height is 400 (600x400), then there are 600 * 400 = 240,000 pixels 

    // We want to change the color of our sun so use an if statement
    // to check if the pixel is the color of the yellow circle. 
      
       // If it's the same color we need to map the pixel to a
       // color in our sunColors[] array (see 2nd gradient image)
       
       // The top of the sun is yellow (sunColors[0]) and the bottom
       // of the sun is red (sunColors[sunColors.length - 1]
       
       // In order to get the right color, the y value from the top of
       // the sun to the bottom has to be mapped to a range from 0 to 1.
       // Use the map() function to do that:
       // int y = i / width;
       // float step = map(y, sunTopY, sunBottomY, 0, 1);

       // Call interpolateColor(sunColors, step) and save the color
       // variable that's returned
          
       // Set pixels[i] to the returned color 

  }
  
  // Call updatePixels() after your loop through all the pixels
  
  /*
   * PART III: Drawing the missing sections at the bottom of the sun
   *
   * See 3rd image
   * The missing parts of the sun are created by drawing rectangles
   # over the sun with the same color as the background.
   */
   
   // Set the fill color to the background color
   
   // To draw each rectangle we need to find its x, y, width, height
   // *The y position can be any value within the sun:
   //   y = width / 2;
   // *The height can be any value you choose:
   //   h = 40;
   // *The x position can be the center of the sun's x position minus the radius:
   //   x = sunCenterX - sunRadius
   // * The width can be 2 times the radius
   //   w = 2 * sunRadius
   
   // Do you see a section missing from the sun like in the 3rd image?


  /*
   * PART IV: Moving the missing sun sections
   *
   * To move a section upwards each rectangle's y value needs to decrease.
   * To make the section get smaller, its height needs to also decrease.
   */
   
   // Decrease the y variable of the rectangular section created in part III.
   // If there isn't a variable declare a float variable OUTSIDE of the draw
   // function AND initialize it in the setup() function.
   
   // Do you see the rectangle moving upwards?
   // See image 4
   
   // Pick a y positon to be the location when the sections stop moving up.
   // If the rectangle's y positon is above this, move the rectangle's
   // y position back to the bottom of the sun.
   
   // Does the rectangle move back to the bottom?
   
   // Decrease the the height of the rectangle as it moves upwards.
   // Similar to the y positon, a float variable for the height needs to be
   // created if it doesn't already exist.

   // Adjust the amount to decrease so that it disappears close to the top.
   
   // Add code to reset the height of the rectangle when it moves back to
   // the bottom of the sun.
   // See image 5
   
  /*
   * PART V: Moving more missing sun sections
   *
   * Using a loop to manage moving multiple missing sun sections 
   */
   
   // Figure out how to create the other missing sun sections using the
   // code you wrote for the 1 missing sun section.
   // *HINT* Use a loop to repeat parts of the code you've written
   
   
  /*
   * PART VI: Adding extras
   *
   * If you want to make your retro sun look more unique, try adding
   * reflections and stars.
   */



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
