OscP5 oscP5;
NetAddress remoteLocation;

void oscSetup() {
  oscP5 = new OscP5(this, 12000);
  remoteLocation = new NetAddress("127.0.0.1", 12000);
}

void oscEvent(OscMessage msg) {
  if (msg.checkAddrPattern("/scene") == true) {
    presetNumber = msg.get(0).intValue();
    println("Switched to effect " + presetNumber);
  }
}
