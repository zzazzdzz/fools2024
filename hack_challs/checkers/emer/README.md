This is the online checker for Challenge #4. It will:
- Ingest all *.txt files in the directory `pending/` and move them to `submissions/` as they are being processed.
- For each file, the script will compile it to mGBA debug commands and save it as a `submissions/*.mgbacmd` file...
- ...then spawn mGBA with debug shell to execute the solution script, and save the result to a `submissions/*.mgbaout` file.
- Then, it will be examined if credits ended up playing, and save the result of the check to a `submissions/*.result` file.

Make sure to install `mgba-sdl` and provide a virtual X server for the emulator window to use.