float x, y;
int state;
float verticalSpeed = 0;
float gravity = 3;
int objectSpeed = 30;

float pillarx = 1600, pillar2x = 1600, pillar3x = 1600, pillar4x = 1600, pillar5x = 1600, primox = 10000;
float pillary = 600, pillar2y = 600, pillar3y = 600, pillar4y = 600, pillar5y = 600, primoy = 600;

PImage pillar, primo;
PImage[] startFrames;
PImage[] backgroundFrames;
PImage[] characterFrames1, characterFrames2, characterFrames3;

int currentFrame = 0;
int totalFrames = 6;
int currentBackgroundFrame = 0;
int totalBackgroundFrames = 146;
int currentCharacterSet = 1;
int frameIndex = 0;
int totalCharacterFrames = 13;
int characterAnimationWidth = 150;
int characterAnimationHeight = 200;

float movement_gap = random(-2, 2);

boolean gameStarted = false;
int value = 0; // Initialize score
int gameState = 0; // 0: Starting state, 1: Game running, 2: Game over
boolean resetGame = false;

void setup() {
  size(1600, 700);
  frameRate(120);
  initializePillarPosition();
  pillar = loadImage("pillar.png");
  primo = loadImage("primo.png");
  loadBackgroundImages();
  loadStartFrames();
  loadCharacterFrames();
}

void draw() {
  background(0);
  image(backgroundFrames[currentBackgroundFrame], 0, 0, 1600, 700);
  currentBackgroundFrame = (currentBackgroundFrame + 1) % totalBackgroundFrames;
  if (gameState == 0) {
    // Handle the starting state
    image(startFrames[currentFrame], 750, 500, 150, 80);
    currentFrame = (currentFrame + 1) % totalFrames;
  } else if (gameState == 1) {
    // Handle the game running state
    game();
  } else if (gameState == 2) {
    // Handle the game over state
    background(255, 0, 0); // Red background for game over
    text("Game Over", width / 2, height / 2);
    // You can add more text or buttons for restarting the game, etc.
  }
  if (gameStarted) {
    game();
  } else {
    image(startFrames[currentFrame], 750, 500, 150, 80);
    currentFrame = (currentFrame + 1) % totalFrames;
  }
}

void mouseClicked() {
  if (!gameStarted && isStartButtonClicked()) {
    gameStarted = true;
  }
}

void initializePillarPosition() {
  pillarx = random(2000, 3000);
  pillary = random(-100, 600);

  pillar2x = random(2000, 3000);
  pillar2y = random(-100, 600);

  pillar3x = random(2000, 3000);
  pillar3y = random(-100, 600);

  pillar4x = random(2000, 3000);
  pillar4y = random(-100, 600);

  pillar5x = random(2000, 3000);
  pillar5y = random(-100, 600);
}

void loadBackgroundImages() {
  backgroundFrames = new PImage[totalBackgroundFrames];
  for (int i = 0; i < totalBackgroundFrames; i++) {
    backgroundFrames[i] = loadImage("background/yae-miko-genshin-" + i + ".png");
  }
}

void loadStartFrames() {
  startFrames = new PImage[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    startFrames[i] = loadImage("start/start" + i + ".png");
  }
}

void loadCharacterFrames() {
  characterFrames1 = loadCharacterFrames("paimon/tumblr_492ddfe769c88240dece1ba3578e8db5_188fca6c_250-", totalCharacterFrames + 2);
  characterFrames2 = loadCharacterFrames("paimon2/tumblr_26a8c3d8aa67b1d200da7176054f8f2d_b7bba6ad_250-", totalCharacterFrames + 10);
  characterFrames3 = loadCharacterFrames("paimon3/tumblr_c9243da8d9e5a1cdd827197f54f8fb1f_5ed53010_250-", totalCharacterFrames + 47);
}
PImage[] loadCharacterFrames(String path, int totalFrames) {
  PImage[] frames = new PImage[totalFrames];
  for (int i = 0; i < totalFrames; i++) {
    frames[i] = loadImage(path + i + ".png");
  }
  return frames;
}
boolean isStartButtonClicked() {
  return mouseX >= 750 && mouseX <= 900 && mouseY >= 500 && mouseY <= 580;
}
