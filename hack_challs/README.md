# Hacking Challenge I - Hall of Fame Data Recovery (Red/Blue)

B1F is a truly amazing item. I used it to keep a small ACE payload which reminded me of my super secret password. But I encountered Missingno. in battle, and my payload got destroyed!  
Think it's still possible to recover it? Here's *the save file I got after the incident* (`files/rest_in_miss_forever_ingno.sav`).

# Hacking Challenge II - The Sus-file (Crystal)

I got this Pokémon Crystal save file from a friend, but it's really strange. Sometimes weird colored artifacts appear on the screen, and sometimes the game just straight up crashes. I'm sure there's something hidden in it. Maybe you'll be able to figure it out? *Here's the save file I got* (`files/suspicious.sav`).

*(Note, the file includes the plaintext flag, and this is absolutely not intended. Actually, things kinda went wrong with all four challenges, and they all ended up having unintended "easy" solutions. More information in the wrap-up video :>)*

# Hacking Challenge III - gbhttp

The GBZ80 architecture is truly amazing - so amazing that we've created a Game Boy HTTP server! It's (no longer) running at [http://fools2024.online:26273/](http://fools2024.online:26273/). However, we haven't done a proper security audit of our code yet. Think you can steal the secret password from our test server? The *source code* (`assets/gbhttp.asm`) is available for you to review. 

# Hacking Challenge IV - Pokémon Write-What-Where Version (Emerald)

I love playing Pokémon Emerald! The buttons on my GBA are really worn off, and they don't work anymore... but who needs buttons when I have a debugger and a steady hand? As long as you tell me which memory addresses I need to modify on which frames, I should be good to go!  
  
To complete this challenge, you will need to provide a solution file, which will contain a list of memory edits necessary to complete a fresh game of Pokémon Emerald from scratch.

Challenge IV: General rules
===========================

The goal of the challenge is to complete a fresh game of Pokémon Emerald under the following conditions:

*   All controller inputs are locked at **no buttons pressed**.
*   On each frame, you get an opportunity to **modify any number of RAM addresses to any values**. You may only write to IWRAM and EWRAM (addresses from $2000000 to $3FFFFFF).
*   The game needs to be completed (start displaying the credits) **in at most 9000 frames**.
*   The game starts **from a hard reset**, with no save data present.

Additional notes which might be useful for creating solutions:

*   Frame 0 is defined to start immediately after reset. Non-zero frame _N_ is defined to start exactly when the _N_\-th VBlank interrupt fires.
*   The exact method used to detect that credits are playing is not disclosed - but as long as the credits play correctly and the game doesn't crash, you're good to go.
*   All addresses are written once - they are not frozen in place, and they may (and will!) be modified by the game. Plan your solution accordingly.

Solution format
===============

Solutions to the challenge should be provided in a simple text file format, which is defined below:

*   The solution file might contain any number of lines (it doesn't matter if Windows or Unix line endings are used).
*   If a line starts with the character "_;_", it is treated as a comment and ignored.
*   If a line is empty, it is ignored.
*   Otherwise, the line is treated as a **memory write definition**, which is a list of space-separated values:
    *   The first value is the _decimal_ number of the frame on which the write should occur.
    *   The second value is the _hexadecimal_ pointer to the memory address which should be written.
    *   All remaining values are treated as a list of _hexadecimal_ bytes which should be written to that address.
*   Values might be separated from each other by any number of whitespace.

Below is an exemplary solution script:  

```
; Hello, I'm an example solution script!

; On the 42nd frame, write 0x69 to 0x02001337.
42    02001337  69

; On the 123rd frame, write the null terminated string "BEPIS" to 0x03001000.
; Also write 0x99 to 0x02001337 on the same frame.
123   03001000  42 45 50 49 53 00
123   02001337  99
```

Local verification
==================

Once you have your solution, it would be a good idea to verify it locally before submitting it. For that purpose, a simple *Lua verification script for mGBA* (`files/checker.lua`) is provided.

To use it, [download the newest version of mGBA](https://mgba.io/) and load up a ROM of Pokémon Emerald. Place the _checker.lua_ script in mGBA's working directory, along with your solution script in _solution.txt_. Then, load up the script by selecting _Tools » Scripting_, then _File » Load script_.

Looking at submission status
============================

Depending on how well your solution does, you may end up with following results:

*   **Pending verification**: Your solution is in queue to be processed.
*   **Verifying**: Your solution is currently being verified.
*   **Processing error**: An error occured while trying to parse your solution file. Make sure your data is in the correct format.
*   **Failure**: Instructions were successfully read, but when executed, they didn't end up finishing the game (playing the end credits) in the alloted time frame (9000 frames).
*   **Success**: The solution was successfully verified. Your achievement can be claimed by clicking the _claim achievement_ link in the result column.
