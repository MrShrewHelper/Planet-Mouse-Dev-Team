// David Madden, Amani Liu, Jayden Liu, Dylan Cheng
float x = 100;
float y = 100;
float velocityY = 0;
float velocityX = 0;
float gravity = 0.25;
float radius = 25;
float groundLevel = 500;
int Djump = 0;
boolean ground = false;
boolean leftPressed = false;
boolean rightPressed = false;

// Level tracking & Scrolling Camera
int currentLevel = 1;
int maxLevels = 10;
float levelWidth = 2500; // Each level is now 2.5 screens long!
float cameraX = 0;

// Player direction part using (1 = right, -1 = left)
PImage playerImg;
PImage vickyImg;
int facing = -1;

// Lists for platforms and enemies
ArrayList<Platform> platforms = new ArrayList<Platform>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Vicky> vickys = new ArrayList<Vicky>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();

void setup() {
  size(1000, 600);
  frameRate(140);
  
  // To load the images (make sure UMP.png and normalvicky.png are in your data folder)
  playerImg = loadImage("UMP.png");
  vickyImg = loadImage("normalvicky.png");
  
  loadLevel(currentLevel);
}

void loadLevel(int lvl) {
  platforms.clear();
  enemies.clear();
  vickys.clear();
  projectiles.clear();
  
  // Reset player position to start of the long level
  x = 100;
  y = 100;
  velocityX = 0;
  velocityY = 0;
  Djump = 0;
  
  // Curated Long Level Designs (Spanning across 2500 pixels)
  if (lvl == 1) {
    // Tutorial level with spaced out moving platforms and simple enemies
    platforms.add(new Platform(300, 390, 140, 20, 300, 450, 0.5));
    platforms.add(new Platform(550, 310, 140, 20, 550, 550, 0));
    platforms.add(new Platform(800, 230, 140, 20, 750, 950, 0.8));
    platforms.add(new Platform(1100, 350, 150, 20, 1050, 1250, 1.0));
    platforms.add(new Platform(1400, 270, 130, 20, 1350, 1550, 1.2));
    platforms.add(new Platform(1750, 320, 160, 20, 1700, 1900, 0.6));
    platforms.add(new Platform(2050, 240, 140, 20, 2000, 2200, 1.0));
    
    enemies.add(new Enemy(570, 285, 550, 670));
    enemies.add(new Enemy(1120, 325, 1100, 1230));
    enemies.add(new Enemy(1770, 295, 1750, 1890));
  } 
  else if (lvl == 2) {
    platforms.add(new Platform(250, 400, 120, 20, 200, 350, 1.0));
    platforms.add(new Platform(500, 320, 120, 20, 450, 650, 1.2));
    platforms.add(new Platform(780, 240, 120, 20, 750, 950, 1.5));
    platforms.add(new Platform(1080, 350, 110, 20, 1000, 1200, 1.3));
    platforms.add(new Platform(1380, 260, 120, 20, 1350, 1550, 1.6));
    platforms.add(new Platform(1700, 330, 130, 20, 1650, 1850, 1.1));
    platforms.add(new Platform(2020, 220, 140, 20, 1980, 2200, 1.4));
    
    enemies.add(new Enemy(520, 295, 500, 600));
    enemies.add(new Enemy(1100, 325, 1080, 1180));
    enemies.add(new Enemy(1720, 305, 1700, 1810));
  }
  else if (lvl == 3) {
    platforms.add(new Platform(300, 360, 100, 20, 250, 450, 1.5));
    platforms.add(new Platform(580, 280, 100, 20, 520, 720, 1.5));
    platforms.add(new Platform(880, 200, 110, 20, 820, 1020, 1.8));
    platforms.add(new Platform(1180, 320, 100, 20, 1120, 1320, 1.6));
    platforms.add(new Platform(1480, 240, 120, 20, 1420, 1620, 2.0));
    platforms.add(new Platform(1800, 300, 110, 20, 1750, 1950, 1.7));
    platforms.add(new Platform(2100, 220, 130, 20, 2050, 2250, 2.1));
    
    enemies.add(new Enemy(320, 335, 300, 380));
    enemies.add(new Enemy(600, 255, 580, 660));
    enemies.add(new Enemy(1200, 295, 1180, 1260));
    enemies.add(new Enemy(1820, 275, 1800, 1890));
  }
  else if (lvl == 4) {
    platforms.add(new Platform(280, 380, 110, 20, 250, 420, 1.2));
    platforms.add(new Platform(560, 300, 110, 20, 500, 700, 1.6));
    platforms.add(new Platform(840, 220, 110, 20, 800, 1000, 1.8));
    platforms.add(new Platform(1120, 340, 100, 20, 1080, 1280, 1.5));
    platforms.add(new Platform(1420, 260, 110, 20, 1380, 1580, 1.9));
    platforms.add(new Platform(1740, 320, 120, 20, 1700, 1900, 1.7));
    platforms.add(new Platform(2060, 230, 130, 20, 2000, 2200, 2.0));
    
    enemies.add(new Enemy(580, 275, 560, 650));
    enemies.add(new Enemy(1140, 315, 1120, 1200));
    enemies.add(new Enemy(1760, 295, 1740, 1840));
  }
  else if (lvl == 5) {
    // Narrow fast moving platforms
    platforms.add(new Platform(280, 380, 90, 20, 250, 450, 1.8));
    platforms.add(new Platform(560, 300, 90, 20, 500, 700, 2.0));
    platforms.add(new Platform(840, 220, 90, 20, 780, 980, 2.2));
    platforms.add(new Platform(1120, 330, 90, 20, 1060, 1260, 2.0));
    platforms.add(new Platform(1400, 250, 90, 20, 1350, 1550, 2.3));
    platforms.add(new Platform(1720, 310, 90, 20, 1660, 1860, 2.1));
    platforms.add(new Platform(2040, 220, 100, 20, 1980, 2200, 2.5));
    
    enemies.add(new Enemy(300, 355, 280, 350));
    enemies.add(new Enemy(860, 195, 840, 910));
    enemies.add(new Enemy(1420, 225, 1400, 1470));
    enemies.add(new Enemy(2060, 195, 2040, 2120));
  }
  else if (lvl == 6) {
    platforms.add(new Platform(300, 400, 110, 20, 280, 450, 1.4));
    platforms.add(new Platform(600, 310, 110, 20, 550, 750, 1.7));
    platforms.add(new Platform(900, 220, 110, 20, 850, 1050, 1.9));
    platforms.add(new Platform(1200, 340, 100, 20, 1150, 1350, 1.6));
    platforms.add(new Platform(1500, 250, 110, 20, 1450, 1650, 2.0));
    platforms.add(new Platform(1820, 310, 110, 20, 1760, 1960, 1.8));
    platforms.add(new Platform(2120, 220, 120, 20, 2060, 2280, 2.2));
    
    enemies.add(new Enemy(320, 375, 300, 390));
    enemies.add(new Enemy(620, 285, 600, 690));
    enemies.add(new Enemy(1220, 315, 1200, 1280));
    enemies.add(new Enemy(1840, 285, 1820, 1910));
  }
  else if (lvl == 7) {
    platforms.add(new Platform(280, 370, 100, 20, 250, 450, 1.6));
    platforms.add(new Platform(580, 290, 100, 20, 520, 720, 1.9));
    platforms.add(new Platform(880, 210, 100, 20, 820, 1020, 2.1));
    platforms.add(new Platform(1180, 330, 100, 20, 1120, 1320, 1.8));
    platforms.add(new Platform(1480, 240, 100, 20, 1420, 1620, 2.3));
    platforms.add(new Platform(1800, 300, 100, 20, 1740, 1940, 2.0));
    platforms.add(new Platform(2100, 210, 110, 20, 2040, 2250, 2.4));
    
    enemies.add(new Enemy(600, 265, 580, 660));
    enemies.add(new Enemy(1200, 305, 1180, 1260));
    enemies.add(new Enemy(1820, 275, 1800, 1880));
  }
  else if (lvl == 8) {
    platforms.add(new Platform(300, 410, 120, 20, 260, 460, 1.5));
    platforms.add(new Platform(600, 320, 120, 20, 540, 740, 1.8));
    platforms.add(new Platform(900, 230, 120, 20, 840, 1040, 2.1));
    platforms.add(new Platform(1200, 350, 110, 20, 1140, 1340, 1.9));
    platforms.add(new Platform(1500, 260, 120, 20, 1440, 1640, 2.4));
    platforms.add(new Platform(1820, 320, 110, 20, 1760, 1960, 2.1));
    platforms.add(new Platform(2120, 230, 120, 20, 2060, 2280, 2.5));
    
    enemies.add(new Enemy(320, 385, 300, 400));
    enemies.add(new Enemy(920, 205, 900, 990));
    enemies.add(new Enemy(1520, 235, 1500, 1590));
    enemies.add(new Enemy(2140, 205, 2120, 2210));
  }
  else if (lvl == 9) {
    platforms.add(new Platform(280, 380, 100, 20, 250, 450, 2.0));
    platforms.add(new Platform(580, 290, 100, 20, 520, 720, 2.3));
    platforms.add(new Platform(880, 200, 100, 20, 820, 1020, 2.6));
    platforms.add(new Platform(1180, 320, 100, 20, 1120, 1320, 2.2));
    platforms.add(new Platform(1480, 230, 100, 20, 1420, 1620, 2.8));
    platforms.add(new Platform(1800, 290, 100, 20, 1740, 1940, 2.5));
    platforms.add(new Platform(2100, 200, 110, 20, 2040, 2250, 3.0));
    
    enemies.add(new Enemy(300, 355, 280, 350));
    enemies.add(new Enemy(880, 175, 860, 950));
    enemies.add(new Enemy(1480, 205, 1460, 1550));
    enemies.add(new Enemy(2120, 175, 2100, 2180));
  }
  else if (lvl == 10) {
    // BOSS LEVEL: Massive multi-stage gauntlet across the 2500px arena
    platforms.add(new Platform(350, 320, 250, 25, 350, 350, 0));
    platforms.add(new Platform(750, 250, 200, 25, 700, 900, 1.5));
    platforms.add(new Platform(1150, 350, 200, 25, 1100, 1300, 1.8));
    platforms.add(new Platform(1550, 230, 200, 25, 1500, 1700, 2.2));
    platforms.add(new Platform(1950, 300, 300, 25, 1950, 1950, 0)); // Final Boss Ledge
    
    enemies.add(new Enemy(380, 285, 360, 560));
    enemies.add(new Enemy(780, 215, 750, 910));
    enemies.add(new Enemy(1180, 315, 1150, 1310));
    enemies.add(new Enemy(1580, 195, 1550, 1710));
    enemies.add(new Enemy(2000, 265, 1970, 2210)); // Boss Minion
  }
  
  // Vickys stand on the ground ledges (more of them in later levels)
  // Positions must be on a ledge: 800-1200, 1500-1900, or 2100-2500
  float[] vickyPositions = {1000, 1700, 2300};
  int vickyCount = constrain(1 + (lvl - 1) / 3, 1, 3);
  for (int i = 0; i < vickyCount; i++) {
    vickys.add(new Vicky(vickyPositions[i], i * 1500)); // staggered first shots
  }
}

void draw() {
  background(#B2B0B0); // light grey

  // Update Camera to follow player smoothly
  cameraX = constrain(x - width / 3, 0, levelWidth - width);

  // Draw HUD Level Counter (Fixed on screen)
  fill(0);
  textSize(24);
  text("Level: " + currentLevel + " / " + maxLevels, 40, 50);
  if (currentLevel == maxLevels) {
    fill(180, 0, 0);
    textSize(20);
    text("⚠ BOSS ARENA ⚠", 40, 80);
  }

  // BEGIN WORLD DRAWING (Translated by Camera)
  pushMatrix();
  translate(-cameraX, 0);

  // Create gaps and ground ledges across the world width
  fill(#555555); 
  noStroke();
  rect(0, groundLevel, 400, height - groundLevel);             
  rect(800, groundLevel, 400, height - groundLevel); 
  rect(1500, groundLevel, 400, height - groundLevel); 
  rect(2100, groundLevel, levelWidth - 2100, height - groundLevel);

  // Movement code & facing direction code
  if (leftPressed) {
    velocityX = -3;
    facing = -1;  
  } else if (rightPressed) {
    velocityX = 3;
    facing = 1; 
  } else {
    velocityX *= 0.75; 
  }

  // Update position by velocity
  x += velocityX;
  y += velocityY;

  // Advance to next level if reaching the end of the long level
  if (x >= levelWidth - 30) {
    currentLevel++;
    if (currentLevel > maxLevels) {
      currentLevel = maxLevels; // Win state cap
    }
    loadLevel(currentLevel);
  }
  
  // Prevent walking off the left side of the world
  if (x - radius < 0) {
    x = radius;
    velocityX = 0;
  }

  // Respawn at the start of current level if falling into gaps/abyss
  if (y - radius > height) {
    loadLevel(currentLevel);
  }

  // Assume player is in the air unless touching ground or a platform
  ground = false;
  Platform currentPlatform = null;

  // Check collision with ground ledges across the extended world
  boolean overLedge1 = (x >= 0 && x <= 400);
  boolean overLedge2 = (x >= 800 && x <= 1200);
  boolean overLedge3 = (x >= 1500 && x <= 1900);
  boolean overLedge4 = (x >= 2100 && x <= levelWidth);

  if ((overLedge1 || overLedge2 || overLedge3 || overLedge4) && y + radius >= groundLevel && y - radius < groundLevel) {
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
      currentPlatform = p; 
    }
  }

  // If standing on a moving platform, carry the player along with it
  if (ground && currentPlatform != null) {
    x += currentPlatform.speed;
  }

  // Apply gravity only if not standing on ground or a platform
  if (!ground) {
    velocityY += gravity;
  }

  // Draw and update platforms
  for (Platform p : platforms) {
    p.display();
  }

  // This flag fixes the crash: we never call loadLevel() inside a loop
  // over the lists, because loadLevel() clears them.
  boolean playerHit = false;

  // Platform enemies
  for (Enemy e : enemies) {
    e.update();
    e.display();
    if (dist(x, y, e.x + e.w/2, e.y + e.h/2) < radius + 12) {
      playerHit = true;
    }
  }

  // Vickys (ground enemies)
  for (Vicky v : vickys) {
    v.update(x, y);
    v.display();
  }

  // Radiation projectiles
  for (int i = projectiles.size() - 1; i >= 0; i--) {
    Projectile p = projectiles.get(i);
    p.update();
    p.display();
    if (dist(x, y, p.x, p.y) < radius + p.r) {
      playerHit = true;
    } else if (p.isOffscreen()) {
      projectiles.remove(i);
    }
  }

  // Safe to reset now that all loops are done
  if (playerHit) {
    loadLevel(currentLevel);
  }

  // Render the player flipped according to 'facing'
  pushMatrix();
  translate(x, y);      
  scale(facing, 1);     
  imageMode(CENTER);
  image(playerImg, 0, -20, radius * 3.6, radius * 3.6);
  popMatrix();

  popMatrix(); // END WORLD DRAWING
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

// ==========================================
// PLATFORM CLASS
// ==========================================
class Platform {
  float x, y, w, h;
  float minX, maxX;
  float speed;
  color c;

  Platform(float x, float y, float w, float h, float minX, float maxX, float speed) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.minX = minX;
    this.maxX = maxX;
    this.speed = speed;
    this.c = color(#5F0FA2);
  }

  void update() {
    if (minX != maxX) {
      x += speed;
      if (x <= minX || x >= maxX) {
        speed *= -1; 
      }
    }
  }

  void display() {
    update();
    fill(c);
    noStroke();
    rect(x, y, w, h, 4); 
  }

  boolean checkCollision(float px, float py, float pr, float vy) {
    if (vy >= 0) {
      if (px + pr > x && px - pr < x + w) {
        if (py + pr >= y && py + pr <= y + h) {
          return true;
        }
      }
    }
    return false;
  }
}

// ==========================================
// ENEMY CLASS
// ==========================================
class Enemy {
  float x, y, w, h;
  float minX, maxX;
  float speed;

  Enemy(float x, float y, float minX, float maxX) {
    this.x = x;
    this.y = y;
    this.w = 30;
    this.h = 30;
    this.minX = minX;
    this.maxX = maxX;
    this.speed = 1.2;
  }

  void update() {
    x += speed;
    if (x <= minX || x >= maxX) {
      speed *= -1;
    }
  }

  void display() {
    fill(200, 40, 40); // Red enemy color
    noStroke();
    ellipse(x + w/2, y + h/2, w, h); // Draw enemy as a red hazard circle
  }
}

// ==========================================
// VICKY CLASS (ground enemy)
// ==========================================
class Vicky {
  float x;
  float w = 90, h = 90;
  int interval = 5000;   // 5 seconds in milliseconds
  int lastShot;
  float range = 900;     // only fires when the player is this close

  Vicky(float x, int offset) {
    this.x = x;
    this.lastShot = millis() + offset;
  }

  void update(float targetX, float targetY) {
    if (millis() - lastShot >= interval) {
      lastShot = millis();
      if (abs(targetX - x) < range) {
        float sx = x;
        float sy = groundLevel - h / 2;
        float angle = atan2(targetY - sy, targetX - sx);
        projectiles.add(new Projectile(sx, sy, angle));
      }
    }
  }

  void display() {
    imageMode(CENTER);
    image(vickyImg, x, groundLevel - h / 2, w, h);
  }
}

// ==========================================
// PROJECTILE CLASS (radiation blast)
// ==========================================
class Projectile {
  float x, y, vx, vy;
  float r = 10;
  float speed = 3.5;

  Projectile(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.vx = cos(angle) * speed;
    this.vy = sin(angle) * speed;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    noStroke();
    fill(120, 255, 0, 70);          // glow
    ellipse(x, y, r * 3, r * 3);
    fill(160, 255, 0, 140);
    ellipse(x, y, r * 2, r * 2);
    fill(230, 255, 100);            // core
    ellipse(x, y, r, r);
  }

  boolean isOffscreen() {
    return x < -50 || x > levelWidth + 50 || y < -100 || y > height + 50;
  }
}
