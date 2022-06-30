# BakerOS
Kerbal Operating System Raster Prop Monitor IVA GUI

BakerOperatingSystem 2.1.0

a Kerbal Operating System Raster Prop Monitor GUI script file!

 
Hello fellow Kerbalnauts!

        Baker Operating System is a single script that runs a GUI I have created to run a large collection of KOS scripts.  It is a full autopilot GUI written in Kerbalscript to let the user play the game completely from the IVA perspective exclusively.  Everything from Launching to orbit, planning a transfer to a target, executing the maneuvers, landing, collecting science, automatic docking in orbit and much more! I'm SelfAwareMatter and I have been playing KSP for 7 years or so and love the game so very much. It has given me a unique perspective on my own place in the universe and greatly enhanced my ability to understand the world around me.  Among the things KSP has inspired me to teach myself, programming with  KOS is one. I am a Linux user and building simple boot scripts and editing config files is about the extent of my programming knowledge before playing and learning with KOS.  Special thanks to Vulcan for his IVA content and for a bit of code he kicked down, the CheersKevin video series on Youtube for getting me started on writing Kerbal-script code, and the devs of KSP KOS and the modding community in general for contributing to such an awesome game and making it so much more! I am humbled to contribute in anyway I can to the community.  If even one nerd gets a kick out of using my system Ill be stoked. What an awesome thing KSP and KOS is! 

 

         MODS that have been incorporated include-

Kerbal Operating System obviously

Raster Prop Monitor

Atmosphere Autopilot

BD Armory

RSVP- the rsvp scripts need to be in your script folder for the transfer planner to work.

Hullcamvds

Trajectories 

 

      There is a lot in this 13k lines of code. Some of the programs include-

Blackjack!     My first game! Its buggy and awesome!

RSVP transfer GUI - requires RSVP script files in script folder. They may need to be slightly edited. 

Automatic Launch System

Automatic Landing System

Automatic Docking - Docking port to be used on ship must be name tagged "fromname"

Engine Control

Execute Maneuver Node

Robotic Servo Controller

Ship systems

Resource transfer between docked vessels

Circularize Orbit Eccentricity at Apoapsis

Circularize Orbit  Eccentricity at Periapsis

Rover Autopilot

Target selector

Time-warp Controller

Maneuver Node editor with current angle to prograde and angle to retrograde display

Science Sensor Controller

External Camera Controller

Atmosphere Autopilot

Weapon systems

Moon Transfer Planner

Planet Transfer Planner

VTOL

Automatic Hover

           I hope somebody has fun with this.  I would love if somebody wanted to add something awesome to it.  If I make significant updates I will keep this post updated.  Feedback is totally welcome too.  Ive tried to make these programs fairly robust and usable in a lot of different environments and situations but I'm sure bugs will arise I have not worked out in situations I have not tested.  So Like I said earlier I really don't know all too much about programming and I'm sure the way I organize some of the code would give a real programmer fever dreams. I tried to make it as organized and commented as possible. Adding new scripts you may want to incorporate is super easy. Just pack the script you want to run in a function with a call to the bakeros function at the end of the script to return to menu selection after the script loop has been stopped and drop it in the list of functions in the script file baker.ks  Then just add the function call to the menuanswer section of the bakeros function you will see at the end of the script. Then it should boot just fine from the selection menu. Any questions shoot me a message ill try to respond quickly.  Here ya go!!!
