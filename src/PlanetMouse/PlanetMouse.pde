// David Madden, Amani Liu, Jayden Liu, Dylan Cheng
float x = 100;
float y = 100;
float velocityY = 0;
float accelerationX = 0;
float velocityX = 0;
float gravity = 0.25;
float radius = 25;
float groundLevel = 500;
int Djump = 0;
boolean ground = false;
boolean jump = false;
boolean leftPressed = false;
boolean rightPressed = false;

// Player direction part using (1 = left, -1 = right)
PImage playerImg;
int facing = -1;

// Abyss in the floor
float gapStart = 220; // Where the left ledge ends
float gapEnd = 780;   // Where the right ledge begins

// List to make it so the platforms can exist
ArrayList<Platform> platforms = new ArrayList<Platform>();
int numPlatforms = 6;

void setup() {
  size(1000, 600);
  frameRate(140);
  
  // To load the image
  playerImg = loadImage("UMP.png");
  
  generatePlatforms();
}

void generatePlatforms() {
  platforms.clear();
  for (int i = 0; i < numPlatforms; i++) {
    float pWidth = random(100, 180);
    float pHeight = 20;
    float pX = random(gapStart - 50, gapEnd - pWidth + 50); 
    float pY = random(200, groundLevel - 60); 
    
    platforms.add(new Platform(pX, pY, pWidth, pHeight));
  }
}

void draw() {
  background(#B2B0B0); // light grey

  // Create the gap in the floor
  fill(#555555); // grey
  noStroke();
  rect(0, groundLevel, gapStart, height - groundLevel);             // Left ledge
  rect(gapEnd, groundLevel, width - gapEnd, height - groundLevel); // Right ledge

  // Draw platforms
  for (Platform p : platforms) {
    p.display();
  }

  // Movement code & facing direction code
  if (leftPressed) {
    velocityX = -3;
    facing = -1;  // Face left for 'A' key
  } else if (rightPressed) {
    velocityX = 3;
    facing = 1; // Face right for 'D' key
  } else {
    velocityX *= 0.75; // air resistance or friction code
  }

  // Update position by velocity
  x += velocityX;
  y += velocityY;

  // move to next level
  if (x - radius > width) {
    x = radius; // Teleport to the start (left side)
    generatePlatforms(); // Randomize platforms for the new screen
  }
  
  // Prevent walking off the left side of the screen
  if (x - radius < 0) {
    x = radius;
    velocityX = 0;
  }

  // Respawn at the start if the player falls into the gap
  if (y - radius > height) {
    x = 100;
    y = 100;
    velocityX = 0;
    velocityY = 0;
    Djump = 0;
    facing = -1;
  }

  // Assume player is in the air unless touching ground or a platform
  ground = false;

  // Check collision with the LEFT and RIGHT ground ledges (ignore the gap)
  boolean overLeftLedge = (x < gapStart);
  boolean overRightLedge = (x > gapEnd);

  if ((overLeftLedge || overRightLedge) && y + radius >= groundLevel && y - radius < groundLevel) {
    y = groundLevel - radius;
    velocityY = 0;
    ground = true;
    Djump = 0;
  }

  // Check collision with every platform
  for (Platform p : platforms) {
    if (p.checkCollision(x, y, radius, velocityY)) {
      y = p.y - radius;
      velocityY = 0;
      ground = true;
      Djump = 0;
    }
  }

  // Apply gravity only if not standing on ground or a platform
  if (!ground) {
    velocityY += gravity;
  }

  // Render the player flipped according to 'facing' with updated size and y-offset
  pushMatrix();
  translate(x, y);      // Move the origin to the player's center
  scale(facing, 1);     // Mirror horizontally if facing == -1
  imageMode(CENTER);
  image(playerImg, 0, -20, radius * 3.6, radius * 3.6);
  popMatrix();
}

void keyPressed() {
  if (key == 'a' || key == 'A') leftPressed = true;
  if (key == 'd' || key == 'D') rightPressed = true;

  // Jump and Double Jump
  if (key == 'w' || key == 'W') {
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
