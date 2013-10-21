Flash Dev Test - hangman

This is a Flash Builder 4 - ActionScript project which has some third-party libraries included.

Folder descriptions:

src: Source folder for the actionscript code

assets: Used assets are added to that folder

libs: Includes some binaries of third-party libraries and an Application.swc which includes the used assets

publish: The publish folder contains the compiled Hangman.swf and two text-files which are loaded at runtime.


Genral:

As mentioned before, this project includes some third-party libraries. It was developed with useage of robotlegs v. 1.5.2, robert penners signals and the as3corelib.
After startup the application loads the config.xml and the snippet file, where all texts are located in. After initialization the game starts with the startup screen.
On play clicked, the screen switches to the game-view and the main game is running. After all attempts are done or you guessed a word successfull the end screen is shown.
