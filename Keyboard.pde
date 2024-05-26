int[] colors = {
  color(255, 0, 0),
  color(0, 255, 0),
  color(0, 0, 255),
  color(255, 255, 0),
  color(0, 255, 255),
  color(255, 0, 255),
  color(255, 255, 255) // White
};

int currentColorIndex = 0;
int multiColorIndex = 0; // Index for multiColor colors

void keyPressed() {
  boolean actionTaken = false;

  if (key == 'M' || key == 'm') {
    multiColor = !multiColor;
    println("MultiColor mode: " + multiColor);
    actionTaken = true;
  } else if (key == CODED) {
    if (keyEvent.isShiftDown()) {
      // Shift modifier is held
      if (keyCode == RIGHT) {
        presetBrightness = constrain(presetBrightness + 10, 0, 100);
        println("Current brightness: " + presetBrightness);
        actionTaken = true;
      } else if (keyCode == LEFT) {
        presetBrightness = constrain(presetBrightness - 10, 0, 100);
        println("Current brightness: " + presetBrightness);
        actionTaken = true;
      } else if (keyCode == UP) {
        multiColorIndex = (multiColorIndex + 1) % colors.length;
        multiColorclr = colors[multiColorIndex];
        println("MultiColor color: " + hex(multiColorclr));
        actionTaken = true;
      } else if (keyCode == DOWN) {
        multiColorIndex = (multiColorIndex - 1 + colors.length) % colors.length;
        multiColorclr = colors[multiColorIndex];
        println("MultiColor color: " + hex(multiColorclr));
        actionTaken = true;
      }
    } else {
      // No modifier
      if (keyCode == RIGHT) {
        presetNumber = (presetNumber + 1) % 32; // Assuming there are 32 effects
        println("Current effect: " + presetNumber);
        actionTaken = true;
      } else if (keyCode == LEFT) {
        presetNumber = (presetNumber - 1 + 32) % 32; // Assuming there are 32 effects
        println("Current effect: " + presetNumber);
        actionTaken = true;
      } else if (keyCode == UP) {
        currentColorIndex = (currentColorIndex + 1) % colors.length;
        presetColor = colors[currentColorIndex];
        println("Current color: " + hex(presetColor));
        actionTaken = true;
      } else if (keyCode == DOWN) {
        currentColorIndex = (currentColorIndex - 1 + colors.length) % colors.length;
        presetColor = colors[currentColorIndex];
        println("Current color: " + hex(presetColor));
        actionTaken = true;
      }
    }
  } else {
    // New key bindings for presetSize, presetSpeed, shadeAmount, and presetStrobing
    if (key == 'W' || key == 'w') {
      presetSize += 10;
      println("Current size: " + presetSize);
      actionTaken = true;
    } else if (key == 'S' || key == 's') {
      presetSize -= 10;
      println("Current size: " + presetSize);
      actionTaken = true;
    } else if (key == 'A' || key == 'a') {
      presetSpeed -= 10;
      println("Current speed: " + presetSpeed);
      actionTaken = true;
    } else if (key == 'D' || key == 'd') {
      presetSpeed += 10;
      println("Current speed: " + presetSpeed);
      actionTaken = true;
    } else if (key == 'J' || key == 'j') {
      shadeAmount -= 10;
      println("Current shade amount: " + shadeAmount);
      actionTaken = true;
    } else if (key == 'L' || key == 'l') {
      shadeAmount += 10;
      println("Current shade amount: " + shadeAmount);
      actionTaken = true;
    } else if (key == 'I' || key == 'i') {
      presetStrobing += 10;
      println("Current strobing: " + presetStrobing);
      actionTaken = true;
    } else if (key == 'K' || key == 'k') {
      presetStrobing -= 10;
      println("Current strobing: " + presetStrobing);
      actionTaken = true;
    }
  }

  if (!actionTaken) {
    println("No action taken.");
  }
}
