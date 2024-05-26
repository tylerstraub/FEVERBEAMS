OscP5 oscP5;
NetAddress remoteLocation;

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
  int r = 0, g = 0, b = 0;
  if (addrPattern.endsWith("/r")) {
    r = theOscMessage.get(0).intValue();
  } else if (addrPattern.endsWith("/g")) {
    g = theOscMessage.get(0).intValue();
  } else if (addrPattern.endsWith("/b")) {
    b = theOscMessage.get(0).intValue();
  }

  if (colorType.equals("presetColor")) {
    presetColor = color(r, g, b);
  } else if (colorType.equals("multiColorclr")) {
    multiColorclr = color(r, g, b);
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
