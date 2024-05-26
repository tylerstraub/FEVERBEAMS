import oscP5.*;
import netP5.*;
import java.lang.reflect.Method;

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

void setup() {
  size(800, 600);
  frameRate(60);
  oscSetup();
  ellipseMode(CENTER);
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
  } catch (NoSuchMethodException e) {
    println("Effect not found: " + effectName);
  } catch (IllegalAccessException e) {
    println("Illegal access to effect method: " + effectName);
  } catch (java.lang.reflect.InvocationTargetException e) {
    println("Error invoking effect method: " + effectName);
    e.printStackTrace();
  }
}
