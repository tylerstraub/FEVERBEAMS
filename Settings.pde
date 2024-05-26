class Settings {
  static final int DEFAULT_FRAME_WIDTH = 1920;
  static final int DEFAULT_FRAME_HEIGHT = 1080;
  static final int OSC_PORT = 42069;
  static final int DEFAULT_FRAME_RATE = 60;

  int frameSizeX;
  int frameSizeY;
  int targetDisplay;
  int osc_port;
  int frameRate;
  boolean windowedMode;

  Settings() {
    this.frameSizeX = DEFAULT_FRAME_WIDTH;
    this.frameSizeY = DEFAULT_FRAME_HEIGHT;
    this.targetDisplay = 0;
    this.osc_port = OSC_PORT;
    this.frameRate = DEFAULT_FRAME_RATE;
    this.windowedMode = false;
  }

  void getUserInput() {
    JTextField monitorField = new JTextField(5);
    JTextField widthField = new JTextField(5);
    JTextField heightField = new JTextField(5);
    JTextField frameRateField = new JTextField(5);
    JCheckBox windowedModeCheckBox = new JCheckBox("Windowed Mode");

    JPanel panel = new JPanel();
    panel.add(new JLabel("Monitor:"));
    panel.add(monitorField);
    panel.add(new JLabel("Width:"));
    panel.add(widthField);
    panel.add(new JLabel("Height:"));
    panel.add(heightField);
    panel.add(new JLabel("Frame Rate:"));
    panel.add(frameRateField);
    panel.add(windowedModeCheckBox);

    int result = JOptionPane.showConfirmDialog(null, panel, "Enter Monitor and Resolution", JOptionPane.OK_CANCEL_OPTION);
    if (result == JOptionPane.OK_OPTION) {
      targetDisplay = parseOrDefault(monitorField.getText(), 0);

      GraphicsDevice[] screens = GraphicsEnvironment.getLocalGraphicsEnvironment().getScreenDevices();
      if (targetDisplay >= screens.length) targetDisplay = 0;  // Default to monitor 0 if out of range

      GraphicsDevice screen = screens[targetDisplay];
      frameSizeX = parseOrDefault(widthField.getText(), screen.getDisplayMode().getWidth());
      frameSizeY = parseOrDefault(heightField.getText(), screen.getDisplayMode().getHeight());
      frameRate = parseOrDefault(frameRateField.getText(), DEFAULT_FRAME_RATE);
      windowedMode = windowedModeCheckBox.isSelected();
    } else {
      setDefaultValues();
    }
  }

  int parseOrDefault(String input, int defaultValue) {
    try {
      return Integer.parseInt(input);
    }
    catch (NumberFormatException e) {
      return defaultValue;
    }
  }

  void setDefaultValues() {
    targetDisplay = 0;
    frameSizeX = DEFAULT_FRAME_WIDTH;
    frameSizeY = DEFAULT_FRAME_HEIGHT;
    frameRate = DEFAULT_FRAME_RATE;
    windowedMode = false;
  }
}
