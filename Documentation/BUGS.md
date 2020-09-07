# Known Bugs

**Overview**\
This document describes all known bugs that are found in ScreenTrack.

## Contents

- [Audio Bug](#audio-bug)
- [Exit Bug](#exit-bug)
- [Duplicate User Permission Bugs](#duplicate-user-permission-bugs)
- [Cannot Force Quit](#force-quit-bug)
- [Menu Visual Bug](#menu-visual-bug)

### Audio Bug

**Description**\
There are random "permission denied" sound effects when application running.

**Cccurrences**

1. Scrolling (documents, web pages)

### Exit Bug

**Description**\
Program cannot exit properly (infinite loading bug upon exit).
Occured when I did not give certain permissions to ScreenTrack\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Bug%20Images/Exit%201.png" width="550" alt="Exit Bug 1" />
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Bug%20Images/Exit%202.png" width="450" alt="Exit Bug 2" />

### Duplicate User Permission Bugs

**Description**\
The program would ask for the same user permission multiple times

### Force Quit Bug

**Description**\
Cannot force quit the application using Activity Monitor.
Unsure if this is because the program is being run by xcode or not.

### Menu Visual Bug
**Description**\
The menu bar closes when not hovering the screen track menu. The following screenshot shows the top of my screen when I stop hovering screentrack.\
<img src="https://github.com/lisongh10/screentrack/blob/master/Documentation/Images/Bug%20Images/Menu%20Visual%201.png" width="550" alt="Menu Visual Bug 1">
