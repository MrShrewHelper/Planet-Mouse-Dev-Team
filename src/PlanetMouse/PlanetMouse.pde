// David Madden, Amani Liu, Jayden Liu, Dylan Cheng
float x = 200;
float y = 100;
float velocityY = 0;
float accelerationX = 0;
float velocityX = 0;
float gravity = 0.19;
float radius = 25;
float groundLevel = 500;
int Djump = 0;
boolean ground = false;
boolean jump = false;
boolean leftPressed = false;
boolean rightPressed = false;



void setup() {
  size(1000, 600);
  frameRate (140);
}

void draw() {
  background(135, 206, 235); //sky blue


  fill(34, 139, 34); // Forest Green Ground
  noStroke();
  rect(0, groundLevel, width, height - groundLevel);


  if (!ground) {
    velocityY += gravity;
  }


//movement code
  if (leftPressed) {
    velocityX = -2;
  } else if (rightPressed) {
    velocityX = 2;
  } else {
    velocityX *= 0.75; // air resistance or friction
  }
  // 2. Update vertical position by velocity
  x += velocityX;
  y += velocityY;


// makes it so you don't phase through the ground
  if (y + radius >= groundLevel) {
    y = groundLevel - radius;
    velocityY = 0;
    ground = true;
    Djump = 0;
  }

  // Render the object
  fill(50, 120, 240);
  ellipse(x, y, radius * 2, radius * 2);
  
  
  
  //platform generation
  //idk what to do yet help
  
  
  
  
  
  
  
}




void keyPressed() {
  if (key == 'a') leftPressed = true;
  if (key == 'd') rightPressed = true;

  // Jump and Double Jump
  if (key == 'w') {
    if (ground || Djump < 2) {
      ground = false;
      velocityY = -8;
      Djump += 1;
    }
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') leftPressed = false;
  if (key == 'd' || key == 'D') rightPressed = false;
}
