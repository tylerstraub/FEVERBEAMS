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

// Effect 3: Random Linien
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

// Effect 4: Random Ringe groß & schmal
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

// Effect 5: Sinus
public void effect5() {
  noStroke();
  for (float f = 0; f < width / 16; f++) {
    if (multiColor) {
      if (f % 20 <= 10) {
        fill(presetColor, presetBrightness * 255 / 100);
      } else {
        fill(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    ellipse(16 * f, height / 2 + 4.5 * presetSize * sin(v - f / 15), 70, 70);
    v += float(presetSpeed) / 90000;
  }
}

// Effect 6: Sinus-Blöcke
public void effect6() {
  noStroke();
  for (float f = 0; f < width / 90; f++) {
    if (multiColor) {
      if (f % 2 == 0) {
        fill(presetColor, presetBrightness * 255 / 100);
      } else {
        fill(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    rect(100 * f, 0.45 * height + 100 * sin(v - f / 1) + presetSize * height * 0.005, 60, height / 10);
    rect(100 * f, 0.45 * height - 100 * sin(v - f / 1) - presetSize * height * 0.005, 60, height / 10);
    v += float(presetSpeed) / 15000;
  }
}

// Effect 7: Dreh-Kreuz
public void effect7() {
  strokeWeight(1.5 * presetSize);
  translate(width / 2, height / 2);
  rotate(v);
  v += float(presetSpeed) / 1000;
  if (multiColor) {
    for (float i = 0; i < 10; i++) {
      if (multiColor && i % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else if (multiColor) {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
      line(0, (i - 5) * height / 5, 0, (i - 4) * height / 5);
      line((i - 5) * width / 5, 0, (i - 4) * width / 5, 0);
    }
  } else {
    line(0, -height, 0, height);
    line(-width, 0, width, 0);
  }
}

// Effect 8: Mini-dots-discoball
public void effect8() {
  noStroke();
  translate(width / 2, height / 2);
  rotate(v);
  v += float(presetSpeed) / 5000;
  for (int x = 0; x < 1000; x++) {
    if (multiColor && x > 500) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(ranX[x], ranY[x], presetSize / 8, presetSize / 8);
  }
}

// Effect 9: Random Kreise
public void effect9() {
  noStroke();
  for (int x = 0; x < (presetSize + 10) / 10; x++) {
    if (multiColor && x > presetSize / 20) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(ranX[x], ranY[x], 300 - 2.7 * presetSize, 300 - 2.7 * presetSize);
  }
  if (millis() - time >= 1000 - 9.5 * presetSpeed && presetSpeed != 0) {
    time = millis();
    for (int x = 0; x < (presetSize + 10) / 10; x++) {
      ranX[x] = int(random((300 - 2.7 * presetSize) / 2, width - (300 - 2.7 * presetSize) / 2));
      ranY[x] = int(random((300 - 2.7 * presetSize) / 2, height - (300 - 2.7 * presetSize) / 2));
    }
  }
}

// Effect 10: Random Ringe
public void effect10() {
  noFill();
  strokeWeight(60 - 0.5 * presetSize);
  for (int x = 0; x < (presetSize + 10) / 10; x++) {
    if (multiColor && x > presetSize / 20) {
      stroke(multiColorclr, presetBrightness * 255 / 100);
    }
    ellipse(ranX[x], ranY[x], 500 - 4 * presetSize, 500 - 4 * presetSize);
  }
  if (millis() - time >= 1000 - 9.5 * presetSpeed && presetSpeed != 0) {
    time = millis();
    for (int x = 0; x < (presetSize + 10) / 10; x++) {
      ranX[x] = int(random((300 - 2.7 * presetSize) / 2, width - (300 - 2.7 * presetSize) / 2));
      ranY[x] = int(random((300 - 2.7 * presetSize) / 2, height - (300 - 2.7 * presetSize) / 2));
    }
  }
}

// Effect 11: Scanner seitlich
public void effect11() {
  strokeWeight(1.5 * presetSize);
  translate((width / 2.4) * sin(v) + width / 2, 0);
  v += float(presetSpeed) / 1000;
  if (multiColor) {
    line(0, 0, 0, height / 3);
    line(0, 2 * height / 3, 0, height);
    stroke(multiColorclr, presetBrightness * 255 / 100);
    line(0, height / 3, 0, 2 * height / 3);
  } else {
    line(0, 0, 0, height);
  }
}

// Effect 12: Scanner hoch/runter
public void effect12() {
  strokeWeight(1.5 * presetSize);
  translate(0, (height / 2.4) * sin(v) + height / 2);
  v += float(presetSpeed) / 1000;
  if (multiColor) {
    line(0, 0, width / 3, 0);
    line(2 * width / 3, 0, width, 0);
    stroke(multiColorclr, presetBrightness * 255 / 100);
    line(width / 3, 0, 2 * width / 3, 0);
  } else {
    line(0, 0, width, 0);
  }
}

// Effect 13: 2 Scanner
public void effect13() {
  strokeWeight(1.5 * presetSize);
  translate((width / 2.4) * sin(v * 1.2) + width / 2, (height / 2.4) * sin(v * 0.8) + height / 2);
  v += float(presetSpeed) / 1000;
  if (multiColor) {
    for (float i = 0; i < 10; i++) {
      if (multiColor && i % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else if (multiColor) {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
      line(0, (i - 5) * height / 5, 0, (i - 4) * height / 5);
      line((i - 5) * width / 5, 0, (i - 4) * width / 5, 0);
    }
  } else {
    line(0, -height, 0, height);
    line(-width, 0, width, 0);
  }
}

// Effect 14: PingPong-Kreise
public void effect14() {
  noStroke();
  for (int m = 0; m < (presetSize + 4) / 5; m++) {
    if (multiColor && m > (presetSize + 4) / 10) {
      fill(multiColorclr, presetBrightness * 255 / 100);
    }
    spotlight[m].move();
  }
}

// Effect 15: Radiant Starburst (ChatGPT)
public void effect15() {
  noStroke();
  translate(width / 2, height / 2);
  float angleStep = TWO_PI / 20;
  float maxRadius = 200 * (presetSize / 100.0);
  float minRadius = 50 * (presetSize / 100.0);

  for (float angle = 0; angle < TWO_PI; angle += angleStep) {
    float innerRadius = minRadius + sin(v + angle) * 20;
    float outerRadius = maxRadius + cos(v + angle) * 20;

    for (float r = innerRadius; r < outerRadius; r += 10) {
      float x = r * cos(angle);
      float y = r * sin(angle);

      if (multiColor) {
        fill(
          map(r, innerRadius, outerRadius, 0, 255),
          map(r, innerRadius, outerRadius, 255, 0),
          map(sin(angle + v), -1, 1, 0, 255),
          presetBrightness * 255 / 100
        );
      } else {
        fill(presetColor, presetBrightness * 255 / 100);
      }

      ellipse(x, y, 10, 10);
    }
  }

  v += float(presetSpeed) / 1000;
}

// Effect 16: Multiscanner seitlich
public void effect16() {
  strokeWeight(presetSize);
  for (int r = -4; r <= 4; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(m + r * width / 4, 0, m + r * width / 4, height);
  }
  m = m + float(presetSpeed) / 3;
  if (m >= width - 50) {
    m = -50;
  }
}

// Effect 17: Multiscanner runter
public void effect17() {
  strokeWeight(presetSize);
  for (int r = -4; r <= 4; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(0, m + r * height / 4, width, m + r * height / 4);
  }
  m = m + float(presetSpeed) / 3;
  if (m >= height - 50) {
    m = -50;
  }
}

// Effect 18: Sinus-Mini-Multiscanner seitlich
public void effect18() {
  strokeWeight(80);
  translate(0, (height / 3) * sin(v));
  v += float(presetSpeed) / 5000;
  for (int r = -4; r <= 4; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(m + r * width / 4, map(presetSize, 0, 100, height / 2, 200), m + r * width / 4, map(presetSize, 0, 100, height / 2, height - 200));
  }
  m = m + float(presetSpeed) / 4;
  if (m >= width - 50) {
    m = -50;
  }
}

// Effect 19: Sinus-Mini-Multiscanner runter
public void effect19() {
  strokeWeight(80);
  translate((width / 3) * sin(v), 0);
  v += float(presetSpeed) / 5000;
  for (int r = -4; r <= 4; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(map(presetSize, 0, 100, width / 2, 200), m + r * height / 4, map(presetSize, 0, 100, width / 2, width - 200), m + r * height / 4);
  }
  m = m + float(presetSpeed) / 4;
  if (m >= height - 50) {
    m = -50;
  }
}

// Effect 20: Halbkreise
public void effect20() {
  noFill();
  strokeWeight(presetSize);
  if (multiColor && a < 14) {
    stroke(multiColorclr, presetBrightness * 255 / 100);
  }
  if (a <= 10 && b <= 10) {
    arc(width, height / 2, c, c, v * PI / 50 - HALF_PI, v * PI / 50 + HALF_PI, OPEN);
  } else if (a <= 10 && b > 10) {
    arc(width / 2, height, c, c, v * PI / 50, v * PI / 50 + PI, OPEN);
  } else if (a > 10 && b <= 10) {
    arc(0, height / 2, c, c, v * PI / 50 + HALF_PI, v * PI / 50 + 3 * HALF_PI, OPEN);
  } else if (a > 10 && b > 10) {
    arc(width / 2, 0, c, c, v * PI / 50 - PI, v * PI / 50, OPEN);
  }
  v = v + float(presetSpeed) / 20;
  if (v >= 100) {
    v = 0;
    a = int(random(0, 21));
    b = int(random(0, 21));
    c = int(random(350, height - 50));
  }
}

// Effect 21: Sinus mit Strahlen
public void effect21() {
  noStroke();
  for (float f = 0; f < width / 16; f++) {
    if (f % 14 < 1) {
      fill(multiColorclr, 255);
    } else {
      fill(presetColor, presetBrightness * 255 / 200);
    }
    ellipse(16 * f, height / 2 + 4.5 * presetSize * sin(v - f / 15), 80, 80);
    v += float(presetSpeed) / 90000;
  }
}

// Effect 22: Rotierende Lines
public void effect22() {
  strokeWeight(50 + 0.5 * presetSize);
  translate(width / 2, height / 2);
  rotate(v);
  v += float(presetSpeed) / 3000;
  for (int r = -8; r <= 8; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(m + r * width / 8 - width / 2, -presetSize * height / 200 + 30, m + (r + 1) * width / 8 - width / 2, -presetSize * height / 200 + 30);
  }
  rotate(-2 * v);
  for (int r = -8; r <= 8; r++) {
    if (multiColor) {
      if (r % 2 == 0) {
        stroke(presetColor, presetBrightness * 255 / 100);
      } else {
        stroke(multiColorclr, presetBrightness * 255 / 100);
      }
    }
    line(m + r * width / 8 - width / 2, presetSize * height / 200 - 30, m + (r + 1) * width / 8 - width / 2, presetSize * height / 200 - 30);
  }
  m += 1;
  if (m >= width - 50) {
    m = -50;
  }
}

// Effect 23: Fullscreen-Farbe
public void effect23() {
  noStroke();
  rect(0, 0, width, height);
}

// Effect 24: 4 Scanner-Linien
public void effect24() {
  strokeWeight(0.8 * presetSize);
  line(width / 4 + (presetSize * height / 240) * sin(500 * v), height / 4 - (presetSize * height / 240) * cos(500 * v), width / 4 - (presetSize * height / 240) * sin(500 * v), height / 4 - (presetSize * height / 240) * cos(500 * v));
  line(3 * width / 4 + (presetSize * height / 240) * sin(500 * v), 3 * height / 4 - (presetSize * height / 240) * cos(500 * v), 3 * width / 4 - (presetSize * height / 240) * sin(500 * v), 3 * height / 4 - (presetSize * height / 240) * cos(500 * v));
  if (multiColor) {
    stroke(multiColorclr, presetBrightness * 255 / 100);
  }
  line(3 * width / 4 - (presetSize * height / 240) * sin(500 * v), height / 4 + (presetSize * height / 240) * cos(500 * v), 3 * width / 4 - (presetSize * height / 240) * sin(500 * v), height / 4 - (presetSize * height / 240) * cos(500 * v));
  line(width / 4 - (presetSize * height / 240) * sin(500 * v), 3 * height / 4 + (presetSize * height / 240) * cos(500 * v), width / 4 - (presetSize * height / 240) * sin(500 * v), 3 * height / 4 - (presetSize * height / 240) * cos(500 * v));
  v += float(presetSpeed) / 360000;
}

// Effect 25: 4 rotierende Linien
public void effect25() {
  strokeWeight(0.8 * presetSize);
  line(width / 4 + (presetSize * height / 240) * sin(500 * v), height / 4 + (presetSize * height / 240) * cos(500 * v), width / 4 - (presetSize * height / 240) * sin(500 * v), height / 4 - (presetSize * height / 240) * cos(500 * v));
  line(3 * width / 4 + (presetSize * height / 240) * sin(500 * v), 3 * height / 4 + (presetSize * height / 240) * cos(500 * v), 3 * width / 4 - (presetSize * height / 240) * sin(500 * v), 3 * height / 4 - (presetSize * height / 240) * cos(500 * v));
  if (multiColor) {
    stroke(multiColorclr, presetBrightness * 255 / 100);
  }
  line(3 * width / 4 + (presetSize * height / 240) * cos(500 * v), height / 4 + (presetSize * height / 240) * sin(500 * v), 3 * width / 4 - (presetSize * height / 240) * cos(500 * v), height / 4 - (presetSize * height / 240) * sin(500 * v));
  line(width / 4 + (presetSize * height / 240) * cos(500 * v), 3 * height / 4 + (presetSize * height / 240) * sin(500 * v), width / 4 - (presetSize * height / 240) * cos(500 * v), 3 * height / 4 - (presetSize * height / 240) * sin(500 * v));
  v += float(presetSpeed) / 360000;
}

// Effect 26: 4 rotierende Kreis-Ringe
public void effect26() {
  noStroke();
  for (int r = 0; r <= 3; r++) {
    pushMatrix();
    switch (r) {
    case 0:
      translate(width / 4, height / 4);
      rotate(v);
      break;
    case 1:
      translate(3 * width / 4, height / 4);
      rotate(-v);
      break;
    case 2:
      translate(width / 4, 3 * height / 4);
      rotate(-v);
      break;
    case 3:
      translate(3 * width / 4, 3 * height / 4);
      rotate(v);
      break;
    }
    for (float i = 0; i < 18; i++) {
      if (multiColor && i % 2 == 0) {
        fill(presetColor, presetBrightness * 255 / 100);
      } else if (multiColor) {
        fill(multiColorclr, presetBrightness * 255 / 100);
      }
      ellipse(((presetSize * 0.6 + 3) * height / 120) * sin(i * PI / 9), ((presetSize * 0.6 + 3) * height / 120) * cos(i * PI / 9), 0.5 * presetSize + 6, 0.5 * presetSize + 6);
    }
    popMatrix();
  }
  v += float(presetSpeed) / 4000;
}

// Effect 27: 4 crazy Kreis-Ringe
public void effect27() {
  noStroke();
  for (int xx = 0; xx <= 1; xx++) {
    for (int yy = 0; yy <= 1; yy++) {
      rotate(v);
      v += float(presetSpeed) / 20000;
      for (float i = 0; i < 18; i++) {
        if (multiColor && i % 2 == 0) {
          fill(presetColor, presetBrightness * 255 / 100);
        } else if (multiColor) {
          fill(multiColorclr, presetBrightness * 255 / 100);
        }
        ellipse((2 * xx + 1) * (width / 4) + ((presetSize + 40) * height / 240) * sin(i * PI / 9), (2 * yy + 1) * (height / 4) + ((presetSize + 40) * height / 240) * cos(i * PI / 9), 0.3 * (presetSize + 40), 0.3 * (presetSize + 40));
      }
    }
  }
}

// Effect 28: Kreisring-spot-scan-Dings
public void effect28() {
  noStroke();
  translate(width / 2, height / 2);
  ellipse(-presetSize * ((width - 45) / 250) * cos(v), presetSize * ((height - 45) / 250) * sin(v), 45, 45);
  if (multiColor) {
    fill(multiColorclr, presetBrightness * 255 / 100);
  }
  ellipse(presetSize * ((width - 60) / 190) * cos(v), presetSize * ((height - 60) / 190) * sin(v), 60, 60);
  v += float(presetSpeed) / 800;
}

// Effect 29: Tunnelrechteck
public void effect29() {
  noFill();
  translate(width / 2, height / 2);

  if (m >= 110) {
    strokeWeight(max(0, (presetSize + 1) * (220 - m) / 110));
    stroke(multiColorclr, presetBrightness * 255 / 100);
    rect(-(220 - m) * width / 200, -(220 - m) * height / 200, max(0, (220 - m) * width / 100), max(0, (220 - m) * height / 100));
  } else {
    strokeWeight((presetSize + 1) * m / 110);
    rect(-m * width / 200, -m * height / 200, m * width / 100, m * height / 100);
  }

  m += float(presetSpeed) / 40;
  if (m >= 220) {
    m = 0;
  }
}

// Effect 30: Dot-Scanner
public void effect30() {
  noStroke();
  for (int i = 0; i <= 9; i++) {
    for (int j = 0; j <= 9; j++) {
      if (multiColor) {
        if ((i + j) % 2 == 0) {
          fill(presetColor, constrain(-100 + 355 * sin(v + 31 * float(i + j)), 0, presetBrightness * 255 / 100));
        } else {
          fill(multiColorclr, constrain(-100 + 355 * sin(v + 31 * float(i + j)), 0, presetBrightness * 255 / 100));
        }
      } else {
        fill(presetColor, constrain(-100 + 355 * sin(v + 31 * float(i + j)), 0, presetBrightness * 255 / 100));
      }

      ellipse(i * width / 10 + width / 30, j * width / 10 + width / 30, map(presetSize, 0, 100, 10, width / 18), map(presetSize, 0, 100, 10, width / 18));
    }
  }
  v += float(presetSpeed) / 1200;
}

// Effect 31: QuadPhaseLED
public void effect31() {
  int LEN = 5 * height / 40;
  rectMode(CORNERS);
  noStroke();
  for (int b = 0; b <= 2; b++) {
    float BRIGHT = presetBrightness;
    final float THRESH = 0.2;
    final float BLINKSPD = 3.0;
    pushMatrix();
    switch (b) {
    case 0:
      translate(14 * width / 40, 4 * height / 12);
      rotate(v);
      if (sin(BLINKSPD * v) > THRESH) {
        BRIGHT = map(sin(BLINKSPD * v), THRESH, 1.0, 100, 0);
      }
      break;
    case 1:
      translate(26 * width / 40, 4 * height / 12);
      rotate(v);
      if (sin(BLINKSPD * v + 2 * PI / 3) > THRESH) {
        BRIGHT = map(sin(BLINKSPD * v + 2 * PI / 3), THRESH, 1.0, 100, 0);
      }
      break;
    case 2:
      translate(width / 2, 8 * height / 12);
      rotate(v);
      if (sin(BLINKSPD * v + 4 * PI / 3) > THRESH) {
        BRIGHT = map(sin(BLINKSPD * v + 4 * PI / 3), THRESH, 1.0, 100, 0);
      }
      break;
    }

    for (int e = 0; e <= 4; e++) {
      for (int f = 0; f <= 4; f++) {
        if (!(e == 0 && f == 0) && !(e == 4 && f == 0) && !(e == 0 && f == 4) && !(e == 4 && f == 4) && !(e == 2 && f == 2)) {
          drawQuadLED(LEN * e - 2 * LEN, LEN * f - 2 * LEN, round(BRIGHT * presetBrightness / 100));
        }
      }
    }
    popMatrix();
  }

  v += map(float(presetSpeed), 0, 100, -0.06, 0.06);
  rectMode(CORNER);
}
