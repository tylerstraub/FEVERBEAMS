# FeverBeams
 DOING SCIENCE

Certainly! Here's the documentation for the OSC interface for your FeverBeams application:

## OSC Interface Documentation

### Overview
The OSC (Open Sound Control) interface allows remote control of various parameters of the FeverBeams visualizer application. The following OSC address patterns and their corresponding parameters are supported:

### OSC Address Patterns

- **/size**
  - **Description:** Sets the size of the effect.
  - **Type:** Integer (0-100)
  - **Variable:** `presetSize`

- **/brightness**
  - **Description:** Sets the brightness of the effect.
  - **Type:** Integer (0-100)
  - **Variable:** `presetBrightness`

- **/speed**
  - **Description:** Sets the speed of the effect.
  - **Type:** Integer (0-100)
  - **Variable:** `presetSpeed`

- **/shade**
  - **Description:** Sets the shade amount of the effect.
  - **Type:** Integer (0-100)
  - **Variable:** `shadeAmount`

- **/strobe**
  - **Description:** Sets the strobe effect.
  - **Type:** Integer (0-100)
  - **Variable:** `presetStrobing`

- **/multicolor**
  - **Description:** Enables or disables the multi-color mode.
  - **Type:** Boolean (0 or 1)
  - **Variable:** `multiColor`

- **/head1/r, /head1/g, /head1/b**
  - **Description:** Sets the red, green, and blue components of the preset color.
  - **Type:** Integer (0-255)
  - **Variable:** `presetColor`
  - **Example:**
    - `/head1/r` sets the red component.
    - `/head1/g` sets the green component.
    - `/head1/b` sets the blue component.

- **/head2/r, /head2/g, /head2/b**
  - **Description:** Sets the red, green, and blue components of the multi-color color.
  - **Type:** Integer (0-255)
  - **Variable:** `multiColorclr`
  - **Example:**
    - `/head2/r` sets the red component.
    - `/head2/g` sets the green component.
    - `/head2/b` sets the blue component.

- **/scene**
  - **Description:** Changes the current scene.
  - **Type:** Integer (0-31)
  - **Variable:** `presetNumber`

### Example Usage

To change the size of the effect to 75, send an OSC message to `/size` with an integer value of 75.

To enable the multi-color mode, send an OSC message to `/multicolor` with a value of 1.

To set the preset color to a shade of purple, you could send the following OSC messages:
- `/head1/r` with a value of 128
- `/head1/g` with a value of 0
- `/head1/b` with a value of 128

To switch to scene 5, send an OSC message to `/scene` with an integer value of 5.

### Notes
- The OSC server listens on port `42069`.
- Ensure that the OSC messages are sent to the correct address and port.