/*
Represents a circle or a ball that is used in the effect14() function, which is the "PingPong-Kreise" effect.
 
 The purpose of the kreis class is to encapsulate the properties and behavior of a single ball in the effect.
 Each instance of the kreis class has its own position (posX, posY) and speed (spdX, spdY) attributes.
 */
kreis[] spotlight = new kreis[101];

class kreis {
  float posX;
  float posY;
  float spdX;
  float spdY;

  kreis() {
    posX = random(200, width - 200);
    posY = random(200, height - 200);
    spdX = random(10, 30);
    spdY = random(10, 30);
  }

  void move() {
    int ballSize = int(map(presetSize + 1, 0, 100, 300, 40));

    if (posX <= ballSize / 2) {
      posX = ballSize / 2;
      spdX = -spdX;
    } else if (posX >= width - ballSize / 2) {
      posX = width - ballSize / 2;
      spdX = -spdX;
    }
    if (posY <= ballSize / 2) {
      posY = ballSize / 2;
      spdY = -spdY;
    } else if (posY >= height - ballSize / 2) {
      posY = height - ballSize / 2;
      spdY = -spdY;
    }

    posX += map(presetSpeed + 1, 0, 100, 0, 1) * spdX;
    posY += map(presetSpeed + 1, 0, 100, 0, 1) * spdY;
    ellipse(posX, posY, ballSize, ballSize);
  }
}

/*
The effect31() function, named "QuadPhaseLED," utilizes the drawQuadLED function to create a unique visual effect
 
 The purpose of this function is to create a visual representation of an LED with four quadrants,
 where each quadrant corresponds to a specific color channel (red, green, blue, and white).
 The function determines the size of the LED based on the presetSize value.
 */
void drawQuadLED(int x, int y, int brightness) {
  int SIZE = round(8 * (presetSize + 50) / 100);
  if (red(presetColor) > 0 || (multiColor ? red(multiColorclr) : -1) > 0) {
    fill(255, 0, 0, brightness * 255 / 100);
    rect(x - SIZE - 1, y - SIZE - 1, x - 1, y - 1);
  }
  if (green(presetColor) > 0 || (multiColor ? green(multiColorclr) : -1) > 0) {
    fill(0, 255, 0, brightness * 255 / 100);
    rect(x + 1, y - SIZE - 1, x + SIZE + 1, y - 1);
  }
  if (blue(presetColor) > 0 || (multiColor ? blue(multiColorclr) : -1) > 0) {
    fill(0, 0, 255, brightness * 255 / 100);
    rect(x - SIZE - 1, y + 1, x - 1, y + SIZE + 1);
  }
  if (red(presetColor) > 0 && green(presetColor) > 0 && blue(presetColor) > 0) {
    fill(255, 255, 255, brightness * 255 / 100);
    rect(x + 1, y + 1, x + SIZE + 1, y + SIZE + 1);
  }
}
