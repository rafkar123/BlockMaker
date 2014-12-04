# Block-Maker: GO
## Overview
Create "blocks" that perform certain actions when touched.

Documentation on the config and the plugin's features will be listed here.
###Commands:
- sm_blockmaker - will bring up the Block-Maker easy menu
- sm_createblock <args> - advanced command of creating a custom block outside of the menu boundaries (root cmd)

###Blocks:
There will be some default types of blocks and later on, as the plugin develops more types will be added on
####Type Ideas:
- Bhop
- Longjump
- Trampoline
- Forward Jump

##Config
###Cvars:
- sm_blockmaker_enabled 1/0 - 0 will disable this mod (it's more recommended to disable the plugin instead.)

Unlike other plugins the convars in this one will be handled in a key-value. The convars in that are in the Key-Value shouldn't need to be changed during a game.
- This will be added on once more ideas are introduced to the plugin.


###Templates:
- Solid - just a solid block
- Glass - solid block that is transparent
- Bhop - dissapears and reappears after a short time
- LongJump - Dissapears at a slower rate, reappears after a short time.
- Trampoline - Pushes the player upwards by X times player velocity.
- Forward Jump Boost - Pushes the player forward by X times player velocity.
- More soon!

##Make your own template!
- name - This is what is displayed to the player.
- model - What the model path to the block is
- offset - Offset of the block when it is placed. (def: "0.0 0.0 0.0")
- rotation - default rotation of the block when it is place in the map.
- skin - if there is an extra skin on the model you want.
- color - initial color of the block
- seccolor - color of the block it turns into when the action is performed.
- ^^^^^2 - adding an increasing number will parent a new prop to the entity
- collision2 - an extra property will make the prop that is parented to the block no collidable.
- type - certain type that is accessible in the Block-Maker version (see below)
- arg - if the type asks for an argument (usually does)

###Types:
- solid - This is the default the block is given, will act as a solid prop to stand on (no action)
- bhop - Block toggles after a certain time on touch.
 - "Disappear Time ; Reappear Time" (ex: "0.1;0.5")
- push - The player is pushed in the direction the block specifies.
 - "Relative Block Direction ; Multiplyer"
 - Directions:
   - F - Forward from the block direction
   - B - Backward
   - D - Downward
   - U - Upward
   - L - Left
   - R - Right
- rpush - the player is pushed in the direction defined by the block, but relative to the player (block rot + player rot)
 - "Relative Player Direction ; Multiplyer"
 - Directions:
   - F - Forward from the player direction
   - B - Backward
   - D - Downward
   - U - Upward
   - L - Left
   - R - Right
- command - a certain command is issued (arg: sm_play # "etc") If you find a command super useful that you want added report an issue (as a fetaure reqeust)
 - "command"
   - "!userid" will be replaced by the touching player's userid
   - "!name" will be replaced by the player's name
   - etc (more thought of later lol)
- death - kills the player instantly
- nfall - Player takes no fall damage from this block. (tracerays from a certain distance?)
- give - gives a player a certain weapon (ex: "arg" "weapon_awp")
 - "ITEMNAME" - gives the touching player what ever this is.
