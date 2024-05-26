import oscP5.*;
import netP5.*;
import java.lang.reflect.Method;
import java.awt.GraphicsEnvironment;
import java.awt.GraphicsDevice;
import javax.swing.*;

// Program Globals
int presetColor = color(0, 0, 255);
int presetSize = 50;
int presetBrightness = 100;
int presetSpeed = 30;
int presetNumber = 0;
boolean multiColor = false;
int multiColorclr = color(255, 255, 255);
int shadeAmount = 0;
int presetStrobing = 0;

// Scene Globals for Effects
float v = 0;
int a, b, c, d;
int time;
float[] ranX = new float[1001];
float[] ranY = new float[1001];
float m;

// Program settings dialogue pop up
Settings settings;
boolean doExit = false;

void settings() {
  settings = new Settings();
  settings.getUserInput();
  if (!settings.settingsGathered) {
    doExit = true; // Set the flag to true if settings are not gathered
    return;
  }
  if (settings.windowedMode) {
    size(settings.frameSizeX, settings.frameSizeY);
  } else {
    fullScreen(settings.targetDisplay);
  }
}

// Program launch setup
void setup() {
  surface.setTitle("FEVERBEAMS ALPHA");
  if (doExit) {
    exit(); // Exit the program if the settings dialog was canceled
  }
  if (!settings.windowedMode) {
    surface.setSize(settings.frameSizeX, settings.frameSizeY); // Ensure the size is set correctly after fullScreen
  }
  frameRate(settings.frameRate);
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

// Primary draw loop
void draw() {
  fill(0, map(shadeAmount, 0, 100, 255, 10));
  noStroke();
  rect(0, 0, width, height);

  if (presetStrobing == 0 || frameCount % (int(map(presetStrobing, 1, 100, 30, 1))) == 0) {
    pushMatrix();
    setStrokeAndFill();
    invokeEffectMethod("effect" + presetNumber);
    popMatrix();
  }
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

// Handler for invoking the various scenes
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
