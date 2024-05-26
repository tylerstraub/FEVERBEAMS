import oscP5.*;
import netP5.*;
import java.lang.reflect.Method;
import java.util.ArrayList;

// Program Globals
float v = 0;
int presetColor = color(0, 0, 255);
int presetSize = 50;
int presetBrightness = 100;
int presetSpeed = 30;
int presetNumber = 0;
boolean multiColor = true;
int multiColorclr = color(255, 255, 255); // Default to white, adjust as necessary

// Scene Globals
int a, b, c, d;
int time;

// Additional Globals for Effects
float[] ranX = new float[1001];
float[] ranY = new float[1001];
float m;

boolean drawTranslateMode = false;
kreis[] spotlight = new kreis[101];
ArrayList<PVector> presetPos = new ArrayList<>();

void setup() {
  size(800, 600);
  frameRate(60);
  oscSetup();
  ellipseMode(CENTER);

  // Initialize random positions for effects
  for (int i = 0; i < ranX.length; i++) {
    ranX[i] = random(width);
    ranY[i] = random(height);
  }

  // Initialize spotlights for effect14
  for (int i = 0; i < spotlight.length; i++) {
    spotlight[i] = new kreis();
  }
}

void draw() {
  background(0);
  pushMatrix();  // Save the current transformation matrix
  setStrokeAndFill();  // Ensure stroke and fill are set before drawing
  invokeEffectMethod("effect" + presetNumber);
  popMatrix();   // Restore the previous transformation matrix
}

// Utility functions for stroke and fill
void setStrokeAndFill() {
  if (multiColor) {
    stroke(multiColorclr, presetBrightness * 255 / 100);
    fill(multiColorclr, presetBrightness * 255 / 100);
  } else {
    stroke(presetColor, presetBrightness * 255 / 100);
    fill(presetColor, presetBrightness * 255 / 100);
  }
}

void invokeEffectMethod(String effectName) {
  try {
    Method effectMethod = getClass().getMethod(effectName);
    effectMethod.invoke(this);
  }
  catch (NoSuchMethodException e) {
    println("Effect not found: " + effectName);
  }
  catch (IllegalAccessException e) {
    println("Illegal access to effect method: " + effectName);
  }
  catch (java.lang.reflect.InvocationTargetException e) {
    println("Error invoking effect method: " + effectName);
    e.printStackTrace();
  }
}

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

// Define a kreis class if necessary
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
