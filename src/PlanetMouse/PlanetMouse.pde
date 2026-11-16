// David Madden, Amani Liu, Jayden Liu, Dylan Cheng
float x = 200;
float y = 100;
float velocityY = 0;
float accelerationX = 0;
float velocityX = 0;
float gravity = 0.4;
float bounce = -0.75; // Energy retained after floor collision (75%)
float radius = 25;
boolean ground = false;
boolean jump = false;


void setup() {
  size(1000, 600);
  frameRate (100);
}

void draw() {
  background(220);

  // 1. Apply gravity to vertical velocity
  if (ground == false) {
    velocityY += gravity;
  }
  velocityX += accelerationX;
  //air resistence

  if (ground == true) {
    if (velocityX > 0 || velocityX < 0 ) {
      accelerationX = accelerationX/1.08;
      velocityX = velocityX/1.08;
    }
  } 
  else if (ground == false) {
    if (velocityX > 0 || velocityX < 0 ) {
      accelerationX = accelerationX/1.02;
      velocityX = velocityX/1.02;
    }
  }
  // 2. Update vertical position by velocity
  y += velocityY;
  x += velocityX/10;

  if (jump == true) {
    y = height - radius ;
  }


  // 3. Collision with the floor
  if (y + radius > height-1) {
    ground = true;
  } else {
    ground = false;
  }


  if (ground) {
    jump = true;    // Snap to floor so it doesn't get stuck
  }

  // Render the object
  fill(50, 120, 240);
  ellipse(x, y, radius * 2, radius * 2);
}




void keyPressed() { // Player Movement
  if (accelerationX < 1 || accelerationX < -1 ) {
    if (key == 'a' || key== 'a') {
      accelerationX = -4;
    } else if (key == 'd' || key== 'd') {
      accelerationX = 4;
    }
  }
  if (key == 'w' && jump == true) {
    velocityY = -10;
    jump = false;
  }
}

