# Hammerspoon Ultrawide

A window management configuration for [Hammerspoon](http://www.hammerspoon.org) focused on usage with ultrawide monitors and keybinds.

![Hammerspoon Ultrawide demo video](https://github.com/lkshrk/hammerspoon-ultrawide/blob/main/images/full.gif?raw=true)

## Installation

#### Step 1

Install Hammerspoon using brew:
```bash
brew install hammerspoon 
```

#### Step 2

Make sure Hammerspoon is started (You should see the a Hammerspoon logo in your menubar).

Download the latest release [Ultrawide spoon](https://github.com/lkshrk/hammerspoon-ultrawide/releases/latest). Unzip it and open the spoon.

Hammerspoon should prompt that the newly installed spoon is now available.

#### Step 3

Click on the Hammerspoon menubar icon and click on 'Open Config'. An `init.lua` file should now open in your editor of choice.

Paste the following configuration in the `init.lua` file, save it and close it.

```lua
hs.loadSpoon("ultrawide")
spoon.ShiftIt:bindHotkeys({})
```

Click on the Hammerspoon menubar icon again, and click on 'Reload Config'.


## Usage (default keys)

### Snap to sides

- `ctrl(^) + alt(⌥) + cmd(⌘) + left` Snap current window to the left fourth to the screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + right` Snap current window to the right fourth to the screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + m` Snap current window to the center half of the screen

### Split to corners

- `ctrl(^) + alt(⌥) + cmd(⌘) + 1` Snap current window to the left top eigth to the screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + 2` Snap current window to the right top eigth to the screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + 3` Snap current window to the left bottom eigth to the screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + 4` Snap current window to the right bottom eigth to the screen


### Change height

- `ctrl(^) + alt(⌥) + cmd(⌘) + up` Keep the current width, but changes window position to top half
- `ctrl(^) + alt(⌥) + cmd(⌘) + down` Keep the current width, but changes window position to bottom half


### Other

- `ctrl(^) + alt(⌥) + cmd(⌘) + C` Centralize current window
- `ctrl(^) + alt(⌥) + cmd(⌘) + Z` Toggle zoom for current window
- `ctrl(^) + alt(⌥) + cmd(⌘) + N` Move current window to next screen
- `ctrl(^) + alt(⌥) + cmd(⌘) + P` Move current window to previous screen


## Configuration

The default key mapping looks like this:

```lua
obj.mash = { 'ctrl', 'alt', 'cmd', 'shift' }
obj.mapping = {
  left = { obj.mash, 'left' },
  right = { obj.mash, 'right' },
  up = { obj.mash, 'up' },
  down = { obj.mash, 'down' },
  upleft = { obj.mash, '1' },
  upright = { obj.mash, '3' },
  botleft = { obj.mash, '2' },
  botright = { obj.mash, '4' },
  maximum = { obj.mash, 'm' },

  toggleZoom = { obj.mash, 'z' },
  center = { obj.mash, 'c' },

  nextScreen = { obj.mash, 'n' },
  previousScreen = { obj.mash, 'p' }
}
```

### Overriding key mappings

To change your modifier keys you can edit the `ob.mash` values, otherwise change the mappings. For example to change the modifier key to F18 and snap left with l:

```lua
obj.mash = { 'F18'}
obj.mapping = {
    left = {obj.mash, 'l'},
    ...
}
```


## Credits

Credits to [@peterklijn](https://github.com/peterklijn) for [shiftit spoon](https://github.com/peterklijn/hammerspoon-shiftit), which was foundation of this project.