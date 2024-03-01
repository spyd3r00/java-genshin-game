void game() {
  background(0);
  text("SCORE:", 1500, 20);
  text(value, 1550, 20);
  boolean isSpacePressed = false; 
  boolean collectedPrimogem = false;
  // Adjust objectSpeed based on the value
  if (value == 30) {
    objectSpeed = 40;
  } else if (value == 90) {
    objectSpeed = 50;
  } else if (value == 120) {
    objectSpeed = 60;
  } else if (value == 150) {
    objectSpeed = 70;
  }

  if (state == 0) {
      // Define the dimensions of the collision box for the character
    float characterCollisionBoxX = 300;
    float characterCollisionBoxY = y + 10;
    float collisionBoxWidth = characterAnimationWidth * 0.6;  // Adjust as needed
    float collisionBoxHeight = characterAnimationHeight * 0.8;  // Adjust as needed
    float characterCollisionBoxWidth = collisionBoxWidth;
    float characterCollisionBoxHeight = collisionBoxHeight;

    // Check for collision between character and pillars
    boolean characterCollidesWithPillar = false;
    if (!collectedPrimogem) {
    // Check for collision between character and primogem
    if (
      characterCollisionBoxX < primox + width / 15 &&
      characterCollisionBoxX + characterCollisionBoxWidth > primox &&
      characterCollisionBoxY < primoy + height / 15 &&
      characterCollisionBoxY + characterCollisionBoxHeight > primoy
    ) {
      // Character has collected a primogem
      collectedPrimogem = true;
      value += 50; // Add 50 to the score
    }
  }
    if (collectedPrimogem) {
      // Draw collected primogem
      primox = -100; // Move it off-screen to hide it
      primoy = -100; // Move it off-screen to hide it
    }
  
  
    if (
      characterCollisionBoxX < pillarx + 200 &&
      characterCollisionBoxX + characterCollisionBoxWidth > pillarx &&
      characterCollisionBoxY < pillary + 50 &&
      characterCollisionBoxY + characterCollisionBoxHeight > pillary
    ) {
      characterCollidesWithPillar = true;
    }

    if (
      characterCollisionBoxX < pillar2x + 200 &&
      characterCollisionBoxX + characterCollisionBoxWidth > pillar2x &&
      characterCollisionBoxY < pillar2y + 50 / 8 &&
      characterCollisionBoxY + characterCollisionBoxHeight > pillar2y
    ) {
      characterCollidesWithPillar = true;
    }
    if (
      characterCollisionBoxX < pillar3x +200  &&
      characterCollisionBoxX + characterCollisionBoxWidth > pillar3x &&
      characterCollisionBoxY < pillar3y + 50  &&
      characterCollisionBoxY + characterCollisionBoxHeight > pillar3y
    ) {
      characterCollidesWithPillar = true;
    }
    if (
      characterCollisionBoxX < pillar4x + 200 &&
      characterCollisionBoxX + characterCollisionBoxWidth > pillar4x &&
      characterCollisionBoxY < pillar4y + 50 &&
      characterCollisionBoxY + characterCollisionBoxHeight > pillar4y
    ) {
      characterCollidesWithPillar = true;
    }
    if (
      characterCollisionBoxX < pillar5x + 200  &&
      characterCollisionBoxX + characterCollisionBoxWidth > pillar5x &&
      characterCollisionBoxY < pillar5y + 50  &&
      characterCollisionBoxY + characterCollisionBoxHeight > pillar5y
    ) {
      characterCollidesWithPillar = true;
    }

    if (characterCollidesWithPillar) {
      
      // Reset the score value to 0
      value = 0;
      setup();
      resetGame = false;
      // Redirect to the setup function to restart the game
    }
    // Primogems
    image(primo, primox, primoy, width / 15, height / 15);
    primox -= objectSpeed + 30 - movement_gap + random(-2, 5);
    if (primox <= 0) {
      value = value + 1;
    }
    if (primox < 0) {
      primox = random(2000,5000);
      primoy = random(50, 600);
    }

    image(pillar, pillarx, pillary, 200, 50);
    pillarx -= objectSpeed - movement_gap + random(-2, 5);
    if (pillarx <= 0) {
      value = value + 1;
    }
    if (pillarx < 0) {
      pillarx = random(2000, 10000);
      pillary = random(-100, 600);
    }
    image(pillar, pillar2x, pillar2y, 200, 50);
    pillar2x -= objectSpeed - movement_gap+random(-5, 7) ;
    if ( pillar2x <= 0) {
      value = value +1;
    }      
    if (pillar2x<0)
    {
      pillar2x = random(2000, 10000);
      pillar2y = random(-100, 600);
    } 
    //3
    image(pillar, pillar3x, pillar3y, 200, 50);
    pillar3x -= objectSpeed - movement_gap+random(-8, 7) ;
    if ( pillar3x <= 0) {
      value = value +1;
    }      
    if (pillar3x<0)
    {
      pillar3x = random(2000, 10000);
      pillar3y = random(-100, 600);
    }
    //4
    image(pillar, pillar4x, pillar4y, 200, 50);
    pillar4x -= objectSpeed - movement_gap+random(-1, 9) ;
    if ( pillar4x <= 0) {
      value = value +1;
    }      
    if (pillar4x<0)
    {
      pillar4x = random(2000, 10000);
      pillar4y = random(-100, 600);
    } 
  
    //5
    image(pillar, pillar5x, pillar5y, 200, 50);
    pillar5x -= objectSpeed - movement_gap+random(-3, 3) ;
    if ( pillar5x <= 0) {
      value = value +1;
    }      
    if (pillar5x< 0 )
    {
      pillar5x = random(2000, 10000);
      pillar5y = random(-100, 600);
    }
  }
  
  if (keyPressed && key == ' ' && y >= 0 && !isSpacePressed) {
    verticalSpeed = -20;
    isSpacePressed = true;  // Set the flag to indicate that space is pressed
  }

  // Reset the flag when the spacebar is released
  if (key == 0) {
    isSpacePressed = false;
  }
  verticalSpeed += gravity;
  y += verticalSpeed;
  y = constrain(y, 0, height - characterAnimationHeight);

  PImage[] currentFrames;
  if (currentCharacterSet == 1) {
    currentFrames = characterFrames1;
  } else if (currentCharacterSet == 2) {
    currentFrames = characterFrames2;
  } else {
    currentFrames = characterFrames3;
  }
  image(currentFrames[frameIndex], 300, y + 10, characterAnimationWidth, characterAnimationHeight);

  frameIndex = (frameIndex + 1) % totalCharacterFrames;
}

void keyPressed() {
  if (keyCode == RIGHT) {
    currentCharacterSet = (currentCharacterSet % 3) + 1;
    frameIndex = 0;
  }
}
