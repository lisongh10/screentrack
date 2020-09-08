# Menu User Interface

**Overview**\
This document describes the user interface for ScreenTrack's _Menu_.

Firstly, this is the ScreenTrack menu as of September, 6 2020.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/ScreenTrack.png" width="550" alt="Screen Track Menu">

There are a few problems with the interface design. The standard and convention set by Apple shows that macOS menu interfaces should only have one column.

The following are Apple's designs for macOS menu interfaces.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Audios.png" width="300" alt="Audio Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Bluetooth.png" width="300" alt="Bluetooth Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Power.png" width="300" alt="Power Menu Interface">

I have created the following wireframe for ScreenTrack's Menu Interface.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/ScreenTrack%20Wireframe.png" width="500" alt="ScreenTrack Menu Wireframe">

The following are the design principles and standards that I utilized in the redesign:
1. Standard Convention - all of Apple's menus are one column wide. ScreenTrack's menu should follow the same standard.
2. The Menu and the Main window (Time-lapse window) should not have the same theme/design/layout. Look at the main window and compare it to the menu window for bluetooth and any other Apple programs.
3. Sections are clear and concise and has one focus for operation. My design has three sections each separated by a thin divider as in other Apple menu designs.
    - The top section consists of the _detail controls_ (screen shot interval and days to store) - the controls are offloaded to side bars like Apple's bluetooth menu.
    - The middle section consists of the _image quality control_ and the corresponding estimated storage usage.
    - The bottom section consists of _actions_ (Record, Open, Quit)
4. Modern and up to date symbols/icons
    - The top section and its corresponding side bars are modeled after _Bluetooth_ and _WiFi_
    - The middle section is modeled after _Audio_
    - The bottom section is modeled after _WiFi_ (Note that my design shows buttons - this is purely for showcasing and will not actually be buttons. This is because buttons should __not__ be used in menu windows. Instead, "navigation links" should be used as buttons. Refer to Apple's designs (there are no buttons).
