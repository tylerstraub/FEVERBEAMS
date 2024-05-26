OscP5 oscP5;
NetAddress remoteLocation;

// Variables to hold the current RGB values for presetColor and multiColorclr
int presetColorR = 0;
int presetColorG = 0;
int presetColorB = 255;

int multiColorclrR = 255;
int multiColorclrG = 255;
int multiColorclrB = 255;

void oscSetup() {
  oscP5 = new OscP5(this, 42069);
  remoteLocation = new NetAddress("127.0.0.1", 42069);
}

void oscEvent(OscMessage theOscMessage) {
  String addrPattern = theOscMessage.addrPattern();

  if (addrPattern.equals("/size")) {
    presetSize = theOscMessage.get(0).intValue();
  } else if (addrPattern.equals("/brightness")) {
    presetBrightness = theOscMessage.get(0).intValue();
  } else if (addrPattern.equals("/speed")) {
    presetSpeed = theOscMessage.get(0).intValue();
  } else if (addrPattern.equals("/shade")) {
    shadeAmount = theOscMessage.get(0).intValue();
  } else if (addrPattern.equals("/strobe")) {
    presetStrobing = theOscMessage.get(0).intValue();
  } else if (addrPattern.equals("/multicolor")) {
    multiColor = theOscMessage.get(0).intValue() == 1;
  } else if (addrPattern.startsWith("/head1")) {
    handleColorChange(theOscMessage, addrPattern, "presetColor");
  } else if (addrPattern.startsWith("/head2")) {
    handleColorChange(theOscMessage, addrPattern, "multiColorclr");
  } else if (addrPattern.equals("/scene")) {
    handleSceneChange(theOscMessage);
  } else {
    println("Unknown OSC address pattern: " + addrPattern);
  }
}

void handleColorChange(OscMessage theOscMessage, String addrPattern, String colorType) {
  if (colorType.equals("presetColor")) {
    if (addrPattern.endsWith("/r")) {
      presetColorR = theOscMessage.get(0).intValue();
    } else if (addrPattern.endsWith("/g")) {
      presetColorG = theOscMessage.get(0).intValue();
    } else if (addrPattern.endsWith("/b")) {
      presetColorB = theOscMessage.get(0).intValue();
    }
    presetColor = color(presetColorR, presetColorG, presetColorB);
  } else if (colorType.equals("multiColorclr")) {
    if (addrPattern.endsWith("/r")) {
      multiColorclrR = theOscMessage.get(0).intValue();
    } else if (addrPattern.endsWith("/g")) {
      multiColorclrG = theOscMessage.get(0).intValue();
    } else if (addrPattern.endsWith("/b")) {
      multiColorclrB = theOscMessage.get(0).intValue();
    }
    multiColorclr = color(multiColorclrR, multiColorclrG, multiColorclrB);
  }
}

void handleSceneChange(OscMessage theOscMessage) {
  int sceneNumber = theOscMessage.get(0).intValue();
  if (sceneNumber >= 0 && sceneNumber < 32) {
    presetNumber = sceneNumber;
    println("Current effect: " + presetNumber);
  } else {
    println("Scene number out of range: " + sceneNumber);
  }
}
