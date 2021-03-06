# Menu User Interface

**Overview**\
This document describes the user interface for ScreenTrack's _Menu_.

## Content
- [Old Menu](#old-menu)
- [Apple's Menus](#apples-menus)
- [macOS Big Sur](#macos-big-sur)
- [Sketch and Related Design Principles](#sketch)
- [Updated Design After Feedback](#updated-design-after-feedback)

## Old Menu
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/ScreenTrack.png" width="550" alt="Screen Track Menu">

__Issues__
1. The menu should __NOT__ be a table (the information and controls are all presented to the user at the same time)
2. Unorganized
3. Menus should __NOT__ utilize _standard buttons_
4. Requires Users to type in the menu
5. Out of date styles (scrollers, checkboxes)

## Apple's Menus
The following are Apple's designs for macOS menu interfaces.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Audios.png" width="300" alt="Audio Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Bluetooth.png" width="300" alt="Bluetooth Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Power.png" width="300" alt="Power Menu Interface">

__Relavent Design Principles from Apple__
1. Menus are one column
2. Controls and details are offloaded to side bars
3. Sections are clearly identified concise in purpose
4. Menus should __NOT__ involve typing
5. Standard buttons should __NOT__ be used in menus 
6. Checkmarks are used instead of checkboxes
7. There is __ALWAYS__ leading padding no matter the application

## macOS Big Sur
__Overview__\
macOS Big Sur is the next macOS update. The following screen shots are updated menu designs by Apple.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Calendar-BigSur.png" width="180" alt="Calender Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Configurations-BigSur.png" width="180" alt="Configurations Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Display-BigSur.png" width="180" alt="Display Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/Power-BigSur.png" width="180" alt="Power Menu Interface">
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu%20UI%20Images/WiFi-BigSur.png" width="180" alt="WiFi Menu Interface">

Most of these are stylistic updates __except__ Configurations Menu which is now a table resembling an iOS device's menu.

__Changes That may affect ScreenTrack__\
Apple is switching to a __SwiftUI__ based development slowly but surely. Consider developing ScreenTrack and related functionalities in SwiftUI instead for more supported and updated functionalities by Apple.

SwiftUI runs on macOS 10.15+

__Questions__
- What macOS versions do we support (macOS 10.15 is the dominating majority)
- macOS Big Sur is scheduled to release in late 2020.
- What is the best approach when designing the UI (since standard UI components are to be updated very soon by Apple)

## Sketch
__Overview__\
The following sketch is created to fix previously mentioned issues (refer to [Old Menu - Issues](#old-menu)). Note that the buttons in the sketch are purely for showcasing purposes and should actually not be _standard buttons_.

Also note that the user should __NOT__ type in the menu. I personally think that the textfields should be replaced with scrollers but I need more feedback.


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
    - The bottom section is modeled after _WiFi_ (Note that my design shows buttons - this is purely for showcasing and will not actually be buttons. This is because buttons should __NOT__ be used in menu windows. Instead, "navigation links" should be used as buttons. Refer to Apple's designs (there are no buttons).

## Updated Design After Feedback
__Overview__\
The following design is derived from the [sketch above](#sketch) and is improved with feedback from Dr. Lee.

__Feedback__
- Actions buttons should be at the top
- Show current user settings in the menu by default
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Menu-v2.png" width="300" alt="ScreenTrack Menu Version 2">

__Note that this menu was created on macOS Big Sur.__
