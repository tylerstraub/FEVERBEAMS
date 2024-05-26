# FEVERBEAMS

FEVERBEAMS is a Processing 4 application designed to transform a standard digital projector into a beam light show fixture controlled via Open Sound Control (OSC). This project is a complete redesign based on the GitHub repository [/bodgedbutworks/Blaize_V3](https://github.com/bodgedbutworks/Blaize_V3). While not a direct fork, we acknowledge the original author for providing inspiration and foundational code for various Scenes.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Code Overview](#code-overview)
  - [Program Globals](#program-globals)
  - [Settings Dialog](#settings-dialog)
  - [Main Program Loop](#main-program-loop)
  - [Effects](#effects)
  - [OSC Control](#osc-control)
  - [Manual Keyboard Control](#manual-keyboard-control)
- [OSC Interface](#osc-interface)
- [Developer Notes](#developer-notes)
- [License](#license)
- [Credits](#credits)

## Features
- **32 unique scenes**: Each scene creates a different visual effect using the projector.
- **OSC Control**: Full control over the application through OSC messages.
- **Dynamic color and brightness**: Adjust color, brightness, speed, and size of the effects.
- **MultiColor mode**: Toggle between single and multiple colors for effects.
- **Settings dialog**: Configurable settings for resolution, frame rate, and display.

## Installation
1. **Download Processing 4**: Ensure you have Processing 4 installed. Download it from [processing.org](https://processing.org/download).
2. **Clone the Repository**:
    ```sh
    git clone https://github.com/tylerstraub/FEVERBEAMS.git
    ```
3. **Install Dependencies**:
   - Download the `oscP5` and `netP5` libraries from [https://www.sojamo.de/libraries/oscp5/](https://www.sojamo.de/libraries/oscp5/). Follow the instructions on the site to install them in your Processing libraries folder.

## Usage
1. **Open the Project**: Open the `FEVERBEAMS` folder in Processing 4.
2. **Run the Application**: Click the run button in Processing 4.
3. **Configure Settings**: A settings dialog will appear every time you launch the application. Enter your desired settings and click OK.
4. **Control via OSC**: Use an OSC controller to send messages to FEVERBEAMS. See the [OSC Interface](#osc-interface) section for details.

## Code Overview
### Program Globals
The program globals are variables that control various aspects of the visual effects. These include:

- **presetColor**: The main color of the effects.
- **presetSize**: Size parameter affecting the visual elements.
- **presetBrightness**: Brightness level of the effects.
- **presetSpeed**: Speed of animations.
- **presetNumber**: Currently selected effect.
- **multiColor**: Toggle for MultiColor mode.
- **multiColorclr**: Secondary color used in MultiColor mode.
- **shadeAmount**: Controls the shading effect.
- **presetStrobing**: Strobing effect parameter.

### Settings Dialog
The `Settings` class handles user input for initial configuration such as resolution, frame rate, and display settings. The settings dialog is displayed every time the application is launched, allowing users to customize these parameters before the application begins rendering.

### Main Program Loop
The `draw()` function is the main loop of the application. It handles:
- Clearing the screen.
- Applying shading effects.
- Strobing control.
- Invoking the current effect method using Java reflection.

### Effects
FEVERBEAMS includes 32 effects, each defined in its own method (e.g., `effect0()`, `effect1()`, etc.). These methods use Processing's drawing functions to create various visual patterns. Some notable effects are:

- **effect0**: Circular rings with sinusoidal movement.
- **effect1**: Rotating circular rings.
- **effect15**: Radiant Starburst (Custom scene created using ChatGPT).

Each effect method is responsible for its own animation logic, leveraging the global parameters to adjust appearance and behavior dynamically.

### OSC Control
The application uses the `oscP5` library to receive OSC messages. The `oscSetup()` function initializes the OSC server, and the `oscEvent()` function handles incoming messages to update global parameters or switch scenes based on the OSC address patterns.

### Manual Keyboard Control
FEVERBEAMS also supports manual control via keyboard inputs:

- **Color Management**:
  - **Primary Color**: Use arrow keys to cycle through predefined colors.
    - Up Arrow: Next color.
    - Down Arrow: Previous color.
  - **MultiColor Mode**: Press `M` to toggle MultiColor mode.
    - Shift + Up Arrow: Next MultiColor.
    - Shift + Down Arrow: Previous MultiColor.
  
- **Effect Management**:
  - Left Arrow: Previous effect.
  - Right Arrow: Next effect.

- **Parameter Adjustments**:
  - **Size**:
    - `W`: Increase size.
    - `S`: Decrease size.
  - **Speed**:
    - `D`: Increase speed.
    - `A`: Decrease speed.
  - **Brightness**:
    - Shift + Right Arrow: Increase brightness.
    - Shift + Left Arrow: Decrease brightness.
  - **Shade Amount**:
    - `L`: Increase shade.
    - `J`: Decrease shade.
  - **Strobing**:
    - `I`: Increase strobing.
    - `K`: Decrease strobing.

The key bindings offer a quick way to change visual parameters and switch between effects during a live performance or testing.

## OSC Interface
FEVERBEAMS listens for OSC messages on port `42069`. The following addresses are supported:

- `/size [int]`: Set the size of the effects (0-100).
- `/brightness [int]`: Set the brightness (0-100).
- `/speed [int]`: Set the speed of animations (0-100).
- `/shade [int]`: Set the shade amount (0-100).
- `/strobe [int]`: Set the strobing effect (0-100).
- `/multicolor [int]`: Enable (1) or disable (0) MultiColor mode.
- `/head1/r [int]`, `/head1/g [int]`, `/head1/b [int]`: Set RGB values for the primary color.
- `/head2/r [int]`, `/head2/g [int]`, `/head2/b [int]`: Set RGB values for the secondary color in MultiColor mode.
- `/scene [int]`: Switch to a specific scene (0-31).

### Example OSC Commands
- To set the size to 50: `/size 50`
- To change the primary color to red: `/head1/r 255`, `/head1/g 0`, `/head1/b 0`
- To enable MultiColor mode: `/multicolor 1`
- To switch to scene 5: `/scene 5`

## Developer Notes
### Program Logic and Architecture
The design of FEVERBEAMS focuses on modularity and flexibility, enabling dynamic control of visual effects through OSC messages. Here's a deeper look into the architecture:

1. **Settings Initialization**:
   - The `Settings` class collects user input at the start of each session. It determines the screen resolution, frame rate, and whether the application runs in fullscreen or windowed mode. The `getUserInput()` method utilizes a Swing-based dialog to capture these details.

2. **Main Loop (draw())**:
   - The `draw()` function serves as the primary loop where the visual effects are rendered. It begins by clearing the screen with a shade effect and then checks the `presetStrobing` parameter to determine if strobing should occur.
   - The `invokeEffectMethod()` uses Java reflection to dynamically call the current effect method (e.g., `effect0()`, `effect1()`) based on the `presetNumber`.

3. **Effect Methods**:
   - Each effect method (e.g., `effect0()`, `effect1()`, etc.) is responsible for creating a unique visual pattern. These methods leverage Processing's drawing functions such as `ellipse()`, `rect()`, and `line()`. The visual parameters are adjusted using the global variables for color, brightness, size, and speed.

4. **OSC Integration**:
   - The OSC functionality is provided by the `oscP5` library. The `oscSetup()` function initializes the OSC server on port `42069`. Incoming OSC messages are handled by the `oscEvent()` function, which parses the message addresses and updates the corresponding global variables or switches scenes.

5. **Dynamic Color and MultiColor Mode**:
   - The application supports both single-color and multi-color modes. The `multiColor` boolean toggles between these modes, and the `multiColorclr` variable stores the secondary color. The `setStrokeAndFill()` utility function applies the appropriate colors based on the current mode.

6. **Random Initialization**:
   - Some effects utilize arrays of random positions (`ranX` and `ranY`). These arrays are initialized in the `setup()` function to ensure a consistent random distribution across effects.

## License
FEVERBEAMS is released under the GPL-3.0 License. See [LICENSE](LICENSE) for details.

## Credits
- **Original Author**: [bodgedbutworks](https://github.com/bodgedbutworks) for the foundational code in Blaize_V3.
- **Contributor**: [Strauberry](https://github.com/tylerstraub/)

---

Feel free to explore, modify, and create with FEVERBEAMS. Happy beaming!
