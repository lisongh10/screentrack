# Main User Interface

**Overview**\
This document describes the redesigning process of the main user interface or the _screenshot player interface_

## Contents

- [Old Design](#old-design)
- [New Design Guidelines](#design-guidelines)
- [Sketch](#sketch)
- [Rationale for the Sketch](#rationales-for-the-sketch)
- [Feedback](#feedback)

## Old Design
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/ScreenTrack.png" width="100%" alt="ScreenTrack">

**Minor Issues**
1. Does not need a **Close** button to close the application
2. Menus are _usually_ on the left side for consistency reasons (though this can be a design choice)
3. Debatable choice for having **Play Speed** section

**Major Issues**
1. The lack of Dock menu prevents users from switching screens with the Main Menu open
2. **Massive** window sizing issue (I assume it's from the lack of constraints in the storyboard design)
3. Unintuitive screenshot player design

## Design Guidelines

**Overview**\
The _Design Guidelines_ section will describe relavent principles in macOS software development that I believe will be useful for ScreenTrack. To keep this documentation short, I will only describe relavent guidelines.

[Human Interface Guidlines By Apple](https://developer.apple.com/design/human-interface-guidelines/)

<span><img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/App%20Store.png" width="45%" alt="Example macOS application"/>
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/Books.png" width="45%" alt="Example macOS application"/>
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/Calendar.png" width="45%" alt="Example macOS application"/>
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/Reminder.png" width="45%" alt="Example macOS application"/> </span>

**macOS Design Themes**

- Flexible
- Expansive
- Focused
- Capable

**Flexible**\
This is currently a issue with ScreenTrack because the main interface is **definitely not** flexible. ScreenTrack should ideally offer configurable preferences, customizable interfaces, and alternate ways of completing tasks. Resizing is easy, the interface should be _responsive_.

Tasks can be initiated from toolbars, menus, controls, keyboard shortcuts, the Touch Bar, accessibility features, and more.

The **problem** is that making apps flexible takes noticibly longer so I would recommend leaving this guideline for last in development.

**Expansive** (not sure if this will be useful)\
ScreenTrack does not support large, high-resolution displays that are typical for most Mac users. Additionally, people often exten their workspace by connecting multiple displays.

The issue is that ScreenTrack does not offer utility when it comes to itnerface components like tabs, sidebars, sheets, panels, and full-screen mode.

ScreenTrack is not meant to be a stand-alone software. It is always used with other applications, **but** is it used in parallel or stack-wise

**Focused**\
I think currently, ScreenTrack does a decent job of this. The main focus of the Main Interface is the screenshot image.

To further expand on the theme of _focused_. We can also make the screenshot the **entire window** ([refer to wireframe 2](#wire-frame-2))

**Capable** (irrelavent)

## Sketch

### Wire Frame 1
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/Main%20Wireframe%201.png" width="100%" alt="Wireframe 1"/>

### Wire Frame 2
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Main%20UI%20Images/Main%20Wireframe%202.png" width="100%" alt="Wireframe 2"/>

## Rationales for the Sketch

**Scroll Bar**\
The scroll bar is what I would assume to be one of the most used functionalities in ScreenTrack. Based on this assumption, I made the scroll bar more prominent in the user interface.

Instead of a typical scroll used to adjust _values_, the ScreenTrack scroll bar is actually a _video scrubber_. Though this only simulates a video by connecting numerous screen shots together.

Previously, the scroll bar acts as a **progress bar** as well. It shows the user _how far_ into the work session they are by highlighting the _past_ in blue. This is arguably good or bad.

- It is good because it can help the user stay organized on where they are in their session.
- It is bad because making the ScreenTrack a video progress player defeats the purpose of **Focused** in the design guidelines.

**User Interaction and User Experience**\
Previously, the user can can only do the following tasks

- Scroll to a screenshot using a scroll bar
- Open materials using buttons
- Select date

We can make user interactions more efficient by replacing the scroll bar with a _video editing_ style collage scroll bar.

Additionally, we have the following functionalities for improved UX/UI

- While the cursor is on the **Main Image**,
  - Scroll forward and backward
    - Using mouse scroller
    - Using trackpad two finger drag gesture
  - Open main application
    - Left click the **Main Image**
- While the cursor in on the **Preview Scroll Bar**
  - Scroll forward and backward
    - Using mouse scroller
    - Using trackpad two finger drag gesture
  - Select preferred Screenshot
    - Left click the **Preview Image**

**Preview Scroll Bar Mechanism**
The **Current Preview** is highlighted on the **Preview Scroll Bar** which corresponds to the **Main Image** Content.

The highlighted preview **Positioning** will be constant on the **Preview Scroll Bar** while scrolling

**Calendar**\
The issue with the current date picker is that it is **unintuitive** and **hard to use**.

The user must first select the correct month, then select the correct date, then selected the correct year. Each of these will change the **Main Interface** content.

Instead I propose making the date picker a calendar instead. The user would have to perform one action. Click on the date. In the worst scenario, the user changes the month, then select a date.

**Side Bar**\
The side bar will largely remain the same with **quality of life changes** such as organizational updates only.

**Wireframe 2 Rationale**\
Wireframe 2 expands on the **Focused** design guideline. Wireframe 2 has the advantage of maximizing the user's focus on the current screenshot.

Instead of having a side bar which shows all the information related to the current screenshot, wireframe 2 proposes that those information be hidden. The user instead clicks on the screen to open those.

**Wireframe 2 Disadvantage**
Users with more technical experience will not have information if they want to see them.

**Wireframe 1 and 2 Compromise**\
Combine wireframe 1 and 2 so that users can have both the design of 1 and 2. Wireframe 2 would simply have a side panel pop open. Conversly, wireframe 1 would have it's side panel temporarily hidden.

**Compromise Disadvantage**\
This feature will **Definitely** take longer to code. If we not in any rush, I prefer trying this compromise.

## Feedback
- Allowing users to click the image to open up files/urls may be confusing because only the frontmost application is navigable
- Consider using a vertical line as an indicator for preview scroller
- Truncating previews in the scroller should be improved such that users can still use visual cues
- Consider a global slider implementation in addition to the preview scroller
- Give the user a sense of time in their work day
- Move calendar to the top of the side bar
