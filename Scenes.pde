// Effect 0: Circular rings with sinusoidal movement
public void effect0() {
  noStroke();
  for (float i = 0; i < 18; i++) {
    if (multiColor && i % 2 == 0) {
      fill(presetColor, presetBrightness * 255 / 100);
    } else if (multiColor) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(width / 2 + ((0.9 * presetSize + 10) * height / 240) * sin(i * v), height / 2 + ((0.9 * presetSize + 10) * height / 240) * cos(i * v), 0.8 * (0.9 * presetSize + 10), 0.8 * (0.9 * presetSize + 10));
    v += float(presetSpeed) / 360000;
  }
}

// Effect 1: Rotating circular rings
public void effect1() {
  noStroke();
  translate(width / 2, height / 2);
  rotate(v);
  v += float(presetSpeed) / 2000;
  for (float i = 0; i < 18; i++) {
    if (multiColor && i % 2 == 0) {
      fill(presetColor, presetBrightness * 255 / 100);
    } else if (multiColor) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(((0.9 * presetSize + 10) * height / 240) * sin(i * PI / 9), ((0.9 * presetSize + 10) * height / 240) * cos(i * PI / 9), 0.8 * (0.9 * presetSize + 10), 0.8 * (0.9 * presetSize + 10));
  }
}

// Effect 2: Three Concentric Rotating Rings
public void effect2() {
  noStroke();
  translate(width / 2, height / 2);
  rotate(v);
  v += float(presetSpeed) / 3000;
  for (float i = 0; i < 18; i++) {
    if (multiColor && i % 2 == 0) {
      fill(presetColor, presetBrightness * 255 / 100);
    } else if (multiColor) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(((0.9 * presetSize + 10) * height / 240) * sin(i * PI / 9), ((0.9 * presetSize + 10) * height / 240) * cos(i * PI / 9), 0.4 * (0.9 * presetSize + 10), 0.4 * (0.9 * presetSize + 10));
  }
  for (float i = 0; i < 18; i++) {
    if (multiColor && i % 2 == 0) {
      fill(presetColor, presetBrightness * 255 / 100);
    } else if (multiColor) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(((0.9 * presetSize + 10) * height / 800) * sin(i * PI / 9), ((0.9 * presetSize + 10) * height / 800) * cos(i * PI / 9), 0.1 * (0.9 * presetSize + 10), 0.1 * (0.9 * presetSize + 10));
  }
  rotate(-2 * v);
  for (float i = 0; i < 18; i++) {
    if (multiColor && i % 2 == 0) {
      fill(presetColor, presetBrightness * 255 / 100);
    } else if (multiColor) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(((0.9 * presetSize + 10) * height / 400) * sin(i * PI / 9), ((0.9 * presetSize + 10) * height / 400) * cos(i * PI / 9), 0.2 * (0.9 * presetSize + 10), 0.2 * (0.9 * presetSize + 10));
  }
}

// Random Linien
public void effect3() {
  strokeWeight(1.4 * presetSize + 10);
  if (multiColor) {
    line(a, b, a + ((c - a) / 3), b + ((d - b) / 3));
    line(a + (2 * (c - a) / 3), b + (2 * (d - b) / 3), c, d);
    stroke(multiColorclr, presetBrightness * 255 / 100);
    line(a + ((c - a) / 3), b + ((d - b) / 3), a + (2 * (c - a)) / 3, b + (2 * (d - b) / 3));
  } else {
    line(a, b, c, d);
  }
  if (millis() - time >= 1000 - 10 * presetSpeed && presetSpeed != 0) {
    time = millis();
    a = int(random(50, width - 50));
    b = int(random(50, height - 50));
    c = int(random(50, width - 50));
    d = int(random(50, height - 50));
  }
}

// Random Ringe groß & schmal
public void effect4() {
  noFill();
  strokeWeight(map(presetSize, 0, 100, 5, 60));
  if (multiColor) {
    for (float l = 0; l <= 7; l++) {
      if (l % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
      arc(a, b, 500, 500, l * PI / 4 + c, (l + 1) * PI / 4 + c, OPEN);
    }
  } else {
    ellipse(a, b, 500, 500);
  }
  if (millis() - time >= 1000 - 10 * presetSpeed && presetSpeed != 0) {
    time = millis();
    a = int(random(150, width - 150));
    b = int(random(150, height - 150));
  }
}
