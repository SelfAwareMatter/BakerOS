//BAKER OS 2

/// Programs ///
function bakerrover
{    
  function rovercontrol
  {
    function rovercontrolmain 
    {
      CLEARSCREEN.
      SET isDone to 0.
      set actiontype to 1.
      set ch to "".
      
      function selectaction
      {
        if actiontype = 1
        {
        }

        if actiontype = 2
        {
        }

        if actiontype = 3
        {
        }

        if actiontype = 4
        {
        }
      }
      
      //down
      function button0 
      {
        if actiontype = 1
        {
        }

        if actiontype = 2
        {
        }

        if actiontype = 3
        {
        }

        if actiontype = 4
        {
        }
      }
      buttons:setdelegate(-3,button0@).

      //up
      function button1 
      {
        if actiontype = 1
        {
        }

        if actiontype = 2
        {
        }

        if actiontype = 3
        {
        }

        if actiontype = 4
        {
        }
      }
      buttons:setdelegate(-4,button1@).

      //right
      function button2 
      {
        if actiontype = 1
        {
          set targetspeed to targetspeed + changerate.
          print "Target Speed: " + targetspeed +"   "at (13,5).
        }

        if actiontype = 2
        {
          if headingtype = 1
          {
          set headingtype to headingtype + 1. 
          }
          
          if headingtype = 1
          {
            set roverheading to "Prograde.            ".
            lock steering to vec_pro_horizon.
            set hdg1 to hdg.
            lock wheelsteering to hdg1.
          }
          if headingtype = 2
          {
            if hastarget = true
            {
              set roverheading to "Target.                   ".
              lock steering to  target:direction. 
              lock wheelSteering to target.
            }
            else
            {
              print "No Target! " at (45,8).
              set roverheading to "Prograde.                   ".
              unlock wheelSteering.
            }
          }
          print "Rover Heading: " + roverheading + "     " at (13,8).
        }

        if actiontype = 3
        {
          set changerate to changerate + 1.
          print "Change Rate: " + changerate + "   " at (13,7).
        }

        if actiontype = 4
        {
          lock steering to vec_pro_horizon.
          set sasmodeA to "On  ".
          print "S.A.S. Mode: " + sasmodea +"     " at(13,4).
        }
      }
      buttons:setdelegate(-6,button2@).

      //left
      function button3 
      {
        if actiontype = 1
        {
          if targetspeed > 1
          {
            set targetspeed to targetspeed - changerate.
            print "Target Speed: " + targetspeed +"   "at (13,5).
          }
        }

        if actiontype = 2
        {
            if headingtype > 1
            {
              set headingtype to headingtype - 1.
            }

            if headingtype = 1
            {
              set roverheading to "Wheel steering locked prograde.".
              lock steering to vec_pro_horizon.
              set hdg1 to hdg.
              lock wheelsteering to hdg1.
              
            }

            if headingtype = 2
            {
              if hastarget = true
              {
                set roverheading to "Target.                   ".
                lock steering to target:direction.
                lock wheelsteering to target.
              }
              else
              {
                print "No Target."  at (13,15).
              }
            }
            print "Rover Heading: " + roverheading + " " at (13,8).
        }

        if actiontype = 3
        {
          set changerate to changerate - 1.
          print "Change Rate: " + changerate + "   " at (13,7).
        }

        if actiontype = 4
        {
          unlock steering.
          set sasmodeA to "Off".
          print "S.A.S. Mode: " + sasmodea +"     " at(13,4).
        }
      }
      buttons:setdelegate(-5,button3@).

      //enter
      function button4 
      {
        selectaction().
      }
      buttons:setdelegate(-1,button4@).

      function button5 
      {
      }
      buttons:setdelegate(5,button5@).

      //bottom 1
      function button7 
      {
        set actiontype to 1.
        print "MODE: Speed Controller  " at (1,17).
      }
      buttons:setdelegate(7,button7@).
      
      //bottom 2
      function button8 
      {
        set actiontype to 2.
        print "MODE: Heading Controller             " at (1,17).
      }
      buttons:setdelegate(8,button8@).
      
      //bottom 3
      function button9 
      {
        set actiontype to 3.
        print "MODE: Rate Controller                " at (1,17).
      }
      buttons:setdelegate(9,button9@).
      
      //bottom 4
      function button10
      {
        set actiontype to 4.
        print "MODE: Stabalization Controller.           " at (1,17).
      }
      buttons:setdelegate(10,button10@).
      
      //bottom 5
      function button11 
      {
        if pilot = 2
        {
          unlock wheelthrottle.
          unlock steering.
          unlock wheelSteering.
          print "AutoPilot Off   " at (13,10).
          print "Rover Heading:                                " at (13,8).
          set pilot to 1.
        }
        else
        {
          lock steering to vec_pro_horizon.
          lock wheelThrottle to -3.33333333*speeddiff + 3.3333333333.
          print "AutoPilot On   " at (13,10).
          print "Rover Heading: Prograde.                      " at (13,8).
          set pilot to 2.
        }
      }
      buttons:setdelegate(11,button11@).
      
      //bottom 6
      function button12 
      {
        if brakesa = 1
        {
          brakes on.
          set brakesa to 2.
          print "Brakes: On    " at (13,9).
        }
        else
        {
          brakes off.
          set brakesa to 1.
          print "Brakes: Off    " at (13,9).
        }
      }
      buttons:setdelegate(12,button12@).
      
      //bottom right i think
      function button13 
      {
        SET isDone to 1.
        clearscreen.
      }
      buttons:setdelegate(13,button13@).

      //definitions
      set targetspeed to 1.
      set changerate to 1.
      set roverheading to "Prograde.".
      set headingtype to 1.
      sas off.
      set sasmodeA to "On".
      lock shipgroundspeed to ship:groundspeed.
      lock speeddiff to shipgroundspeed/targetspeed.
      set pilot to 1.
      set backwards to 1.
      set brakesa to 1.
      lock east to vcrs(up:vector, north:vector).
      lock traveling to srfprograde:vector.
      lock trig_x to vdot(north:vector, traveling).
      lock trig_y to vdot(east, traveling).
      lock hdg to mod((arctan2(trig_y, trig_x)+360),360).
      lock vec_pro_horizon TO heading(hdg,0).
      
      bakerlandgui().

      PRINT "|  SPEED   | HEADING  |   RATE   |  S.A.S.  |  PILOT   |  BREAKS  |   EXIT   |" at (0,20).
      PRINT " BAKER ROVER CONTROL v2.0 " AT (27,0).
      print "Change Rate: " + changerate + "   " at (13,7).
      print "Rover Heading: " + roverheading + "     " at (13,8).
      print "Target Speed: " + targetspeed +"   "at (13,5).
      print "S.A.S. Mode: " + sasmodeA +"     " at(13,4).
      print "AutoPilot Off   " at (13,10).
      print "Brakes:      " at (13,9).

      function bakerlandgui
      {
        print "################################################################################" at (0,0).
        print "|          _________________________________________________________           |" at (0,1).
        print "|          |   BAKER ROVER CONTROL v2.0                      - 0 X |           |" at (0,2).
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |" at (0,3).
        print "|          |                                                       |           |" at (0,4).
        print "|          |                                                       |           |" at (0,5).
        print "|          |                                                       |           |" at (0,6).
        print "|          |                                                       |           |" at (0,7).
        print "|          |                                                       |           |" at (0,8).
        print "|          |                                                       |           |" at (0,9).
        print "|          |                                                       |           |" at (0,10).
        print "|          |                                                       |           |" at (0,11).
        print "|          |                                                       |           |" at (0,12).
        print "|          |                                                       |           |" at (0,13).
        print "|          |_______________________________________________________|           |" at (0,14).
        print "|                                                                              |" at (0,15).
        print "|______________________________________________________________________________|" at (0,16).
        print "|                                                                    " + time:clock + "  |" at (0,17).
      }
      
      UNTIL isDone > 0 
      {
          print "Rover Speed: " + round(ship:groundspeed,2) at (13,6).
          print "Wheel Throttle " + round(Wheelthrottle,2) at (13,13).
          print "Rover Lat: " + round(ship:geoposition:lat,4) at (13,11).
          print "Rover Long: " + round(ship:geoposition:lng,4) at (13,12).

          if vdot(ship:facing:vector,ship:srfprograde:vector) < .9 and backwards = 1
          {
            lock shipgroundspeed to ship:groundspeed - (ship:groundspeed*2).
          }
          else
          {
            lock shipgroundspeed to ship:groundspeed.
          }

          if hasTarget = true
          {
            if target:distance < 250
            {
              print "Target Detected.          " at (1,17).
              unlock steering.
              unlock wheelSteering.
              unlock wheelThrottle.
              print "AutoPilot Off   " at (13,10).
              print "Brakes: On     " at (13,9).
              brakes on.
            }
          }
      }
      CLEARSCREEN.
    }
    rovercontrolmain().
    bakeros().
  } 
  rovercontrol().
}

function bakerland
{
  clearscreen.

  if ship:maxthrust = 0
  {
    Print "No Engine Activated! Exiting...".
    wait 2.
    bakeros().
  }

  FUNCTION slope_calculation {//returns the slope of p1 in degrees
    PARAMETER p1.
    LOCAL upVec IS (p1:POSITION - p1:BODY:POSITION):NORMALIZED.
    RETURN round(VANG(upVec,surface_normal(p1))).
  }

  FUNCTION surface_normal {
    PARAMETER p1.
    LOCAL localBody IS p1:BODY.
    LOCAL basePos IS p1:POSITION.
    LOCAL upVec IS (basePos - localBody:POSITION):NORMALIZED.
    LOCAL northVec IS VXCL(upVec,LATLNG(90,0):POSITION - basePos):NORMALIZED * 3.
    LOCAL sideVec IS VCRS(upVec,northVec):NORMALIZED * 3.//is east
    LOCAL aPos IS localBody:GEOPOSITIONOF(basePos - northVec + sideVec):POSITION - basePos.
    LOCAL bPos IS localBody:GEOPOSITIONOF(basePos - northVec - sideVec):POSITION - basePos.
    LOCAL cPos IS localBody:GEOPOSITIONOF(basePos + northVec):POSITION - basePos.
    RETURN VCRS((aPos - cPos),(bPos - cPos)):NORMALIZED.
  }

  function bakerlandgui
  {
    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                    Baker Land 1.0                     |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |_______________________________________________________|           |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }


  set findlandzone to 1.
  lock steering to retrograde.
  rcs on.
  sas off.
  bakerlandgui().
  set slopeimpact to 1.
  set TargetRoll to ship:facing:roll +90.





  // lock east to vcrs(up:vector, north:vector).
  // lock traveling2 to srfRetrograde:vector.
  // lock trig_x to vdot(north:vector, traveling2).
  // lock trig_y to vdot(east, traveling2).
  // lock hdg to mod((arctan2(trig_y, trig_x)+360),360).
  // lock vec_pro_horizon2 TO heading(hdg,0).







  when vang(ship:facing:forevector,steering:forevector) < .05 and findlandzone = 4 then
  {
    set ship:control:fore to 0.7.
    wait 2.
    set throttle to 1.
    set ship:control:fore to 0.
    print "Performing landing zone seeking burn.        " at (15,7).


      until slopeimpact = 2
      {
        if addons:tr:hasimpact
        {
          if slope_calculation(addons:tr:impactpos) < 10 
          {
            wait 2.
            if slope_calculation(addons:tr:impactpos) < 10
            {
              set findlandzone to 2.

              PRINT "Landing Zone Found: " at (15,6).
              set throttle to 0.
              set slopeimpact to 2.
              //wait 1.
              
            }

          }
        }

      }


    //set findlandzone to 3.
    //print 2.
  }



  until findlandzone = 2
  {
    

    if ADDONS:TR:HASIMPACT 
    {
      
      //wait 5.
      //set findlandzone to 2.
      //lock steering to vec_pro_horizon2.
      set findlandzone to 2.

      PRINT "Impact Detected: " at (15,6).
      print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) + "           " at (15,10).
      //wait 1.

      // if slopeimpact = 1
      // {
      //   when slope_calculation(addons:tr:impactpos) < 10 then
      //   {
      //     wait 2.
      //     if slope_calculation(addons:tr:impactpos) < 10
      //     {
      //       set findlandzone to 2.

      //       PRINT "Landing Zone Found: " at (15,6).
      //       set throttle to 0.
      //       //wait 1.
            
      //     }

          

      //   } 

        //set slopimpact to 2.
      
    } 
    else
    {
      print "Adjusting position for landing maneuver" + vang(ship:facing:forevector,steering:forevector) at (15,8).
      set findlandzone to 4.


    }
  }
      


      
    


  





  
  //sas off.
  //rcs on.
  lock steering to ship:srfRetrograde.
  lock shipLatLng to SHIP:GEOPOSITION.
  lock surfaceElevation to shipLatLng:TERRAINHEIGHT.
  lock betterALTRADAR to max( 0.1, min(ALTITUDE , ALTITUDE - surfaceElevation)).
  lock totalSpeed to ship:groundspeed + ABS(VERTICALSPEED).
  lock impacttime to addons:tr:timetillimpact.
  lock max_acc to ship:availablethrust/ship:mass.
  lock burn_duration to totalspeed/max_acc.
  set throt to 0.
  lock throttle to throt.
  set landstart to 0.

  until landstart > 1
  {
    print "Orienting and Coasting to burn.     " at (15,6).
    print "Ship Speed: " + totalSpeed at (15,12).
    print "Better Alt Radar: " + betterALTRADAR at (15,8).
    print "Burn Duration: " + burn_duration at (15,9).
    print "Impact time: " + impacttime at (15,11).
    print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) + "           " at (15,10).
    print "Press Action Group 10 to Perform Landing" at (15,7).
    //set landstart to 2.
    on ag10
    {
      set landstart to 2.
    }
  }

  print "                                              " at (15,7).

  until burn_duration + 1 > impacttime
  {
    if ship:body:atm:exists
    {
      brakes on.
      set fallrate to -1.

      until fallrate > 0
      {
        print "Ship Speed: " + totalSpeed at (15,12).
        print "Better Alt Radar: " + betterALTRADAR at (15,8).
        print "Burn Duration: " + burn_duration at (15,9).
        print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) at (15,10).
        print "Impact time: " + impacttime at (15,11).
        set fallrate1 to ship:groundspeed + ABS(VERTICALSPEED).
        lock fallrate2 to ship:groundspeed + ABS(VERTICALSPEED).
        wait .1.
        set fallrate to fallrate1-fallrate2.
      }

      until fallrate < 1
      {
        print "Ship Speed: " + totalSpeed at (15,12).
        print "Better Alt Radar: " + betterALTRADAR at (15,8).
        print "Burn Duration: " + burn_duration at (15,9).
        print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) at (15,10).
        print "Impact time: " + impacttime at (15,11).
        set fallrate1 to ship:groundspeed + ABS(VERTICALSPEED).
        lock fallrate2 to ship:groundspeed + ABS(VERTICALSPEED).
        wait .1.
        set fallrate to fallrate1-fallrate2.
      }
//67
      until burn_duration*.75 + 1 > impacttime and betterALTRADAR < 15000
      {
        print "Ship Speed: " + totalSpeed at (15,12).
        print "Better Alt Radar: " + betterALTRADAR at (15,8).
        print "Burn Duration: " + burn_duration at (15,9).
        print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) at (15,10).
        print "Impact time: " + impacttime at (15,11).
        set fallrate1 to ship:groundspeed + ABS(VERTICALSPEED).
        lock fallrate2 to ship:groundspeed + ABS(VERTICALSPEED).
        wait .1.
        set fallrate to fallrate1-fallrate2.
      }
    }
    else
    {

      until burn_duration*.75 + 1 > impacttime

      print "Ship Speed: " + totalSpeed at (15,12).
      print "Better Alt Radar: " + betterALTRADAR at (15,8).
      print "Burn Duration: " + burn_duration at (15,9).
      print "Slope Calculation at projected impact: " + slope_calculation(addons:tr:impactpos) at (15,10).
      print "Impact time: " + impacttime at (15,11).
      set fallrate1 to ship:groundspeed + ABS(VERTICALSPEED).
      lock fallrate2 to ship:groundspeed + ABS(VERTICALSPEED).
      wait .1.
      set fallrate to fallrate1-fallrate2.
    }
  }

  set shipaltburn to max( 0.1, min(ALTITUDE , ALTITUDE - surfaceElevation)).
  set shipspeedburn to ship:groundspeed + ABS(VERTICALSPEED).
  set shipslope to (shipspeedburn-0)/(shipaltburn-0).
  set ship:control:fore to 0.7.
  wait 1.
  set ship:control:fore to 0.
  gear on.
  lights on.

  until totalspeed < 1
  {
    lock throt1 to (shipslope*betterALTRADAR) + 5.
    //print shipslope*.00001.
    print "Ship Speed: " + totalSpeed at (15,12).
    print "Better Alt Radar: " + betterALTRADAR at (15,8).
    print "Burn Duration: " + burn_duration at (15,9).
    print "Performing Land Burn!                 " at (15,6).
    print "Target Speed: " + throt1 at (15,11).
    print "Slope Calculation at projected impact: " + slope_calculation(ship:geoposition) at (15,10).
    lock falldiff to totalspeed / max(10,throt1).
    // 1.30 ,1 linear equation points for throttle control.
    // .7,.15
    lock throt3 to 1.417*falldiff-.842.
    lock throt to throt3.
  }

  sas on.
  ag3 off.
  lock throttle to 0.
  unlock steering.
  unlock throttle.
  print "Landed!                  " at (15,6).
  wait 15.
  lights off.
  rcs off.
  bakeros().

}

function bakerdock
{
	//KOS



      //       SET KUNIVERSE:DEFAULTLOADDISTANCE:FLYING:UNLOAD TO 30000.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:FLYING:LOAD TO 29500.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:FLYING:PACK TO 29999.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:FLYING:UNPACK TO 29000.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"

      // // 30 km for parked on the ground:
      // // Note the order is important.  set UNLOAD BEFORE LOAD,
      // // and PACK before UNPACK.  Otherwise the protections in
      // // place to prevent invalid values will deny your attempt
      // // to change some of the values:
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:LANDED:UNLOAD TO 30000.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:LANDED:LOAD TO 29500.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:LANDED:PACK TO 39999.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:LANDED:UNPACK TO 29000.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"

      // // 30 km for parked in the sea:
      // // Note the order is important.  set UNLOAD BEFORE LOAD,
      // // and PACK before UNPACK.  Otherwise the protections in
      // // place to prevent invalid values will deny your attempt
      // // to change some of the values:
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:SPLASHED:UNLOAD TO 30000.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:SPLASHED:LOAD TO 29500.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:SPLASHED:PACK TO 29999.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:SPLASHED:UNPACK TO 29000.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"

      // // 30 km for being on the launchpad or runway
      // // Note the order is important.  set UNLOAD BEFORE LOAD,
      // // and PACK before UNPACK.  Otherwise the protections in
      // // place to prevent invalid values will deny your attempt
      // // to change some of the values:
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:PRELAUNCH:UNLOAD TO 30000.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:PRELAUNCH:LOAD TO 29500.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:PRELAUNCH:PACK TO 29999.
      // SET KUNIVERSE:DEFAULTLOADDISTANCE:PRELAUNCH:UNPACK TO 29000.
      // WAIT 0.001. // See paragraph above: "wait between load and pack changes"






	// Dock using nametags to choose the docking ports
	// to use for the dock.
	declare parameter fromName, toName. // the string nametags of the ports to connect up.
										// If these strings are not in nametags, you will be
										// asked to assign the tags.
	declare parameter maxSpeed. // Tuning Parameter:
					// This setting lets you pick the max speed the script will allow the ship to drift at
					// when doing a translation maneuver leg.
					//
					// The value is in meters per second.
					//
					// For any RCS maneuver where you start stationary at point A and want to end up being
					// stationary at point B, the faster you drift the more you are wasting monopropellant
					// just accellerating up to speed only to just throw that speed away and
					// deccellerate back down again at the end.
					//
					// Deciding how fast to drift at is a balancing act between spending more
					// fuel to accellerate up to speed and back down again, versus spending more time. 
					// Note the the most efficient fuel use isn't necessarily the the slowest speed
					// either.  The script is operating in a world where it pretends momentum is supposed
					// to move the ship in a straight line relative to its target, and it just keeps having
					// to nudge it back to that straight line when it mysteriously gets pushed off from it.
					// In reality what's happening is that orbital mechanics causes the momentum to move
					// you in a curving path relative to your target, not a straight line, and this is the
					// "mysterious" factor the script keeps trying to correct for.  The amount of
					// correction it has to perform is larger the slower you're going (the slower you go
					// relative to the target, the tighter the curve is and the more incorrect the
					// script's assumptions of straight drifting lines are.).  That's why the
					// most efficient max speed is not necessarily going to be the slowest.  Going
					// faster means your momentum is describing a bigger radius "curve", and thus small
					// patches of that curve start to look more like the straight lines the script is expecting.
					//
					// The script has been tested with this setting as high as 25 or as low as 1,       (fromname,toname,10,30,20,100,false)
					// and it does work anywhere in that range. 
	declare parameter spinPower. // Tuining Parameter:
								// The higher the number, the more hyper your ship's rotation is (the more
								// overpowered and touchy the yaw/pitch/roll controls are.)
								// Setting it higher means the ship can
					// rotate really really well, and therefore the pitch/yaw/roll controls
					// shouldn't be used at their full deflection.
					// A typical value is about 30.  Tune it to match your ship's behavior.
	declare parameter transPower. // Tuning Parameter:
								// The higher the number, the more risky the script will get with the
								// deccelleration as it apprachs a target point.  If set high, the script
					// assumes the ship can stop quickly and therefore doesn't need to allow
					// as much distance to slow dow.  Set it lower to make the script more
					// conservative and gentle, slowing the approach from a farther distance out.
					// A typical value is about 30 for small craft.
	declare parameter alignDist. // Distance to use to skirt around things.  Imagine the bounding box around
								// your target vessel that describes the farthest "sticking out bits" it has,
					// Set this to something comfortably bigger than the size of that box and
					// the script will work to avoid hitting anything within that area until it
					// gets lined up to the final straight-line approach to the target port.
					// (If you want to get really technical, set it to bigger than (1/cos(45deg))
					// times as big as the bounding box radius to ensure it won't cut across the
					// bounding box as it cuts a diagonal from point to point in the approach.)
	declare parameter show. // True if you want the visual vectors drawn to see how the algorithm is thinking.

	function select_ports
	{
		declare parameter fromName, toName.

		clearscreen.
	// print " **************************".
	// print " * Docking Port Selection *".
	// print " **************************".
	// print " ".
	// print "   Choose a docking port of the target".
	// print "   vessel and give it a name tag of:".
	// print "          '" + toName + "'.".
	// print "   REMEMBER that to change the tag name".
	// print "   of a different vessel, you will have".
	// print "   to switch to that vessel with '[', ']'".
	// print "   first to have control over its nametags.".
	// print " ".

	// Get a list of all vessels that are in loading range.
	//
	set loadedVessels to list().
	list targets in allships.
	for ves in allships { if ves:loaded { loadedVessels:add(ves). }. }.

// Dock selector gui

  for ves in loadedVessels
  {

      CLEARSCREEN.
  set cursorPosition to 0.
  set currentPage to 0.
  LOCAL totalItems is 12.
  SET isDone to 0.
  set actiontype to 1.
  
  function selectdock
  {
      
    
    if actiontype = 1
    {
      set toPort to ves:dockingports[currentPage * totalItems + cursorPosition].
      set done to false.
      //print "Engine " + ves:dockingports[cursorPosition] + " Activated." at (20,16).

        when toport:haspartner then
        {
          set done to true.
        }


      print "Docking Port Selected." at (20,16).
      wait 5.
    }

    if actiontype = 2
    {

    }

    if actiontype = 3
    {

    }

    if actiontype = 4
    {

    }
    
  }
  
  function button0 
  {
    if cursorPosition > 0 
    {
    set cursorPosition to cursorPosition - 1.
    }
  }
  buttons:setdelegate(-3,button0@).
  
  function button1 
  {
    if cursorPosition < currentPageList:LENGTH - 1 
    {
    set cursorPosition to cursorPosition + 1.
    }
  }
  buttons:setdelegate(-4,button1@).
  
  function button2 
  {
    if currentPage < maxPages - 1 
    {
    SET currentPage to currentPage + 1.
    SET cursorPosition to 0.
    }
  }
  buttons:setdelegate(-6,button2@).

  function button3 
  {
    if currentPage > 0 
    {
    SET currentPage to currentPage - 1.
    SET cursorPosition to 0.
    }
  }
  buttons:setdelegate(-5,button3@).

  function button4 
  {
    selectdock().
  }
  buttons:setdelegate(-1,button4@).

  function button5 
  {
  }
  buttons:setdelegate(5,button5@).

  function button7 
  {
    set actiontype to 1.
    print "MODE: Activate  " at (0,16).
  }
  buttons:setdelegate(7,button7@).
  
  function button8 
  {
    set actiontype to 2.
    print "MODE: Shutdown  " at (0,16).
  }
  buttons:setdelegate(8,button8@).
  
  function button9 
  {
    set actiontype to 3.
    print "MODE: Togglemode " at (0,16).
  }
  buttons:setdelegate(9,button9@).
  
  function button10 
  {
    set actiontype to 4.
    print "MODE: Intakes Toggle " + intakes at (0,16).
  }
  buttons:setdelegate(10,button10@).
  
  function button11 
  {
  }
  buttons:setdelegate(11,button11@).
  
  function button12 
  {
  }
  buttons:setdelegate(12,button12@).
  
  function button13 
  {
    SET isDone to 1.
    clearscreen.
  }
  buttons:setdelegate(13,button13@).

  set toPort to "".
  
  //UNTIL isDone > 0 

  UNTIL toPort <> ""
  {
    LOCAL position is 1.
    //LIST engines in engineList.
    set maxPages to CEILING(ves:dockingports:LENGTH / totalItems).
    SET currentPageList to ves:dockingports:SUBLIST(currentPage * totalItems, totalItems).
    SET iterdockList to currentPageList:ITERATOR.
    set realPage to currentPage + 1.

    //PRINT "|          |          |          |          |          |          |   EXIT   |" at (0,20).
    PRINT "PAGE " + realPage + " OF " + maxPages + "      Automatic Docking System  v2.0" AT (1,0).
    PRINT "--------------------------------------------------------------------------------" AT (0,13).
   // PRINT "Engine: " AT (0,14).
    //print "Engine TAG: " at (0,15).
    //print "Stage: " at (0,16).
    //print "Ignitions: " at (0,17).
    
    UNTIL NOT iterdockList:NEXT 
    {
      if cursorPosition = iterdockList:INDEX 
      {
        PRINT ">" AT (0,position).
      } 
      else 
      {
        PRINT " " AT (0,position).
      }
      
      // if currentPageList[iterdockList:INDEX]:ignition 
      // {
      // PRINT ">" AT (1,position).
      // } 
      // else 
      // {
      //   PRINT " " AT (1,position).          
      // }  
      
      SET strcurrentPageList to currentPageList[position - 1]:title.// + " " + "(" + currentPageList[position - 1]:BODY:NAME + ")".
      PRINT strcurrentPageList:PADRIGHT(20) + "           " AT (2,position).
      // PRINT engineList[cursorPosition]:DISTANCE AT (7,14).
      PRINT "Name: " + currentpageList[cursorPosition]:name + "                              " AT (8,14).
      print "Tag: " + currentpageList[cursorPosition]:tag + "                                " at (8,15).
      print "Stage: " + currentpageList[cursorPosition]:stage + "                              " at (8,16).
      //print currentpageList[cursorPosition]:ignitions + "                           " at (11,17).
      set position to position + 1.

      if RealPage = maxPages 
      {
        set cleanLocation to currentPageList:LENGTH + 1.
        set cleanDisplayTotal to totalItems - currentPageList:LENGTH.
        set cleanDisplayCounter to 0.
        UNTIL cleanDisplayCounter = cleanDisplayTotal 
        {
        PRINT "                                        " AT (0,cleanLocation).
        set cleanLocation to cleanLocation + 1.
        set cleanDisplayCounter to cleanDisplayCounter + 1.
        }
      }
    }
      wait 0.001.
  }

    //SET strvescurrentPageList to ves:dockingports.
   // PRINT strvescurrentPageList:padright(20) AT (2,10).
   // print ">" at (3,6).
   // wait 30.
  }

	// set toPort to "".

	// until toPort <> "" {
	// 	for ves in loadedVessels {
	// 	set hits to ves:partsdubbed(toName).
	// 	if hits:length > 0 {
	// 		set toPort to hits[0].
	// 	}.
	// 	}.
	// 	wait 0.5. // no point in doing this expensive query too often.
	// }.

	// print " ".
	// print "   Choose one of the docking ports of the".
	// print "   maneuvering vessel (the vessel that is".
	// print "   running this program), and give it the".
	// print "   nametag value of:".
	// print "         '"+fromName+"'.".
	// print "   REMEMBER that to change the tag name".
	// print "   of a different vessel, you will have".
	// print "   to switch to that vessel with '[', ']'".
	// print "   first to have control over its nametags.".

	// Wait until a port is picked:
	//

	set fromPort to "".
	until fromPort <> "" {
		set hits to ship:partsdubbed(fromName).
		if hits:length > 0 {
		set fromPort to hits[0].
		}.
		wait 0.5. // no point in doing this expensive query too often
	}.

  hits[0]:controlfrom.


	print " ".
	print "    DOCK FROM is assigned.".

	print " ".
	print "Both From and To ports have been picked.".
	print " ".
	print "Commencing in ...".

	set countdown to 3.
	until countdown = 0 
  {
		print "  " + countdown.
		set countdown to countdown - 1.
		wait 1.
	}.

	}

	function dock
	{

	declare parameter alignDist. // Distance to keep away from target CoM until lined up.  Set this
								// to be bigger than the largest radius from that ship's CoM to its
								// farthest extermity.  The script will avoid getting that close
								// to the docking port until it's in front of it ready for the
								// final approach.
	declare parameter speedMin. // Lower bound for the m/s speed to drift at when lining up on final.
	declare parameter speedMax. // Upper bound for the m/s speed to drift at when lining up on final.
								// This is still allowed to be exceeded during earlier phases of the script.
								// Keep this small for ships with underpowered RCS thrust or it won't be able
								// to stop itself.
	declare parameter spinPower. // tuning parameter: set higher the faster your ship can spin.  typical is about 30.
								// If you set it lower, then the script knows your rotation can't slow down very fast
								// and therefore it needs to be more gentle with the allowed rotation rate while
								// spinning to a desired aim.
	declare parameter transPower. // tuning parameter: set higher the faster your ship can translate.  Typical is about 30.
									// If you set it lower, then the script knows your translation can't slow down very fast
									// and therefore when seeking a target aim point, it needs to allow more distance in
				// which to deccelerate.
	declare parameter myPort. // the docking port Part on my own ship I want to attach with.
	declare parameter otherPort.  // the docking port Part on the other ship I want to connect to.
	declare parameter show. // true to show vectors, false to not show them.


	// Re-enable after the next build is officially released
	// if VERSION:MINOR < 15 or (VERSION:MINOR >= 15 and VERSION:BUILD < 4) {
	//   PRINT "WARNING. THIS WAS DESIGNED FOR kOS VERSIONS >= 0.15.2.".
	//   SET X TO 1/0. // Deliberately quitting.  There is no EXIT, so causing an error to force a quit.
	// }.

	set wantSpeed to speedMax.
	set prevPitchOff to 0.
	set prevYawOff   to 0.
	set prevRollOff  to 0.

	clearscreen.

	// print "         DOCKING PROGRAM".
	// print "Rotation error:".
	// print "   pitch          yaw          roll  ".
	// print " ".
	// print " ".
	// print "Current Relative Speed: ".
	// print "Desired Relative Speed: ".
	// print " ".
	// print "Current Aiming Point: ".
	// print "Aiming Point Distance: ".

  function printscreendock
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                Automated Docking System               |           |".
    print "|          |                                                       |           |".
    print "|          |   Rotation Error-                                     |           |".
    print "|          |   Pitch:            Yaw:             Roll:            |           |".
    print "|          |   Current Relative Speed:                             |           |".
    print "|          |   Desired Relative Speed:                             |           |".
    print "|          |   Current Aiming Point:                               |           |".
    print "|          |   Aiming Point Distance:                              |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  printscreendock().

	// kOS doesn't have "enum"'s but that's what this is meant to be like:
	// -------------------------------------------------------------------
	set skirtMode to 1.    // I am trying to skirt around the ship I assume is in the way.
	set alignMode to 2.    // I am trying to get to the point aligned at alignDist from the port.
	set approachMode to 3. // I am now going straight in, penetrating the alignDist limit to go for dock.
	set curMode to skirtMode.

	// These are stubs at first, but get their positions reassigned down in the loop:
	// ------------------------------------------------------------------------------
	set velDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0.5,1,0,0.5),"relative velocity", 1, show).
	set rotDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0,0,1,0.5),"desired lookat facing", 1, show).
	set rotUpDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0,0,1,0.5),"desired up facing", 1, show).
	set skirtPosDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0.7,0.3,1,0.7),"Skirting Aim", 1, show).
	set alignPosDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0.7,0.3,1,0.7),"Align Aim ", 1, show).
	set approachPosDraw to VECDRAWARGS( V(0,0,0),V(0,0,0),rgba(0.7,0.3,1,0.7),"Approach Aim", 1, show).

	// Calculate the rotation of my nose relative to my port:
	//
	set rotAngle to vang(ship:facing:vector,ship:facing:vector).       //VANG( SHIP:FACING:VECTOR, myPort:PORTFACING:VECTOR ).
	set rotAxis to vcrs(ship:facing:vector,ship:facing:vector).         // VCRS( SHIP:FACING:VECTOR, myPort:PORTFACING:VECTOR ).
	set rotAxis to rotAxis:NORMALIZED.

	set rotAxisX to VDOT( rotAxis, SHIP:FACING:STARVECTOR ).
	set rotAxisY to VDOT( rotAxis, SHIP:FACING:TOPVECTOR ).
	set rotAxisZ to VDOT( rotAxis, SHIP:FACING:FOREVECTOR ).

	set debugRotAxisMe to vecdrawargs(V(0,0,0),v(0,0,0),white,"rotating axis of me",1,show).
	set debugRotAxisOther to vecdrawargs(V(0,0,0),v(0,0,0),white,"rotating axis of other",1,show).

	// I'm using the "do it all in one giant loop" design model here:
	// ---------------------------------------------------------------

	SAS ON.
	RCS ON.
	set tStamp to TIME:SECONDS.
	set tStampTemp to TIME:SECONDS.
	set firstPass to true.
	set done to false.





	until done {

		// Force a fresh new physics tick to occur now,
		// just before taking measurements:
		// ---------------------------------------------
		set tStampTemp to TIME:SECONDS.
		wait until TIME:SECONDS > tStampTemp.

		// Delta time since last pass through this loop.
		set deltaT to TIME:SECONDS - tStamp.
		set tStamp to TIME:SECONDS.

		// Obtain all raw measurements in one single instant of time:
		// ----------------------------------------------------------
		set tStamp to TIME:SECONDS.
		set myShipRot to SHIP:FACING.
		set myShipPos to SHIP:POSITION. // in theory this should always be V(0,0,0).
		set myPortRot to myPort:PORTFACING.
		set myPortPos to myPort:POSITION.
		set myPortVel to myPort:SHIP:VELOCITY:ORBIT.
		set otherPortRot to otherPort:PORTFACING.
		set otherPortInverseRot to ANGLEAXIS(180,otherPortRot:TOPVECTOR)*otherPort:PORTFACING.
		set otherPortPos to otherPort:POSITION.
		set otherPortVel to otherPort:SHIP:VELOCITY:ORBIT.

		// Choose the 3 aim points:

		set aimPointApproach to otherPortPos.
		set aimPointAlign to otherPortPos + alignDist*otherPortRot:VECTOR.
		// pick which skirt aim point to use depending on which is closer:
		set aimPoint1 to otherPortPos + alignDist*otherPortRot:STARVECTOR.
		set aimPoint2 to otherPortPos + alignDist*(-1)*otherPortRot:STARVECTOR.
		if aimPoint1:MAG < aimPoint2:MAG {
		set aimPointSkirt to aimPoint1.
		} else {
		set aimPointSkirt to aimPoint2.
		}.

		if curMode = skirtMode {
		set aimPoint to aimPointSkirt.
		} else if curMode = alignMode {
		set aimPoint to aimPointAlign.
		} else if curMode = approachMode {
		set aimPoint to aimPointApproach.
		} else {
		print "I don't understand curMode=" + curMode. // shouldn't happen.
		}.

		set myPortRelAimPoint to aimPoint - myPortPos.
		set relVel to myPortVel - otherPortVel. // relative velocity between the from/to ports.

		// Calculate my port relative offset rotation in terms
		// of the target port's reference frame:
		// Has to be recalculated each time because the target ship might
		// be in motion and rotating relative to the universe's XYZ axes:
		//
		set myPortRotAxis to myShipRot*V( rotAxisX, rotAxisY, rotAxisZ ).
		set otherPortInverseRotAxis to otherPortInverseRot*V( rotAxisX, rotAxisY, rotAxisZ ).
		set myPortRotRelToOther to ANGLEAXIS(-rotAngle,otherPortInverseRotAxis)*otherPortInverseRot.
		set debugRotAxisMe:START to myPortPos.
		set debugRotAxisMe:VEC to myPortRotAxis * 5.
		set debugRotAxisOther:START to otherPortPos.
		set debugRotAxisOther:VEC to otherPortInverseRotAxis * 5.

		// LOCK statements only have to happen once, but they're down in
		// the body of the loop so that I don't have to mention all the variables
		// that appear above more than one time:
		// ---------------------------------------------------------------------
		if firstPass {
		// I want my ship's nose to be orientated such that my ship's docking port
		// is orientated to the exact opposite of the target docking port's orienation:
		lock myShipWantRot to myPortRotRelToOther.
		}.

		// Either control rotation, or control translation, but don't try to do
		// both at the same time because LOCK STEERING and manual control do
		// not play well together.  So if rotation is far off, then just rotate.
		// If rotation is close enough, then just translate.
		// If RCS thrusters are off center then thrusting can case rotation, so
		// allow for switching back to rotation mode when needed:
		// --------------------------------------------------------------------------
		set pointOffset to VANG(myShipWantRot:VECTOR, myShipRot:VECTOR).
		set topOffset to VANG(myShipWantRot:TOPVECTOR, myShipRot:TOPVECTOR).

		if pointOffset < 4 and topOffset < 4 {
		SAS ON.
		SET SHIP:CONTROL:PITCH to 0.
		SET SHIP:CONTROL:YAW   to 0.
		SET SHIP:CONTROL:ROLL  to 0.
		}
		else {

			// ----------------------
			// CORRECT THE ROTATION.
			// ----------------------
      lock steering to otherPortInverseRot.
			SAS OFF.
			RCS OFF.
			
			// // How far offset is my rotation on the 3 rotational axes?
			 set pitchOff to VANG(myShipRot:TOPVECTOR, myShipWantRot:FOREVECTOR) - 90 .
			 set yawOff   to VANG(myShipRot:STARVECTOR, myShipWantRot:FOREVECTOR) - 90 .
			 set rollOff  to VANG(myShipRot:STARVECTOR, myShipWantRot:TOPVECTOR) - 90 .

			// // Maybe flip to other quadrant if angle is backward:
			// if VDOT(myShipWantRot:FOREVECTOR, myShipRot:FOREVECTOR) < 0 {set pitchOff to 180 - pitchOff.}.
			// if VDOT(myShipWantRot:FOREVECTOR, myShipRot:FOREVECTOR) < 0 {set yawOff to 180 - yawOff.}.
			// if VDOT(myShipWantRot:TOPVECTOR, myShipRot:TOPVECTOR) < 0 {set rollOff to 180 - rollOff.}.

			// // Ugly hack to write the degrees 180..270 as the more sensible degrees -90..-180:
			// if pitchOff > 180 { set pitchOff to pitchOff - 360. }.
			// if yawOff > 180 { set yawOff to yawOff - 360. }.
			// if rollOff > 180 { set rollOff to rollOff - 360. }.

			// // How fast is my offset changing on the 3 rotational axes?
			// set pitchVel to ANGLEDIFF(prevPitchOff, pitchOff) / deltaT.
			// set yawVel   to ANGLEDIFF(prevYawOff, yawOff)     / deltaT.
			 set rollVel  to ANGLEDIFF(prevRollOff, rollOff)   / deltaT.

			// // How fast would I prefer it to be changing?
			// // This a part that would be better replaced with PID logic, but this
			// // script is getting too long, so simpler logic will have to do:
			// set wantPitchVel to -(pitchOff+pitchVel*deltaT).
			// set wantYawVel   to -(yawOff+yawVel*deltaT).
			// set wantRollVel  to -(rollOff+rollVel*deltaT).

			// // Set the controls to oppose how reality differs from the preference:
			// // if abs(rollVel) < 2 { // Suppress the steering control until the roll rate is slowed down to sanity.
			// 	set SHIP:CONTROL:PITCH to (wantPitchVel - pitchVel) / spinPower.
			// 	set SHIP:CONTROL:YAW   to (wantYawVel - yawVel) / spinPower.
			// // } else {
			// //   set SHIP:CONTROL:PITCH to 0.
			// //   set SHIP:CONTROL:YAW   to 0.
			// // }.
			// set SHIP:CONTROL:ROLL to (wantRollVel - rollVel) / spinPower.

			// // Remember for next pass:
			// set prevPitchOff to pitchOff.
			// set prevYawOff   to yawOff.
			// set prevRollOff  to rollOff.

		}.

		//print "        " at (10,2).
		print round(pitchOff,1) at (25,8).
		//print "        " at (23,2).
		print round(yawOff,1)   at (40,8).
		//print "        " at (37,2).
		print round(rollOff,1)  at (58,8).
		//print round(rollVel,2)  at (37,3).
		//print round(ship:control:roll,2)  at (37,4).
		//print "Rotating  " at (2,4).
		print round(relVel:MAG,2) + "     " at (40,9).
		//print "----"            + "     " at (25,6).

		if pointOffset < 10 and topOffset < 10 {

		// --------------------------
		// CORRECT TRANSLATION, only when rotation is pretty okay.
		// --------------------------

		RCS ON.

		// KEEP THE ROTATION FIXED AS IT IS:
		//print "          " at (2,4).

		// Relative velocity in terms of my ship's orientation:
		set relVelMyFore to VDOT( relVel, myShipRot:FOREVECTOR ).
		set relVelMyStar to VDOT( relVel, myShipRot:STARVECTOR ).
		set relVelMyTop  to VDOT( relVel, myShipRot:TOPVECTOR ).

		// Desired Relative Velocity Direction (as a normalized unit vector)
		// in terms of my ship's orientation:
		set wantRelVelMyForeDir to VDOT( myPortRelAimPoint:NORMALIZED, myShipRot:FOREVECTOR ).
		set wantRelVelMyStarDir to VDOT( myPortRelAimPoint:NORMALIZED, myShipRot:STARVECTOR ).
		set wantRelVelMyTopDir  to VDOT( myPortRelAimPoint:NORMALIZED, myShipRot:TOPVECTOR ).

		// Desired Relative speed depends on how far away the aim point is, and the translation scaling factor:
		set wantSpeed to MIN( speedMax, ((transPower/30)*myPortRelAimPoint:MAG+1)*speedMin ).

		// Calculate how far off the desired relative velocity is from the actual relative velocity:
		set wantVelOffsetFore to (wantSpeed*wantRelVelMyForeDir) - relVelMyFore.
		set wantVelOffsetStar to (wantSpeed*wantRelVelMyStarDir) - relVelMyStar.
		set wantVelOffsetTop  to (wantSpeed*wantRelVelMyTopDir)  - relVelMyTop.

		// Use that to decide how to set the translation controls:
		set SHIP:CONTROL:FORE      to wantVelOffsetFore.
		set SHIP:CONTROL:STARBOARD to wantVelOffsetStar.
		set SHIP:CONTROL:TOP       to wantVelOffsetTop.

		if wantVelOffsetFore < 0.05 and wantVelOffsetStar < 0.05 and wantVelOffsetTop < 0.05 {
			print "Drifting     " at (13,6). // Todo: switch to HUDTEXT() after next release.
		} else {
			print "Translating  " at (13,6). // Todo: switch to HUDTEXT() after next release.
		}.
		}.
		//print round(relVel:MAG,2) + "     " at (40,5).
		print round(wantSpeed,2) + "     " at (40,10).
		set relPos to aimPoint - myPortPos.
		print round(relPos:MAG,1) + " m   " at (40,11).
    //print toport:distance at (40,12).

		// ----------------------------------
		// Update the pictorials and display:
		// ----------------------------------
		set velDraw:START to myPortPos.
		set velDraw:VEC to 3*relVel.
		set velDraw:LABEL to "relative vel " +round(relVel:MAG,2) + " m/s".
		set rotDraw:START to myShipPos.
		set rotDraw:VEC to 10*myShipWantRot:FOREVECTOR.
		set rotupDraw:START to myShipPos.
		set rotupDraw:VEC to 10*myShipWantRot:TOPVECTOR.
		set skirtPosDraw:VEC to aimPointSkirt - skirtPosDraw:START.
		set alignPosDraw:VEC to aimPointAlign - alignPosDraw:START.
		set approachPosDraw:VEC to aimPointApproach - approachPosDraw:START.

		// Hide some of the displays as modes are passed through:
		if curMode = skirtMode {
		//print "skirt around waypoint" at (22,8). // Todo: switch to HUDTEXT() after next release.
		set skirtPosDraw:START to myPortPos.
		set alignPosDraw:START to aimPointSkirt.
		set approachPosDraw:START to aimPointAlign.
		} else if curMode = alignMode {
		//print "aligning waypoint    " at (22,8). // Todo: switch to HUDTEXT() after next release.
		set skirtPosDraw:SHOW to false.
		set alignPosDraw:START to myPortPos.
		set approachPosDraw:START to aimPointAlign.
		} else if curMode = approachMode {
		//print "docking waypoint     " at (22,8). // Todo: switch to HUDTEXT() after next release.
		set alignPosDraw:SHOW to false.
		set approachPosDraw:START to myPortPos.
		}.

		// Change the mode when appropriate:
		if curMode = skirtMode {
		// Switch as soon as we are no longer behind the docking port:
		// This may happen on the first pass if we start already on the
		// correct side of the other vessel:
		if VDOT(otherPortRot:FOREVECTOR, otherPortPos) < 0 {
			set curMode to alignMode.
		}.
		} else if curMode = alignMode {
		// Switch as soon as we are near the alignment point:
		if myPortRelAimPoint:MAG < 0.5 {
    function printscreendock2
    {
      clearscreen.

      print "################################################################################".
      print "|                                                                              |".
      print "|          _________________________________________________________           |".
      print "|          |   BAKER OS v2.0                                 - 0 X |           |".
      print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
      print "|          |                Automated Docking System               |           |".
      print "|          |        Attempt Final Approach?    Press Action 10     |           |".
      print "|          |   Rotation Error-                                     |           |".
      print "|          |   Pitch:            Yaw:             Roll:            |           |".
      print "|          |   Current Relative Speed:                             |           |".
      print "|          |   Desired Relative Speed:                             |           |".
      print "|          |   Current Aiming Point:                               |           |".
      print "|          |   Aiming Point Distance:                              |           |".
      print "|          |_______________________________________________________|           |".
      print "|                                                                              |".
      print "|______________________________________________________________________________|".
      print "|  START |                                                           " + time:clock + "  |".
      print "################################################################################".
    }

      //printscreendock2().

      print "Attempt Final Approach? Press Action 10" at (15,6).
      set dockfinish to 1.
      V0:PLAY(NOTE(440,0.5)).

      on ag10
      {
        print "Attempting Final Approach!                  " at (15,6).
        set curMode to approachMode.
        set dockfinish to 2.
      }

      wait until dockfinish = 2.

		}.
		} else if curMode = approachMode {
		if myPort:STATE = "Docked (docker)" or myPort:STATE = "Docked (dockee)" {
			set done to true.
		}.
		}.

		set firstPass to false.
	}.

	//print " ".
	//print "Done:  " + myPort:STATE.

	set velDraw:SHOW to false.
	set rotDraw:SHOW to false.
	set rotUpDraw:SHOW to false.
	set debugRotAxisMe:SHOW to false.
	set debugRotAxisOther:SHOW to false.
	set skirtPosDraw:SHOW to false.
	set approachPosDraw:SHOW to false.
	set alignPosDraw:SHOW to false.
	set SHIP:CONTROL:NEUTRALIZE to true.
	//print "PROGRAM COMPLETED." at (40,6).
  unlock steering.
	SAS On.
	RCS OFF.
}

// This program tries to find the docking ports named with these kOS name tags, and assign them
// to the global variables fromPort and toPoint.  If no such docking port exists in the loaded
// universe, then the script will prompt you to find the port you meant and use the rightclick
// menu to assign it the name it's searching for.  
// Note, if both are missing, it prompts you for the toName FIRST, then the fromName.  This is
// done in this weird order so that after you've switched vessels and done this, you'll be back
// on this vessel again as the active one.
select_ports( fromName, toName ).

// This actually does all the work after the ports have been selected.
dock( alignDist, 0.2, maxSpeed, spinPower, transPower, fromPort, toPort, show ).

bakeros().
}

function transfermenu
{
  set searchduration to 400.
  set searchinterval to 250.
  set finalorbitper to 80000.
  set finalorbittype to 1.
  set finalorientation to 1.
  set finalorbittypea to "Circular".
  set finalorientationa to "Prograde".
  set targettypea to "Body".
  set targettype to 1.

  function printscreen
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                    Transfer Menu                      |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + a + "              |           |".
    print "|          |  1. Search Duration       " + searchduration + " * 21600".
    print "|          |  2. Search Interval       " + searchinterval + " Seconds".
    print "|          |  3. Final Orbit Periapsis " + finalorbitper + " Meters".
    print "|          |  4. Final Orbit Type      " + finalorbittypea.
    print "|          |  5. Final Orientation     " + finalorientationa.
    print "|          |  6. Target Type           " + targettypea .  
    print "|          |_______________________________________________________|           |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function transfergui
  {
    set a to 1.
    clearscreen.
    printscreen().

    until false
    {

      function button0 
      {
        
        set a to a - 1.
        printscreen().

        if a < 2
        {
          set a to 1.
        }

      }
      buttons:setdelegate(-4,button0@).
      
      function button1 
      {
        set a to a + 1.
        if a > 6
        {
          set a to 6.
        }

        printscreen().
      }
      buttons:setdelegate(-3,button1@).

      function button2
      {
        if a = 1
        {
          set searchduration to searchduration + 10.
          printscreen().
        }
        if a = 2
        {
          set searchinterval to searchinterval + 10.
          printscreen().
         
        }
        if a = 3
        {
          set finalorbitper to finalorbitper + 5000.
          printscreen().
        }
        if a = 4
        {
          set finalorbittype to finalorbittype + 1.
          printscreen().
          when finalorbittype = 1 then
          {
            set finalorbittypea to "None".
          }
          when finalorbittype = 2 then
          {
            set finalorbittypea to "Circular".
          }
          when finalorbittype = 3 then
          {
            set finalorbittypea to "Elliptical".
          }
          if finalorbittype > 2
          {
            set finalorbittype to 3.
          }
        }
        if a = 5
        {
          set finalorientation to finalorientation + 1.
          printscreen().

          when finalorientation = 1 then
          {
            set finalorientationa to "Prograde". 
          }

          when finalorientation = 2 then
          {
            set finalorientationa to "Retrograde".
          }

          when finalorientation = 3 then
          {
            set finalorientationa to "Polar".
          }

          if finalorientation > 2
          {
            set finalorientation to 3.
          }
        }

        if a = 6
        {

          set targettype to targettype + 1.

          when targettype = 1 then
          {
            set targettypea to "Body".
          }
          
          when targettype = 2 then
          {
            set targettypea to "Vessel".
          }
          when targettype = 3 then
          {
            set targettypea to "Moon".
          }
          if targettype > 3 
          {
            set targettype to 3.
          }
          printscreen().
        }

      }
      buttons:setdelegate(-6,button2@).

      function button3
      {
        if a = 1
        {
          set searchduration to searchduration - 10.
          printscreen().
        }
        if a = 2
        {
          set searchinterval to searchinterval - 10.
          printscreen().
        }
        if a = 3
        {
          set finalorbitper to finalorbitper - 5000.
          printscreen().
        }
        if a = 4
        {
          set finalorbittype to finalorbittype - 1.
          printscreen().

          when finalorbittype = 1 then
          {
            set finalorbittypea to "None".
          }
          when finalorbittype = 2 then
          {
            set finalorbittypea to "Circular".
          }
          when finalorbittype = 3 then
          {
            set finalorbittypea to "Elliptical".
          }
          if finalorbittype < 2
          {
            set finalorbittype to 1.
          }
        }
        if a = 5
        {
          set finalorientation to finalorientation - 1.
          printscreen().

          when finalorientation = 1 then
          {
            set finalorientationa to "Prograde". 
          }

          when finalorientation = 2 then
          {
            set finalorientationa to "Retrograde".
          }

          when finalorientation = 3 then
          {
            set finalorientationa to "Polar".
          }

          if finalorientation < 2
          {
            set finalorientation to 1.
          }
        }

        if a = 6
        {
         
          set targettype to targettype - 1.
          when targettype = 1 then
          {
            set targettypea to "Body".
          }
          when targettype = 2 then
          {
            set targettypea to "Vessel".
          }
          if targettype < 1
          {
            set targettype to 1.
          }
          when targettype = 3 then
          {
            set targetypea to "Moon".
          }
          printscreen().
        }
      }
      buttons:setdelegate(-5,button3@).

      function button4 
      {
       
      }
      buttons:setdelegate(-1,button4@).
      
      function button7 
      {
       
      }
      buttons:setdelegate(7,button7@).
      
      function button8 
      {
      }
      buttons:setdelegate(8,button8@).
      
      function button16 
      {
      }
      buttons:setdelegate(13,button16@).

      function button13 
      {
      }
      buttons:setdelegate(13,button13@).

      printscreen().

      until false
      {

        if a < 2
        {
          set a to 1.
        }
        when a < 2 then
        {
          set a to 1.
        }

        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          set a to a - 1.
          if a < 0
          {
            set a to 0.
          }
      
          set ch to "".
          printscreen(). 
        }

        if ch = terminal:input:UPCURSORONE 
        {
          set a to (a + 1).

          if a > 6
          {
            set a to 6.
          }

          set ch to "".
          printscreen().
        }

        if ch = terminal:input:enter
        {
          if targettype = 1
          {
            if hastarget = true
            {
            }
            else
            {
              bakertarget2().
            }
            
            for maneuver in allnodes 
            {
              remove maneuver.
            }

            set ch to "".
            runoncepath("0:/rsvp/main.ks").

            local options is lexicon
            (
              "search_duration", searchduration * 21600,
              "search_interval", searchinterval,
              "final_orbit_periapsis", finalorbitper,
              "final_orbit_type", finalorbittypea,
              "final_orbit_orientation", finalorientationa,
              "create_maneuver_nodes", "both",
              "verbose", true
            ).
            rsvp:goto(target, options).

            if hastarget = true
            {
            }
            else
            {
              print "Not in a stable orbit..." at (40,5).
              wait 5.
            }

            bakernode().
          }

          if targettype = 2 
          {
            if hastarget = true
            {
            }
            else
            {
              bakertarget2().
            }
              
            for maneuver in allnodes 
            {
              remove maneuver.
            }

            set ch to "".
            runoncepath("0:/rsvp/main.ks").

            local options is lexicon
            (
              //"search_duration", searchduration * 21600,
              //"final_orbit_orientation", prograde,
              "search_interval", searchinterval,
              "create_maneuver_nodes", 
              "both",
              "verbose", true
            ).
            rsvp:goto(target, options).

            if hastarget = true
            {
            }
            else
            {
              print "Not in a stable orbit..." at (40,5).
              wait 5.
            }

            bakernode().
          }

          if targettype = 3
          {
            if hastarget = true
            {
            }
            else
            {
              bakertarget2().
            }
              
            for maneuver in allnodes 
            {
              remove maneuver.
            }

            set ch to "".
            runoncepath("0:/rsvp/main.ks").

            local options is lexicon
            (
              "search_duration", searchduration * 21600,
              "final_orbit_periapsis", finalorbitper,
              "create_maneuver_nodes", "both",
              "verbose", true
            ).
            rsvp:goto(target, options).

            if hastarget = true
            {
            }
            else
            {
              print "Not in a stable orbit..." at (40,5).
              wait 5.
            }

            bakernode().
          }
        }

        if ch = terminal:input:RIGHTCURSORONE 
        {
          set ch to "".

          if a = 1
          {
            set searchduration to searchduration + 10.
            printscreen().
          }
          if a = 2
          {
            set searchinterval to searchinterval + 10.
            printscreen().
          }
          if a = 3
          {
            set finalorbitper to finalorbitper + 5000.
            printscreen().
          }
          if a = 4
          {
            set finalorbittype to finalorbittype + 1.
            printscreen().

            when finalorbittype = 1 then
            {
              set finalorbittypea to "None".
            }
            when finalorbittype = 2 then
            {
              set finalorbittypea to "Circular".
            }
            when finalorbittype = 3 then
            {
              set finalorbittypea to "Elliptical".
            }
            if finalorbittype > 2
            {
              set finalorbittype to 3.
            }
          }
          if a = 5
          {
            set finalorientation to finalorientation + 1.
            printscreen().

            when finalorientation = 1 then
            {
              set finalorientationa to "Prograde". 
            }

            when finalorientation = 2 then
            {
              set finalorientationa to "Retrograde".
            }

            when finalorientation = 3 then
            {
              set finalorientationa to "Polar".
            }

            if finalorientation > 2
            {
              set finalorientation to 3.
            }
            printscreen().
          }

          if a = 6
          {
            set targettype to targettype + 1.
            when targettype = 1 then
            {
              set targettypea to "Body".
            }
            
            when targettype = 2 then
            {
              set targettypea to "Vessel".
            }
            
            when targettype = 3 then
            {
              set targettypea to "Moon".
            }
            
            if targettype > 3
            {
              set targettype to 3.
            }
            printscreen().
          }
        }

        if ch = terminal:input:LEFTCURSORONE 
        {
          set ch to "".
          
          if a = 1
          {
            set searchduration to searchduration - 10.
            printscreen().
          }
          if a = 2
          {
            set searchinterval to searchinterval - 10.
            printscreen().
          }
          if a = 3
          {
            set finalorbitper to finalorbitper - 5000.
            printscreen().
          }
          if a = 4
          {
            set finalorbittype to finalorbittype - 1.
            printscreen().

            when finalorbittype = 1 then
            {
              set finalorbittypea to "None".
            }
            when finalorbittype = 2 then
            {
              set finalorbittypea to "Circular".
            }
            when finalorbittype = 3 then
            {
              set finalorbittypea to "Elliptical".
            }
            if finalorbittype < 2
            {
              set finalorbittype to 1.
            }
          }
          if a = 5
          {
            set finalorientation to finalorientation - 1.
            printscreen().

            when finalorientation = 1 then
            {
              set finalorientationa to "Prograde". 
            }

            when finalorientation = 2 then
            {
              set finalorientationa to "Retrograde".
            }

            when finalorientation = 3 then
            {
              set finalorientationa to "Polar".
            }

            if finalorientation < 2
            {
              set finalorientation to 1.
            }
          }
          
          if a = 6
          {

            set targettype to targettype - 1.

            when targettype = 1 then
            {
              set targettypea to "Body".
            }
            
            when targettype = 2 then
            {
              set targettypea to "Vessel".
            }
            if targettype < 1
            {
              set targettype to 1.
            }
            printscreen().
          }
          printscreen().
        }

      }
    }
  }
  transfergui().
}

function blackjack
{
    function title
    {
    print "################################################################################".
    print "|          _____                    _____                   ____  ____         |".
    print "|         |     \  |      |\       |      |  /             /    \/    \        |".
    print "|         |     |  |      | \      |      | /              \          /        |".
    print "|         |     |  |      |  \     |      |/                \        /         |".
    print "|         |_____|  |      |___\    |      |\                 \      /          |".
    print "|         |     |  |      |    \   |      | \                 \    /           |".
    print "|         |     |  |      |     \  |      |  \                 \  /            |".
    print "|         |_____|  |____  |      \ |_____ |   \                 \/             |".
    print "|           _                    ____________           _____                  |".
    print "|          / \                         |      |\       |       |  /            |".
    print "|         /   \                        |      | \      |       | /             |".
    print "|        /     \                       |      |  \     |       |/              |".
    print "|       /   _   \                      |      |___\    |       |\              |".
    print "|       \__/ \__/               |      |      |    \   |       | \             |".
    print "|         /___\                 |______|      |     \  |_____  |  \            |".
    print "|                                                                              |".
    print "################################################################################".
    }

    function deal1
    {

    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| __________________ __________________  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".   
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    print bank at (8,13).
    print bet at (7,14).
    }

    function deal2
    {
    // set bjmenu to 2.
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                                        |".
    print "| |                | |/\/\/\/\/\/\/\/\| __________________ __________________  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal3
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                                        |".
    print "| |                | |                | __________________ __________________  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal4
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       ________________ |".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal14
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |                | |/\/\/\/\/\/\/\/\|                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       ________________ |".
    print "| |                | |/\/\/\/\/\/\/\/\| __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal5
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                                        |".
    print "| |                | |                |                         _______________|".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal6
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:                                     BLACKJACK v2.0                 |".
    print "| __________________ __________________                           _____________|".
    print "| |                | |                |                         _|_____________|".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal8
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:         __________________          BLACKJACK v2.0                 |".
    print "| __________________|________________|_                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       ________________ |".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal7
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:         __________________          BLACKJACK v2.0                 |".
    print "| __________________|________________|_                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                                        |".
    print "| |                | |                | __________________ __________________  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal9
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:         __________________          BLACKJACK v2.0                 |".
    print "| __________________|________________|_                                        |".
    print "| |                | |                |                         ______________ |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal10
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:         __________________          BLACKJACK v2.0                 |".
    print "| __________________|________________|_                           _____________|".
    print "| |                | |                |                         _|_____________|".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal11
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:       | _______________|__          BLACKJACK v2.0                 |".
    print "| ________________|_|________________|_                                        |".
    print "| |                | |                |                                        |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       ________________ |".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal12
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:       | _______________|__          BLACKJACK v2.0                 |".
    print "| ________________|_|________________|_                                        |".
    print "| |                | |                |                         ______________ |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function deal13
    {
    print "#########################################################|  EXIT  |############|".
    print "|   Dealer:       | _______________|__          BLACKJACK v2.0                 |".
    print "| ________________|_|________________|_                           _____________|".
    print "| |                | |                |                         _|_____________|".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|                       _|______________||".
    print "| |                | |                | __________________ __|_______________| |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".   
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |                | |                | |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\| |                | |                |  |".
    print "| |________________| |________________| |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "|                                       |                | |                |  |".
    print "| Bank:                                 |/\/\/\/\/\/\/\/\| |/\/\/\/\/\/\/\/\|  |".
    print "| Bet:                                  |________________| |________________|  |".
    print "| Player:                                                                      |".
    print "|______________________________________________                    ____________|".
    print "|   HIT   |   STAY   |   BET UP  |  BET DOWN  |                    |    DEAL   |".
    }

    function bjmenuprintscreen
    {
      if bjmenu = 1
      {
        deal1().
      }
      if bjmenu = 2
      {
        deal2().
      }
      if bjmenu = 3
      {
        deal3().
      }
      if bjmenu = 4
      {
        deal4().
      }
      if bjmenu = 5
      {
        deal5().
      }
      if bjmenu = 6
      {
        deal6().
      }
      if bjmenu = 7
      {
        deal7().
      }
      if bjmenu = 8
      {
        deal8().
      }
      if bjmenu = 9
      {
        deal9().
      }
      if bjmenu = 10
      {
        deal10().
      }
      if bjmenu = 11
      {
        deal11().
      }
      if bjmenu = 12
      {
        deal12().
      }
      if bjmenu = 13
      {
        deal13().
      }
      if bjmenu = 14
      {
        deal14().
      }

    }

    //system
    function bootdefinitions
    {
      local ch to "".
      set isdone to false.
      set bjmenu to 1.
      set bank to 100.
      set bet to 10.
      
    }

    function randomcard
    {
        
      set card to round(random() * 100).
      definecards().

      if card = 1 lock crd to aspades.
      if card = 2 lock crd to aclubs.
      if card = 3 lock crd to ahearts.
      if card = 4  lock crd to adiamonds.
      if card = 5 lock crd to a2spades.
      if card = 6 lock crd to a2clubs.
      if card = 7 lock crd to a2hearts.
      if card = 8 lock crd to a2diamonds.
      if card = 9 lock crd to a3clubs.
      if card = 10 lock crd to a3diamonds.
      if card = 11 lock crd to a3hearts.
      if card = 12 lock crd to a3spades.
      if card = 13 lock crd to a4clubs.
      if card = 14 lock crd to a4diamonds.
      if card = 15 lock crd to a4hearts.
      if card = 16 lock crd to a4spades.
      if card = 17 lock crd to a5clubs.
      if card = 18 lock crd to a5diamonds.
      if card = 19 lock crd to a5hearts.
      if card = 20 lock crd to a5spades.
      if card = 21 lock crd to a6clubs.
      if card = 22 lock crd to a6diamonds.
      if card = 23 lock crd to a6hearts.
      if card = 24 lock crd to a6spades.
      if card = 25 lock crd to a7clubs.
      if card = 26 lock crd to a7diamonds.
      if card = 27 lock crd to a7hearts.
      if card = 28 lock crd to a7spades.
      if card = 29 lock crd to a8clubs.
      if card = 30 lock crd to a8diamonds.
      if card = 31 lock crd to a8hearts.
      if card = 32 lock crd to a8spades.
      if card = 33 lock crd to a9clubs.
      if card = 34 lock crd to a9diamonds.
      if card = 35 lock crd to a9hearts.
      if card = 36 lock crd to a9spades.
      if card = 37 lock crd to a10clubs.
      if card = 38 lock crd to a10diamonds.
      if card = 39 lock crd to a10hearts.
      if card = 40 lock crd to akclubs.
      if card = 41 lock crd to akdiamonds.
      if card = 42 lock crd to akhearts.
      if card = 43 lock crd to akspades.
      if card = 44 lock crd to aqclubs.
      if card = 45 lock crd to aqdiamonds.
      if card = 46 lock crd to aqhearts.
      if card = 47 lock crd to aqspades.
      if card = 48 lock crd to ajclubs.
      if card = 49 lock crd to ajdiamonds.
      if card = 50 lock crd to ajhearts.
      if card = 51 lock crd to ajspades.
      if card = 52 lock crd to a10spades.
      if card = 53 lock crd to aspades.
      if card = 54 lock crd to aclubs.
      if card = 55 lock crd to ahearts.
      if card = 56  lock crd to adiamonds.
      if card = 57 lock crd to a2spades.
      if card = 58 lock crd to a2clubs.
      if card = 59 lock crd to a2hearts.
      if card = 60 lock crd to a2diamonds.
      if card = 61 lock crd to a3clubs.
      if card = 62 lock crd to a3diamonds.
      if card = 63 lock crd to a3hearts.
      if card = 64 lock crd to a3spades.
      if card = 65 lock crd to a4clubs.
      if card = 66 lock crd to a4diamonds.
      if card = 67 lock crd to a4hearts.
      if card = 68 lock crd to a4spades.
      if card = 69 lock crd to a5clubs.
      if card = 70 lock crd to a5diamonds.
      if card = 71 lock crd to a5hearts.
      if card = 72 lock crd to a5spades.
      if card = 73 lock crd to a6clubs.
      if card = 74 lock crd to a6diamonds.
      if card = 75 lock crd to a6hearts.
      if card = 76 lock crd to a6spades.
      if card = 77 lock crd to a7clubs.
      if card = 78 lock crd to a7diamonds.
      if card = 79 lock crd to a7hearts.
      if card = 80 lock crd to a7spades.
      if card = 81 lock crd to a8clubs.
      if card = 82 lock crd to a8diamonds.
      if card = 83 lock crd to a8hearts.
      if card = 84 lock crd to a8spades.
      if card = 85 lock crd to a9clubs.
      if card = 86 lock crd to a9diamonds.
      if card = 87 lock crd to a9hearts.
      if card = 88 lock crd to a9spades.
      if card = 89 lock crd to a10clubs.
      if card = 90 lock crd to a10diamonds.
      if card = 91 lock crd to a10hearts.
      if card = 92 lock crd to akclubs.
      if card = 93 lock crd to akdiamonds.
      if card = 94 lock crd to akhearts.
      if card = 95 lock crd to akspades.
      if card = 96 lock crd to aqclubs.
      if card = 97 lock crd to aqdiamonds.
      if card = 98 lock crd to aqhearts.
      if card = 99 lock crd to aqspades.
      if card = 100 lock crd to ajclubs.

      return crd.

    }

    function definecards
    {
      set aspades to list("A Spades   ",1,1,1).
      set aclubs to list("A Clubs    ",2,2,1).
      set ahearts to list("A Hearts   ",3,3,1).
      set adiamonds to list("A Diamonds ",4,4,1).
      set a2spades to list("2 Spades   ",5,1,2).
      set a2clubs to list("2 Clubs    ",6,2,2).
      set a2hearts to list("2 Hearts   ",7,3,2).
      set a2diamonds to list("2 Diamonds ",8,4,2).
      set a3spades to list("3 Spades   ",9,1,3).
      set a3clubs to list("3 Clubs    ",10,2,3).
      set a3hearts to list("3 Hearts   ",11,3,3).
      set a3diamonds to list("3 Diamonds ",12,4,3).
      set a4spades to list("4 Spades   ",13,1,4).
      set a4clubs to list("4 Clubs    ",14,2,4).
      set a4hearts to list("4 Hearts   ",15,3,4).
      set a4diamonds to list("4 Diamonds ",16,4,4).
      set a5spades to list("5 Spades   ",17,1,5).
      set a5clubs to list("5 Clubs    ",18,2,5).
      set a5hearts to list("5 Hearts   ",19,3,5).
      set a5diamonds to list("5 Diamonds ",20,4,5).
      set a6spades to list("6 Spades   ",21,1,6).
      set a6clubs to list("6 Clubs    ",22,2,6).
      set a6hearts to list("6 Hearts   ",23,3,6).
      set a6diamonds to list("6 Diamonds ",24,4,6).
      set a7spades to list("7 Spades   ",25,1,7).
      set a7clubs to list("7 Clubs    ",26,2,7).
      set a7hearts to list("7 Hearts   ",27,3,7).
      set a7diamonds to list("7 Diamonds ",28,4,7).
      set a8spades to list("8 Spades   ",29,1,8).
      set a8clubs to list("8 Clubs    ",30,2,8).
      set a8hearts to list("8 Hearts   ",31,3,8).
      set a8diamonds to list("8 Diamonds ",32,4,8).
      set a9spades to list("9 Spades   ",33,1,9).
      set a9clubs to list("9 Clubs    ",34,2,9).
      set a9hearts to list("9 Hearts   ",35,3,9).
      set a9diamonds to list("9 Diamonds ",36,4,9).
      set a10spades to list("10 Spades  ",37,1,10).
      set a10clubs to list("10 Clubs   ",38,2,10).
      set a10hearts to list("10 Hearts  ",39,3,10).
      set a10diamonds to list("10 Diamonds",40,4,10).
      set akspades to list("K Spades   ",41,1,10).
      set akclubs to list("K Clubs    ",42,2,10).
      set akhearts to list("K Hearts   ",43,3,10).
      set akdiamonds to list("K Diamonds ",44,4,10).
      set aqspades to list("Q Spades   ",45,1,10).
      set aqclubs to list("Q Clubs    ",46,2,10).
      set aqhearts to list("Q Hearts   ",47,3,10).
      set aqdiamonds to list("Q Diamonds ",48,4,10).
      set ajspades to list("J Spades   ",49,1,10).
      set ajclubs to list("J Clubs    ",50,2,10).
      set ajhearts to list("J Hearts   ",51,3,10).
      set ajdiamonds to list("J Diamonds ",52,4,10).
    }

    function deal
    {
      set abj to randomcard().
      set bbj to randomcard().
      set cbj to randomcard().
      set dbj to randomcard().
      set ebj to randomcard().
      set fbj to randomcard().
      set gbj to randomcard().
      set hbj to randomcard().
      set ibj to randomcard().
      set jbj to randomcard().
      set kbj to randomcard().
      set lbj to randomcard().
      set mbj to randomcard().
      set nbj to randomcard().
      set obj to randomcard().
      set pbj to randomcard().
      set qbj to randomcard().
      set rbj to randomcard().
      set sbj to randomcard().
      set tbj to randomcard().
      set ubj to randomcard().
      set vbj to randomcard().
      set wbj to randomcard().
      set xbj to randomcard().
      set ybj to randomcard().
      set zbj to randomcard().
    }

    function gameover
    {
      set playerscorenumber to 1.
      definecards().
      deal().
      deal1().
      set bjmenu to 1.
    }

    //RUN ORDER
    function runorder
    {
      set playerscorenumber to 1.
      definecards().
      bootdefinitions().
      deal().
      title().
      set playerscore to cbj[3] + dbj[3].
      set dealerscore to abj[3] + bbj[3].
      set end to 0.

      //INtro SONG
      V0:PLAY
      (
        LIST
        (
          NOTE("A4", 0.2,  0.25), 
          NOTE("A4",  0.2,  0.25), 
          NOTE("C#4", 0.2,  0.25), 
          NOTE("C#4",  0.2,  0.25), 
          NOTE("C#4", 0.2,  0.25), 
          NOTE("C#4",  0.2,  0.25), 
          NOTE("D4", 0.2,  0.25), 
          NOTE("D4",  0.2,  0.25), 
          NOTE("C#4", 0.2,  0.25), 
          NOTE("C#4",  0.2,  0.25), 
          NOTE("A4", 0.2,  0.25), 
          NOTE("A4",  0.2,  0.25), 
          NOTE("A4", 0.2,  0.25), 
          NOTE("G4",  0.2,  0.25),
          NOTE("F4", 0.2,  0.25), 
          NOTE("F4",  0.2,  0.25), 
          NOTE("A4", 0.2,  0.25), 
          NOTE("A4",  0.2,  0.25), 
          NOTE("G4", 0.2,  0.25), 
          NOTE("G4",  0.2,  0.25), 
          NOTE("G4", 0.2,  0.25), 
          NOTE("F4",  0.2,  0.25), 
          NOTE("E4", 0.2,  0.25), 
          NOTE("E4",  0.2,  0.25), 
          NOTE("D4", 0.2,  0.25), 
          NOTE("E4",  0.2,  0.25), 
          NOTE("F4", 0.2,  0.25), 
          NOTE("F4",  0.2,  0.25) 
        )
      ).

      wait 5.
      deal1().
    }

    runorder().

    //BUTTONS
    //button 0
    function button0 
    {
      print "test".
    }
    buttons:setdelegate(0,button0@).

    //button 1
    function button1 
    {
      print "test1".
    }
    buttons:setdelegate(1,button1@).

    //button 2
    function button2 
    {
      print "test2".
    }
    buttons:setdelegate(2,button2@).

    //Button 3
    function button3 
    {
      print "test3".
    }
    buttons:setdelegate(3,button3@).

    //Button 4
    function button4 
    {
      print "test4".
    }
    buttons:setdelegate(4,button4@).

    //Button 5 EXIT
    function button5 
    {
      Print "Press Enter to EXIT!" at (50,3).
      //set end to 1.
      set isdone to true.
    }
    buttons:setdelegate(5,button5@).

    //Button 6
    function button6 
    {
      print "test6".
    }
    buttons:setdelegate(6,button6@).

    //Button 7 HIT
    function button7 
    {
      if playerscorenumber = 2
      {
        set playerscore to playerscore - 10.
      }

      SET ch to "".

        if playerscorenumber = 8
        {
          SET ch to "".
          set bjmenu to 6.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print jbj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3] + gbj[3] + hbj[3] + ibj[3] + jbj[3] + kbj[3].

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if gbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if hbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if ibj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          if jbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 3.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }
        }

        if playerscorenumber = 7
        {
          SET ch to "".
          set bjmenu to 6.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print jbj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3] + gbj[3] + hbj[3] + ibj[3] + jbj[3].
          set playerscorenumber to 8.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if gbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if hbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if ibj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          if jbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 8.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }

        }

        if playerscorenumber = 6
        {
          SET ch to "".
          set bjmenu to 6.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print ibj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3] + gbj[3] + hbj[3] + ibj[3].
          set playerscorenumber to 7.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
                
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          if gbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          if hbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          if ibj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 7.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }

        }

        if playerscorenumber = 5
        {
          SET ch to "".
          set bjmenu to 6.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print hbj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3] + gbj[3] + hbj[3].
          set playerscorenumber to 6.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10. 
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 6.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 6.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 6.
            }
          }

          if gbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 6.
            }
          }

          if hbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 6.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }
        }

        if playerscorenumber = 4
        {
          SET ch to "".
          set bjmenu to 6.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print gbj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3] + gbj[3].
          set playerscorenumber to 5.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10. 
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 5.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 5.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 5.
            }
          }

          if gbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
              set playerscorenumber to 5.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }

        }
        
        if playerscorenumber = 3
        {
          SET ch to "".
          set bjmenu to 5.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print fbj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3] + fbj[3].
          set playerscorenumber to 4.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if fbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          print playerscore at (10,15).
          wait 1.

          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }
        }

        if playerscorenumber = 2
        {
          SET ch to "".
          set bjmenu to 4.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print ebj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3].

          print playerscore at (10,15).

          set playerscorenumber to 3.
          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
                
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }
        }

        if playerscorenumber = 1
        {
          SET ch to "".
          set bjmenu to 4.
          bjmenuprintscreen().
          print abj[0] at (4,3).
          print cbj[0] at (42,6).
          print ebj[0] at (61,6).
          print bank at (8,13).
          print bet at (7,14).
          set playerscore to cbj[3] + dbj[3] + ebj[3].
          set playerscorenumber to 3.

          if cbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if dbj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          if ebj[1] < 5
          {
            if playerscore < 12
            {
              set playerscore to playerscore + 10.
            }
          }

          print playerscore at (10,15).
          
          if playerscore > 21
          {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
          }

          if playerscore = 21
          {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
          }

        }
    }
    buttons:setdelegate(7,button7@).

    //Button 8 STAY
    function button8 
    {

        if bjmenu = 4
        {
        SET ch to "".
            bjmenuprintscreen().
            print bank at (8,13).
            print bet at (7,14).
            print playerscore at (10,15).
            print dealerscore at (12,1).
            
            if dealerscore > 15
            {
              if dealerscore < 21
              {
                if playerscore < 21
                {
                  if playerscore > dealerscore
                  {
                    print "Player WIN!" at (50,3).
                    set bank to bank + bet.
                    wait 1.
                    gameover().
                  }
                }
              }
                
            }

            if dealerscore = playerscore
            {
              print "PUSH!" at (50,3).
              wait 1.
              gameover().
            }

            if dealerscore > 15
            {
              if playerscore < 21
              {
                if playerscore < dealerscore
                {
                  if dealerscore < 21
                  {
                    print "Dealer WIN!" at (50,3).
                    set bank to bank - bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            until dealerscore > 16
            {
                if dealerscore < 17
                {
                    set bjmenu to 7.
                    bjmenuprintscreen().
                    print abj[0] at (4,3).
                    print cbj[0] at (42,6).
                    print ebj[0] at (61,6).
                    print dbj[0] at (61,6).
                    print bank at (8,13).
                    print bet at (7,14).
                    print playerscore at (10,15).
                    set dealerscore to abj[3] + bbj[3] + lbj[3].

                    if abj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if bbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if lbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    print lbj[0] at (23,3).
                    print dealerscore at (12,1).
                    wait 1.

                    if dealerscore < 17
                    {
                        set bjmenu to 7.
                        bjmenuprintscreen().
                        print abj[0] at (4,3).
                        print cbj[0] at (42,6).
                        print ebj[0] at (61,6).
                        print dbj[0] at (61,6).
                        print bank at (8,13).
                        print bet at (7,14).
                        print playerscore at (10,15).
                        set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3].

                        if abj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if bbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if lbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if mbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        print mbj[0] at (23,3).
                        print dealerscore at (12,1).
                        wait 1.
                        if dealerscore < 17
                        {
                            set bjmenu to 7.
                            bjmenuprintscreen().
                            print abj[0] at (4,3).
                            print cbj[0] at (42,6).
                            print ebj[0] at (61,6).
                            print dbj[0] at (61,6).
                            print bank at (8,13).
                            print bet at (7,14).
                            print playerscore at (10,15).

                            set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3].
                                
                            if abj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if bbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if lbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if mbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if nbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            print nbj[0] at (23,3).
                            print dealerscore at (12,1).
                            wait 1.

                            if dealerscore < 17
                            {
                              set bjmenu to 7.
                              bjmenuprintscreen().
                              print abj[0] at (4,3).
                              print cbj[0] at (42,6).
                              print ebj[0] at (61,6).
                              print dbj[0] at (61,6).
                              print bank at (8,13).
                              print bet at (7,14).
                              print playerscore at (10,15).
                              print obj[0] at (23,3).
                              set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3] + obj[3].
                              print dealerscore at (12,1).
                              wait 1.
                            }
                        }
                    }

                    if dealerscore = playerscore
                    {
                        print "PUSH!" at (50,3).
                        wait 1.
                        gameover().
                    }

                    if dealerscore > 15
                    {
                      if playerscore < 21
                      {
                        if playerscore < dealerscore
                        {
                          if dealerscore < 21
                          {
                            print "Dealer WINS!" at (50,3).
                            set bank to bank - bet.
                            wait 1.
                            gameover().
                          }
                        }
                      }
                    }

                    if dealerscore > 15
                    {
                      if dealerscore < 21
                      {
                        if playerscore < 21
                        {
                          if playerscore > dealerscore
                          {
                            print "Player WINS!" at (50,3).
                            set bank to bank + bet.
                            wait 1.
                            gameover().
                          }
                        }
                      }
                    }
                }
            }
        }
        if bjmenu = 5
        {
            SET ch to "".
            bjmenuprintscreen().
            print bank at (8,13).
            print bet at (7,14).
            print playerscore at (10,15).
            print dealerscore at (12,1).
            
            if dealerscore > 15
            {
              if dealerscore < 21
              {
                if playerscore < 21
                {
                  if playerscore > dealerscore
                  {
                    print "Player WINS!" at (50,3).
                    set bank to bank + bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            if dealerscore = playerscore
            {
              print "PUSH!" at (50,3).
              wait 1.
              gameover().
            }

            if dealerscore > 15
            {
              if playerscore < 21
              {
                if playerscore < dealerscore
                {
                  if dealerscore < 21
                  {
                    print "Dealer WINS!" at (50,3).
                    set bank to bank - bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            until dealerscore > 16
            {
                if dealerscore < 17
                {
                    set bjmenu to 7.
                    bjmenuprintscreen().
                    print abj[0] at (4,3).
                    print cbj[0] at (42,6).
                    print ebj[0] at (61,6).
                    print dbj[0] at (61,6).
                    print bank at (8,13).
                    print bet at (7,14).
                    print playerscore at (10,15).
                    set dealerscore to abj[3] + bbj[3] + lbj[3].

                    if abj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if bbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if lbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    print lbj[0] at (23,3).
                    print dealerscore at (12,1).
                    wait 1.

                    if dealerscore < 17
                    {
                        set bjmenu to 7.
                        bjmenuprintscreen().
                        print abj[0] at (4,3).
                        print cbj[0] at (42,6).
                        print ebj[0] at (61,6).
                        print dbj[0] at (61,6).
                        print bank at (8,13).
                        print bet at (7,14).
                        print playerscore at (10,15).
                        set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3].

                        if abj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if bbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if lbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        if mbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 10.
                          }
                        }

                        print mbj[0] at (23,3).
                        print dealerscore at (12,1).
                        wait 1.

                        if dealerscore < 17
                        {
                            set bjmenu to 7.
                            bjmenuprintscreen().
                            print abj[0] at (4,3).
                            print cbj[0] at (42,6).
                            print ebj[0] at (61,6).
                            print dbj[0] at (61,6).
                            print bank at (8,13).
                            print bet at (7,14).
                            print playerscore at (10,15).
                            set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3].
                                
                            if abj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if bbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if lbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if mbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            if nbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 10.
                              }
                            }

                            print nbj[0] at (23,3).
                            print dealerscore at (12,1).
                            wait 1.

                            if dealerscore < 17
                            {
                              set bjmenu to 7.
                              bjmenuprintscreen().
                              print abj[0] at (4,3).
                              print cbj[0] at (42,6).
                              print ebj[0] at (61,6).
                              print dbj[0] at (61,6).
                              print bank at (8,13).
                              print bet at (7,14).
                              print playerscore at (10,15).
                              print obj[0] at (23,3).
                              set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3] + obj[3].
                              print dealerscore at (12,1).
                              wait 1.
                            }
                        }
                    }

                    if dealerscore = playerscore
                    {
                        print "PUSH!" at (50,3).
                        wait 1.
                        gameover().
                    }

                    if dealerscore > 15
                    {
                      if playerscore < 21
                      {
                        if playerscore < dealerscore
                        {
                          if dealerscore < 21
                          {
                            print "Dealer WINS!" at (50,3).
                            set bank to bank - bet.
                            wait 1.
                            gameover().
                          }
                        }
                      }
                    }

                    if dealerscore > 15
                    {
                      if dealerscore < 21
                      {
                        if playerscore < 21
                        {
                          if playerscore > dealerscore
                          {
                            print "Player WINS!" at (50,3).
                            set bank to bank + bet.
                            wait 1.
                            gameover().
                          }
                        }
                      }
                    }
                }
            }
        }

        if bjmenu = 6
        {
            SET ch to "".
            bjmenuprintscreen().
            print bank at (8,13).
            print bet at (7,14).
            print playerscore at (10,15).
            print dealerscore at (12,1).
            
            if dealerscore > 15
            {
              if dealerscore < 21
              {
                if playerscore < 21
                {
                  if playerscore > dealerscore
                  {
                    print "Player WINS!" at (50,3).
                    set bank to bank + bet.
                    wait 1.
                    gameover().
                  }
                }
              } 
            }

            if dealerscore = playerscore
            {
              print "PUSH!" at (50,3).
              wait 1.
              gameover().
            }

            if dealerscore > 15
            {
              if playerscore < 21
              {
                if playerscore < dealerscore
                {
                  if dealerscore < 21
                  {
                    print "Dealer WINS!" at (50,3).
                    set bank to bank - bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            until dealerscore > 16
            {
              if dealerscore < 17
              {
                set bjmenu to 7.
                bjmenuprintscreen().
                print abj[0] at (4,3).
                print cbj[0] at (42,6).
                print ebj[0] at (61,6).
                print dbj[0] at (61,6).
                print bank at (8,13).
                print bet at (7,14).
                print playerscore at (10,15).

                set dealerscore to abj[3] + bbj[3] + lbj[3].
                if abj[1] < 5
                {
                  if dealerscore < 12
                  {
                    set dealerscore to dealerscore + 10.
                  }
                }

                if bbj[1] < 5
                {
                  if dealerscore < 12
                  {
                    set dealerscore to dealerscore + 10.
                  }
                }

                if lbj[1] < 5
                {
                  if dealerscore < 12
                  {
                    set dealerscore to dealerscore + 10.
                  }
                }

                print lbj[0] at (23,3).
                print dealerscore at (12,1).
                wait 1.
                if dealerscore < 17
                {
                    set bjmenu to 7.
                    bjmenuprintscreen().
                    print abj[0] at (4,3).
                    print cbj[0] at (42,6).
                    print ebj[0] at (61,6).
                    print dbj[0] at (61,6).
                    print bank at (8,13).
                    print bet at (7,14).
                    print playerscore at (10,15).
                    set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3].

                    if abj[1] = 1 or 2 or 3 or 4
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 9.
                      }
                    }

                    if bbj[1] = 1 or 2 or 3 or 4
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 9.
                      }
                    }

                    if lbj[1] = 1 or 2 or 3 or 4
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 9.
                      }
                    }

                    if mbj[1] = 1 or 2 or 3 or 4
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 9.
                      }
                    }

                    print mbj[0] at (23,3).
                    print dealerscore at (12,1).
                    wait 1.
                    if dealerscore < 17
                    {
                      set bjmenu to 7.
                      bjmenuprintscreen().
                      print abj[0] at (4,3).
                      print cbj[0] at (42,6).
                      print ebj[0] at (61,6).
                      print dbj[0] at (61,6).
                      print bank at (8,13).
                      print bet at (7,14).
                      print playerscore at (10,15).
                      set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3].
                          
                      if abj[1] = 1 or 2 or 3 or 4
                      {
                        if dealerscore < 12
                        {
                          set dealerscore to dealerscore + 9.
                        }
                      }

                      if bbj[1] = 1 or 2 or 3 or 4
                      {
                        if dealerscore < 12
                        {
                          set dealerscore to dealerscore + 9.
                        }
                      }

                      if lbj[1] = 1 or 2 or 3 or 4
                      {
                        if dealerscore < 12
                        {
                          set dealerscore to dealerscore + 9.
                        }
                      }

                      if mbj[1] = 1 or 2 or 3 or 4
                      {
                        if dealerscore < 12
                        {
                          set dealerscore to dealerscore + 9.
                        }
                      }

                      if nbj[1] = 1 or 2 or 3 or 4
                      {
                        if dealerscore < 12
                        {
                          set dealerscore to dealerscore + 9.
                        }
                      }

                      print nbj[0] at (23,3).
                      print dealerscore at (12,1).
                      wait 1.

                      if dealerscore < 17
                      {
                        set bjmenu to 7.
                        bjmenuprintscreen().
                        print abj[0] at (4,3).
                        print cbj[0] at (42,6).
                        print ebj[0] at (61,6).
                        print dbj[0] at (61,6).
                        print bank at (8,13).
                        print bet at (7,14).
                        print playerscore at (10,15).
                        print obj[0] at (23,3).
                        set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3] + obj[3].
                        print dealerscore at (12,1).
                        wait 1.
                      }
                    }
                }

                if dealerscore = playerscore
                {
                    print "PUSH!" at (50,3).
                    wait 1.
                    gameover().
                }

                if dealerscore > 15
                {
                  if playerscore < 21
                  {
                    if playerscore < dealerscore
                    {
                      if dealerscore < 21
                      {
                        print "Dealer WINS!" at (50,3).
                        set bank to bank - bet.
                        wait 1.
                        gameover().
                      }
                    
                    }
                  }

                }

                if dealerscore > 15
                {
                  if dealerscore < 21
                  {
                    if playerscore < 21
                    {
                      if playerscore > dealerscore
                      {
                        print "Player WINS!" at (50,3).
                        set bank to bank + bet.
                        wait 1.
                        gameover().
                      }
                    }
                  }
                }
              }
            }

        }
        if bjmenu = 2
        {
            SET ch to "".
            bjmenuprintscreen().
            print bank at (8,13).
            print bet at (7,14).
            print playerscore at (10,15).
            print dealerscore at (12,1).
            
            if dealerscore > 15
            {
              if dealerscore < 21
              {
                if playerscore < 21
                {
                  if playerscore > dealerscore
                  {
                    print "Player WINS!" at (50,3).
                    set bank to bank + bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            if dealerscore = playerscore
            {
              print "PUSH!" at (50,3).
              wait 1.
              gameover().
            }

            if dealerscore > 15
            {
              if playerscore < 21
              {
                if playerscore < dealerscore
                {
                  if dealerscore < 21
                  {
                    print "Dealer WINS!" at (50,3).
                    set bank to bank - bet.
                    wait 1.
                    gameover().
                  }
                }
              }
            }

            until dealerscore > 16
            {
                if dealerscore < 17
                {
                    set bjmenu to 7.
                    bjmenuprintscreen().
                    print abj[0] at (4,3).
                    print cbj[0] at (42,6).
                    print ebj[0] at (61,6).
                    print dbj[0] at (61,6).
                    print bank at (8,13).
                    print bet at (7,14).
                    print playerscore at (10,15).
                    set dealerscore to abj[3] + bbj[3] + lbj[3].

                    if abj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if bbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    if lbj[1] < 5
                    {
                      if dealerscore < 12
                      {
                        set dealerscore to dealerscore + 10.
                      }
                    }

                    print lbj[0] at (23,3).
                    print dealerscore at (12,1).
                    wait 1.

                    if dealerscore < 17
                    {
                        set bjmenu to 7.
                        bjmenuprintscreen().
                        print abj[0] at (4,3).
                        print cbj[0] at (42,6).
                        print ebj[0] at (61,6).
                        print dbj[0] at (61,6).
                        print bank at (8,13).
                        print bet at (7,14).
                        print playerscore at (10,15).

                        set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3].
                        if abj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 9.
                          }
                        }

                        if bbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 9.
                          }
                        }

                        if lbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 9.
                          }
                        }

                        if mbj[1] = 1 or 2 or 3 or 4
                        {
                          if dealerscore < 12
                          {
                            set dealerscore to dealerscore + 9.
                          }
                        }

                        print mbj[0] at (23,3).
                        print dealerscore at (12,1).
                        wait 1.

                        if dealerscore < 17
                        {
                            set bjmenu to 7.
                            bjmenuprintscreen().
                            print abj[0] at (4,3).
                            print cbj[0] at (42,6).
                            print ebj[0] at (61,6).
                            print dbj[0] at (61,6).
                            print bank at (8,13).
                            print bet at (7,14).
                            print playerscore at (10,15).
                            set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3].
                                
                            if abj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 9.
                              }
                            }

                            if bbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 9.
                              }
                            }

                            if lbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 9.
                              }
                            }

                            if mbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 9.
                              }
                            }

                            if nbj[1] = 1 or 2 or 3 or 4
                            {
                              if dealerscore < 12
                              {
                                set dealerscore to dealerscore + 9.
                              }
                            }

                            print nbj[0] at (23,3).
                            print dealerscore at (12,1).
                            wait 1.

                            if dealerscore < 17
                            {
                              set bjmenu to 7.
                              bjmenuprintscreen().
                              print abj[0] at (4,3).
                              print cbj[0] at (42,6).
                              print ebj[0] at (61,6).
                              print dbj[0] at (61,6).
                              print bank at (8,13).
                              print bet at (7,14).
                              print playerscore at (10,15).
                              print obj[0] at (23,3).
                              set dealerscore to abj[3] + bbj[3] + lbj[3] + mbj[3] + nbj[3] + obj[3].
                              print dealerscore at (12,1).
                              wait 1.
                            }
                        }
                    }

                    if dealerscore = playerscore
                    {
                        print "PUSH!" at (50,3).
                        wait 1.
                        gameover().
                    }

                    if dealerscore > 15
                    {
                      if playerscore < 21
                      {
                        if playerscore < dealerscore
                        {
                          if dealerscore < 21
                          {
                            print "Dealer WINS!" at (50,3).
                            set bank to bank - bet.
                            wait 1.
                            gameover().
                          }
                        
                        }
                      }

                    }

                    if dealerscore > 15
                    {
                      if dealerscore < 21
                      {
                        if playerscore < 21
                        {
                          if playerscore > dealerscore
                          {
                            print "Player WINS!" at (50,3).
                            set bank to bank + bet.
                            wait 1.
                            gameover().
                          }
                        }
                      }
                    }
                }
            }

        }

        if playerscore = 21
        {
            print "21!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
        }

        if dealerscore = 21
        {
            print "Dealer hits Blackjack!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
        }

        if playerscore > 21
        {
            print "BUST!" at (50,3).
            set bank to bank - bet.
            wait 1.
            gameover().
        }

        if dealerscore > 21
        {
            print "Dealer Busts!" at (50,3).
            set bank to bank + bet.
            wait 1.
            gameover().
        }

    }
    buttons:setdelegate(8,button8@).

    //Button 9 BID UP
    function button9 
    {
        if bjmenu = 1
        {
            set bet to bet + 10.
            print bank + "     "at (8,13).
            print bet +"     "at (7,14).
        }
        if bjmenu = 2
        {
        }
        if bjmenu = 3
        {
        }
        if bjmenu = 4
        {
        }
        if bjmenu = 5
        {
        }
        if bjmenu = 6
        {
        }
        if bjmenu = 7
        {
        }
        if bjmenu = 8
        {  
        }
    }
    buttons:setdelegate(9,button9@).

    //Button 10 BID DOWN
    function button10 
    {
        if bjmenu = 1
        {
            if bet > 0
            {
            set bet to bet - 10.
            print bank + "     "at (8,13).
            print bet +"     "at (7,14).
            }
        }
        if bjmenu = 2
        {
        }
        if bjmenu = 3
        {
        }
        if bjmenu = 4
        {
        }
        if bjmenu = 5
        {
        }
        if bjmenu = 6
        {
        }
        if bjmenu = 7
        {
        }
        if bjmenu = 8
        {
        }
    }
    buttons:setdelegate(10,button10@).

    //Button 11
    function button11 
    {
      if playerscore = dealerscore
      {
        print "PUSH!" at (50,3).
        wait 1.
        gameover().
      }
    }
    buttons:setdelegate(11,button11@).

    //Button 12
    function button12 
    {
      print "test12".
    }
    buttons:setdelegate(12,button12@).

    //Button 13 deal
    function button13 
    {
        SET ch to "".

        if bjmenu = 8
        { 
        }
        if bjmenu = 7
        { 
        }
        if bjmenu = 6
        { 
        }
        if bjmenu = 5
        {  
        }
        if bjmenu = 4
        {  
        }
        if bjmenu = 3
        {
        }
        if bjmenu = 2
        {
        }
        if bjmenu = 1
        {
            set playerscore to cbj[3] + dbj[3].
            set dealerscore to abj[3] + bbj[3].

            if cbj[1] < 5
            {
              if playerscore < 12
              {
                set playerscore to playerscore + 10.
                set playerscorenumber to 2.
              }
            }

            if dbj[1] < 5
            {
              if playerscore < 12
              {
                set playerscore to playerscore + 10.
                set playerscorenumber to 2.
              }
            }

            if abj[1] < 5
            {
              if dealerscore < 12
              {
                set dealerscore to dealerscore + 9.
                set playerscorenumber to 2.
              }
            }

            if bbj[1] < 5
            {
              if dealerscore < 12
              {
                set dealerscore to dealerscore + 9.
                set playerscorenumber to 2.
              }
            }

            if playerscore = 21
            {
              print "BLACKJACK!" at (50,3).
              set bank to bank + (bet *2).
              wait 1.
              gameover().
            }

            if dealerscore = 21
            {
              print "Dealer Hits Blackjack!" at (50,3).
              set bank to bank - bet.
              wait 1.
              gameover().
            }

            set bjmenu to 2.
            bjmenuprintscreen().
            print abj[0] at (4,3).
            print cbj[0] at (42,6).
            print dbj[0] at (61,6).
            print bank at (8,13).
            print bet at (7,14).
            print playerscore at (10,15).
            SET ch to "".
        }
        
    }
    buttons:setdelegate(13,button13@).

    //enterbutton
    function button19
    {
      print "testenter".
    }
    buttons:setdelegate(-1,button19@).

    //cancelbutton
    function button18
    {
      print "testcancel".
    }
    buttons:setdelegate(-2,button18@).

    //UP Button
    function button14 
    {
      print "test14".
    }
    buttons:setdelegate(-3,button14@).

    //DOWN Button
    function button15 
    {
      print "test15".
    }
    buttons:setdelegate(-4,button15@).

    //LEFT Button
    function button16 
    {
      print "test16".
    }
    buttons:setdelegate(-5,button16@).

    //RIGHT Button
    function button17 
    {
      print "test17".
    }
    buttons:setdelegate(-6,button17@).

    //MAINLOOP
    until isdone
    {

      set ch to terminal:input:getchar().

      if ch = terminal:input:DOWNCURSORONE 
      {
        //V0:PLAY(NOTE(440,0.5)).
      }

      if ch = terminal:input:UPCURSORONE 
      {
        //V0:PLAY(NOTE(440,0.5)).
      }

      if ch = terminal:input:enter
      {
        //V0:PLAY(NOTE(440,0.5)).
        bakeros().
      }

      if ch = terminal:input:RIGHTCURSORONE 
      {
        // V0:PLAY(NOTE(440,0.5)).
      }

      if ch = terminal:input:LEFTCURSORONE 
      {
      }
    }
}

function Bakerlaunch
{
  function launchv1
  {
      clearscreen.
      set V0 to GetVoice(0).
      stagemenu().
      Apoapsismenu().
      inclinationmenu().
      Pitchstartvelocitymenu().
      Countdown().
      Ignition().
      Asscentcontrol().
      Shutdownlaunch().
  }

  function Stagemenu
  {

    function stagemenugui
    {
        print "################################################################################".
        print "|                                                                              |".
        print "|          _________________________________________________________           |".
        print "|          |   BAKER OS v1.2                                 - 0 X |           |".
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
        print "|          |                      Baker Launch                     |           |".
        print "|          |        Stage Menu                                     |           |".
        print "|          |                                                       |           |".
        print "|          |        Stages:                                        |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |_______________________________________________________|           |".
        print "|                                                                              |".
        print "|______________________________________________________________________________|".
        print "|  START |                                                           " + time:clock + "  |".
        print "################################################################################".
    }

    stagemenugui().

    set nos to 0.
      
      until false
      {
        print nos at (45,8).
        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          set nos to nos - 1.
        }

        if ch = terminal:input:UPCURSORONE 
        {
          set nos to (nos + 1).
        }

        if ch = terminal:input:enter
        {
          break.
        }
      }
  }

  function Apoapsismenu
  {

    function apoapsismenugui
    {
        print "################################################################################".
        print "|                                                                              |".
        print "|          _________________________________________________________           |".
        print "|          |   BAKER OS v2.0                                 - 0 X |           |".
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
        print "|          |                      Baker Launch                     |           |".
        print "|          |        Apoapsis Menu                                  |           |".
        print "|          |                                                       |           |".
        print "|          |        Apoapsis Target:                               |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |_______________________________________________________|           |".
        print "|                                                                              |".
        print "|______________________________________________________________________________|".
        print "|  START |                                                           " + time:clock + "  |".
        print "################################################################################".
    }

    apoapsismenugui().
    global targetap is 100.

    until false
    {
      print targetap + "km" at (45,8).
      set ch to terminal:input:getchar().

      if ch = terminal:input:DOWNCURSORONE 
      {
        set targetap to targetap - 5.
      }

      if ch = terminal:input:UPCURSORONE 
      {
        set targetap to targetap + 5.
      }

      if ch = terminal:input:enter
      {
        set targetapkm to targetap * 1000.
        break.
      }
    }
  }

  function Inclinationmenu
  {

    function inclinationmenugui
    {
      print "################################################################################".
      print "|                                                                              |".
      print "|          _________________________________________________________           |".
      print "|          |   BAKER OS v2.0                                 - 0 X |           |".
      print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
      print "|          |                      Baker Launch                     |           |".
      print "|          |        Inclination Menu                               |           |".
      print "|          |                                                       |           |".
      print "|          |        Inclnation Target:                             |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |_______________________________________________________|           |".
      print "|                                                                              |".
      print "|______________________________________________________________________________|".
      print "|  START |                                                           " + time:clock + "  |".
      print "################################################################################".
    }
    inclinationmenugui().

      global RelativeInclination is 0.
      set RelativeInclinationx to 0.

      until false
      {
        print RelativeInclination at (45,8).
        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          set RelativeInclination to RelativeInclination - 10.
        }

        if ch = terminal:input:UPCURSORONE 
        {
          set RelativeInclination to RelativeInclination + 10.
        }

        if ch = terminal:input:enter
        {
          set RelativeInclinationx to RelativeInclination.
          break.
        }
      }
  }

  function Pitchstartvelocitymenu
  {

    function pitchmenugui
    {
        print "################################################################################".
        print "|                                                                              |".
        print "|          _________________________________________________________           |".
        print "|          |   BAKER OS v2.0                                 - 0 X |           |".
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
        print "|          |                      Baker Launch                     |           |".
        print "|          |        Gravity Turn Menu                              |           |".
        print "|          |                                                       |           |".
        print "|          |        Velocity at Pitch Start:                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |_______________________________________________________|           |".
        print "|                                                                              |".
        print "|______________________________________________________________________________|".
        print "|  START |                                                           " + time:clock + "  |".
        print "################################################################################".
    }

    pitchmenugui().

      global pitchstartvelocity is 1000.
      set pitchstartvelocityx to 0.

      until false
      {
        print pitchstartvelocity + "  " at (50,8).
        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          set pitchstartvelocity to pitchstartvelocity - 10.
        }

        if ch = terminal:input:UPCURSORONE 
        {
          set pitchstartvelocity to pitchstartvelocity + 10.
        }

        if ch = terminal:input:enter
        {
          set pitchstartvelocityx to pitchstartvelocity.
          break. 
        }
      }
  }

  function Countdown
  {

    function countmenugui
    {
        print "################################################################################".
        print "|                                                                              |".
        print "|          _________________________________________________________           |".
        print "|          |   BAKER OS v2.0                                 - 0 X |           |".
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
        print "|          |                      Baker Launch                     |           |".
        print "|          |        Countdown...                                   |           |".
        print "|          |                                                       |           |".
        print "|          |        LIFTOFF IN:                                    |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |_______________________________________________________|           |".
        print "|                                                                              |".
        print "|______________________________________________________________________________|".
        print "|  START |                                                           " + time:clock + "  |".
        print "################################################################################".
    }
    countmenugui().

      until false
      {
        set x to 5.

        until x < 1 
        {
          print x at (45,8).
          set x to x - 1.
          wait 1.
          if x < 1
          {
            break.
          }
        }
        break.
      }
  }

  function Ignition
  {
      
    function ignitionmenugui
    {
        print "################################################################################".
        print "|                                                                              |".
        print "|          _________________________________________________________           |".
        print "|          |   BAKER OS v2.0                                 - 0 X |           |".
        print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
        print "|          |                      Baker Launch                     |           |".
        print "|          |        Running Launch Program...                      |           |".
        print "|          |                                                       |           |".
        print "|          |        Stages Left:                                   |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |                                                       |           |".
        print "|          |_______________________________________________________|           |".
        print "|                                                                              |".
        print "|______________________________________________________________________________|".
        print "|  START |                                                           " + time:clock + "  |".
        print "################################################################################".
    }
    ignitionmenugui().

    Print "Stages left... " + nos at (20,8).


    set throt to 1.
    lock throttle to throt.
    set up to ship:up:vector.
    lock STEERING TO Up + r(00,00,00).
    stage.  
  }

  function AsscentControl
  {
    LIST ENGINES IN MyList.
    set targetpitch to 0.
    set ooo to 1.
    set TargetRoll to ship:facing:roll +90.
    set steering to heading((90-RelativeInclinationx),90,TargetRoll).
    set vec_pro_horizon to VXCL(UP:VECTOR,PROGRADE:VECTOR).
    set PitchStartAltitude to altitude.
    set h to 1.

    lock wt to ship:mass.
    lock thrus to ship:maxthrust.
    lock thtw to wt / thrus.
    set oldthtw to thtw.
    lock newthtw to thtw.
    set trash to 1.


    FOR engines IN MyList 
    {
      when ENGines:FLAMEOUT and nos > 0 then
      {
        set nos to nos - 1.
        print "Flameout stage." at (50,8).
        //print "Stages left - " + nos.
        stage.
        print nos at (45,8).
        //wait 1.
      }
    }

    when newthtw - oldthtw > 0 then
    {
      if nos > 0
      {
        V0:PLAY(NOTE(440,0.5)).
        set nos to (nos - 1).
        Print "Thrust to weight Staging..." at (20,10).
        Print "Stages left... " + nos at (20,8).
        stage.
        //wait 1.
        set oldthtw to newthtw.
      }
    }
   
    when ship:velocity:surface:mag > pitchstartvelocityx then
    {
      if ooo = 1
      {
        print "Starting Gravity turn..." at (20,9).
        set ooo to 2.
        lock TargetPitch to 135-((ship:apoapsis-PitchStartAltitude)*1.4)/((targetapkm-PitchStartAltitude)/90).
        lock steering to heading((90-RelativeInclinationx),TargetPitch,TargetRoll).
      }  
    }

    when ship:apoapsis > targetapkm then
    {

      if ship:periapsis < targetapkm - 5000
      {
        set throttle to .15.
        wait until ship:altitude > ship:apoapsis - 1000.
        
        set throttle to 1.
        

      }
      else
      {
        //V0:PLAY(NOTE(440,0.5)).
        print "Asscent Control shutdown..." at (45,12).
        set throt to 0.
        set h to 2.
        //break.
        //set throt to .05.
      }

    }


    // if ship:obt:body:atm:exists
    // {
    //   when ship:apoapsis > ship:obt:body:atm:height then
    //   {
    //     if ooo = 2
    //     {
    //       //V0:PLAY(NOTE(440,0.5)).
    //       print "Correcting course to horizon..." at (20,9).
    //       set ooo to 3.
    //       lock steering to vec_pro_horizon.
    //       //lock steering to ship:prograde.
    //     }
    //   }
    // }

    when periapsis > 65000 and trash = 1 then
    {
      rcs on.
      set ship:control:fore to 1.
      stage.
      set trash to 2.
      print "Trash Stage" at (20,10).
      wait 2.
      set ship:control:fore to 0.
    }

    until h = 2
    { 

      if nos > 0
      {
        set oldthtw to newthtw.
      }
      
      //print nos at (45,8).
      // print "targetpitch" + targetpitch.
      // print "steering" + steering.
    }
  }

  function Shutdownlaunch
  {
    //set ship:control:fore to 0.

    V0:PLAY(NOTE(440,0.5)).
    unlock steering.
    set throt to 0.
    if nos > 0
    {
      stage.
      set nos to nos - 1.
    }
    print "Launch nominal:                   " at (20,9).
    print "Ship Apoapsis:" + ship:apoapsis at (20,11).
    print "Ship Periapsis:" + ship:periapsis at (20,12).
    print "Burn Accuracy:" + round((ship:periapsis/ship:apoapsis)*100,2) at (20,7).
    wait 3.
  }

  launchv1().
  bakercircleap().
}    

function enginecontrol
{
  function enginecontrolmain 
  {

  CLEARSCREEN.
  set cursorPosition to 0.
  set currentPage to 0.
  LOCAL totalItems is 12.
  SET isDone to 0.
  set actiontype to 1.
  
  function selectengine
  {
      
    
    if actiontype = 1
    {
      engineList[currentPage * totalItems + cursorPosition]:activate.
      print "Engine " + engineList[cursorPosition] + " Activated." at (20,16).
    }

    if actiontype = 2
    {
      engineList[currentPage * totalItems + cursorPosition]:shutdown.
      print "Engine " + engineList[cursorPosition] + " Deactivated." at (20,16).
    }

    if actiontype = 3
    {
      if engineList[currentPage * totalItems + cursorPosition]:multimode
      {
        engineList[currentPage * totalItems + cursorPosition]:togglemode.
        wait .1.
        print "Selected engine mode changed to: " + engineList[currentPage * totalItems + cursorPosition]:mode at (20,16).
      }
      else
      {
        print "No other modes for selected engine." at (20,16).
      }

    }

    if actiontype = 4
    {
      if intakes = true
      {
        intakes off.
        wait 1.
        print "Intakes: " + intakes + "     " at (40,16).
      }
      else
      {
        intakes on.
        wait 1.
        print "Intakes: " + intakes + "     " at (40,16).
      }
    }
    
  }
  
  function button0 
  {
    if cursorPosition > 0 
    {
    set cursorPosition to cursorPosition - 1.
    }
  }
  buttons:setdelegate(-3,button0@).
  
  function button1 
  {
    if cursorPosition < currentPageList:LENGTH - 1 
    {
    set cursorPosition to cursorPosition + 1.
    }
  }
  buttons:setdelegate(-4,button1@).
  
  function button2 
  {
    if currentPage < maxPages - 1 
    {
    SET currentPage to currentPage + 1.
    SET cursorPosition to 0.
    }
  }
  buttons:setdelegate(-6,button2@).

  function button3 
  {
    if currentPage > 0 
    {
    SET currentPage to currentPage - 1.
    SET cursorPosition to 0.
    }
  }
  buttons:setdelegate(-5,button3@).

  function button4 
  {
    selectengine().
  }
  buttons:setdelegate(-1,button4@).

  function button5 
  {
  }
  buttons:setdelegate(5,button5@).

  function button7 
  {
    set actiontype to 1.
    print "MODE: Activate  " at (0,16).
  }
  buttons:setdelegate(7,button7@).
  
  function button8 
  {
    set actiontype to 2.
    print "MODE: Shutdown  " at (0,16).
  }
  buttons:setdelegate(8,button8@).
  
  function button9 
  {
    set actiontype to 3.
    print "MODE: Togglemode " at (0,16).
  }
  buttons:setdelegate(9,button9@).
  
  function button10 
  {
    set actiontype to 4.
    print "MODE: Intakes Toggle " + intakes at (0,16).
  }
  buttons:setdelegate(10,button10@).
  
  function button11 
  {
  }
  buttons:setdelegate(11,button11@).
  
  function button12 
  {
  }
  buttons:setdelegate(12,button12@).
  
  function button13 
  {
    SET isDone to 1.
    clearscreen.
  }
  buttons:setdelegate(13,button13@).
  
  UNTIL isDone > 0 
  {
    LOCAL position is 1.
    LIST engines in engineList.
    set maxPages to CEILING(engineList:LENGTH / totalItems).
    SET currentPageList to engineList:SUBLIST(currentPage * totalItems, totalItems).
    SET iterengineList to currentPageList:ITERATOR.
    set realPage to currentPage + 1.

    PRINT "| ACTIVATE | SHUTDOWN |   MODE   | INTAKES  |          |          |   EXIT   |" at (0,20).
    PRINT "PAGE " + realPage + " OF " + maxPages + "      BAKER ENGINE CONTROL v2.0" AT (1,0).
    PRINT "--------------------------------------------------------------------------------" AT (0,13).
    PRINT "Engine: " AT (0,14).
    print "Engine TAG: " at (0,15).
    print "Stage: " at (0,16).
    //print "Ignitions: " at (0,17).
    
    UNTIL NOT iterengineList:NEXT 
    {
      if cursorPosition = iterengineList:INDEX 
      {
        PRINT ">" AT (0,position).
      } 
      else 
      {
        PRINT " " AT (0,position).
      }
      
      if currentPageList[iterengineList:INDEX]:ignition 
      {
      PRINT ">" AT (1,position).
      } 
      else 
      {
        PRINT " " AT (1,position).          
      }  
      
      SET strcurrentPageList to currentPageList[position - 1]:title.// + " " + "(" + currentPageList[position - 1]:BODY:NAME + ")".
      PRINT strcurrentPageList:PADRIGHT(20) + "           " AT (2,position).
      // PRINT engineList[cursorPosition]:DISTANCE AT (7,14).
      PRINT currentpageList[cursorPosition]:name + "                              " AT (9,14).
      print currentpageList[cursorPosition]:tag + "                                " at (13,15).
      print currentpageList[cursorPosition]:stage + "                              " at (8,16).
      //print currentpageList[cursorPosition]:ignitions + "                           " at (11,17).
      set position to position + 1.

      if RealPage = maxPages 
      {
        set cleanLocation to currentPageList:LENGTH + 1.
        set cleanDisplayTotal to totalItems - currentPageList:LENGTH.
        set cleanDisplayCounter to 0.
        UNTIL cleanDisplayCounter = cleanDisplayTotal 
        {
        PRINT "                                        " AT (0,cleanLocation).
        set cleanLocation to cleanLocation + 1.
        set cleanDisplayCounter to cleanDisplayCounter + 1.
        }
      }
    }
      wait 0.001.
  }
  CLEARSCREEN.
  }
  enginecontrolmain().
  bakeros().
}    

function bakerexecnode
{
  if hasnode 
  {

    sas off.
    set nd to nextnode.
    rcs on.
    set max_acc to ship:maxthrust/ship:mass.
    lock burn_duration to nd:deltav:mag/max_acc.
    set np to nd:deltav. 
    lock steering to np.
    LIST ENGINES IN MyList.

    function Stagemenu2
    {
      function stagemenugui2
      {
          print "################################################################################".
          print "|                                                                              |".
          print "|          _________________________________________________________           |".
          print "|          |   BAKER OS v2.0                                 - 0 X |           |".
          print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
          print "|          |                 Baker Exe Node v2.0                   |           |".
          print "|          |        Stage Menu                                     |           |".
          print "|          |                                                       |           |".
          print "|          |        Stages:                                        |           |".
          print "|          |                                                       |           |".
          print "|          |                                                       |           |".
          print "|          |                                                       |           |".
          print "|          |                                                       |           |".
          print "|          |_______________________________________________________|           |".
          print "|                                                                              |".
          print "|______________________________________________________________________________|".
          print "|  START |                                                           " + time:clock + "  |".
          print "################################################################################".
      }

      stagemenugui2().
      set nos2 to 0.
  
      until false
      {
        print nos2 at (45,8).
        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          set nos2 to nos2 - 1.
        }

        if ch = terminal:input:UPCURSORONE 
        {
          set nos2 to (nos2 + 1).
        }

        if ch = terminal:input:enter
        {
          break.
        }
      }
    }

    stagemenu2().

    function exenodegui
    {
      print "################################################################################".
      print "|                                                                              |".
      print "|          _________________________________________________________           |".
      print "|          |   BAKER OS v2.0                                 - 0 X |           |".
      print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
      print "|          |               Baker Execute Node v2.0                 |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |                                                       |           |".
      print "|          |_______________________________________________________|           |".
      print "|                                                                              |".
      print "|                                                                              |".
      print "|______________________________________________________________________________|".
      print "|  START |                                                           " + time:clock + "  |".
      print "################################################################################".
    }

    exenodegui().

    until nd:eta <= (burn_duration/2) + 2
    {
      print " Stages left: " + nos2 at(13,11).
      print " Node in: " + round(nd:eta) + ", DeltaV: " + round(nd:deltav:mag) + "             "at (13,7).
      print " Burn duration: " + round(burn_duration)/60 + " Minutes" at (13,8).
      print " Waiting Minutes: " + round((nd:eta - burn_duration/2)/60) + " Minutes." at (13,9).
      print " Waiting Seconds: " + round(nd:eta - burn_duration/2) + " Seconds." at (13,10).
    }

    wait until nd:eta <= (burn_duration/2) + 2.
    set tset to 0.
    lock throttle to tset.
    set done to False.
    set dv0 to nd:deltav.
    set ship:control:fore to 1.
    wait 2.
    set tset to 1.
    set ship:control:fore to 0.


    set estburntime to burn_duration.
  
    // set estburntimea to time.
    lock estendburntime to time + burn_duration.
    
    set nodea to 1.
    set fore1 to 2.
    set fore2 to 2.


    set shipperia to ship:periapsis.
    set shipapoa to ship:apoapsis.
    lock peridiff to shipperia - ship:periapsis.
    lock apodiff to shipapoa - ship:apoapsis.
    lock shipratesensor to peridiff - apodiff.


    
      when (nextnode:orbit:apoapsis/ship:apoapsis) < 1 and shipratesensor > 0 then
      {
        print " Burnstop: Target Apoapsis.                " at (13,11).
        lock throttle to 0.
        set done to true.
      }

      when (nextnode:orbit:periapsis/ship:periapsis) < 1 and shipratesensor < 0 then
      {
        print " Burnstop: Target Periapsis.                     " at (13,11).
        lock throttle to 0.
        set done to true.
      
      }


    until done
    {

      FOR engines IN MyList 
      {
        IF ENGines:FLAMEOUT and nos2 > 0
        {
          set nos2 to nos2 - 1.
          print "Flameout stage." at (45,11).
          //print "Stages left - " + nos.
          stage.
          wait 1.
        }
      }
  
      print " Stages left: " + nos2 at(13,11).
      print " Node in: " + round(nd:eta) + ", DeltaV: " + round(nd:deltav:mag) + "             "at (13,7).
      print " Burn duration: " + round((burn_duration)/60,1) + " Minutes.              " at (13,8).
      print " Waiting: " + round((nd:eta - burn_duration/2)/60,1) + " Minutes.                  " at (13,9).
      print " Waiting Seconds: " + round(nd:eta - burn_duration/2) + " Seconds.               " at (13,10).

      //print "estendburntime: " + burn_duration  at (13,12).
      //print estendburntime at (13,13).
      //print estburntime at (13,14).
      //print time at (13,15).





      if fore1 > 1
      {
        //print "1".
        set ship:control:fore to 0.7.
        wait 2.
        set tset to 1.
        rcs off.
        set ship:control:fore to 0.
        set fore1 to 0.
        //wait 2.
      }

      // if vdot(dv0, nd:deltav) < 0
      // {
      //   print " Burnstop: Vdot < 0.          " at (13,11).
      //   lock throttle to 0.
      //   break.
      // }



      





      print " Primarily moving: " + round(shipratesensor,5) at (13,6).


      // if (target:apoapsis/ship:apoapsis) < 1 and shipratesensor > 0
      // {
      //   print " Burnstop: Target Apoapsis.                " at (13,11).
      //   lock throttle to 0.
      //   set done to true.
      // }

      // if (target:periapsis/ship:periapsis) < 1 and shipratesensor < 0
      // {
      //   print " Burnstop: Target Periapsis.                     " at (13,11).
      //   lock throttle to 0.
      //   set done to true.
      
      // }

      
      if vdot(dv0, nd:deltav) < 0.5
      {

        if nodea = 1
        {
          set estburntime to burn_duration.
    
          // set estburntimea to time.
          set estendburntime to time + burn_duration.
          set nodea to 2.
        }

      

        if time > estendburntime
        {
          print " Burnstop: Burn Duration.          " at (13,11).
          lock throttle to 0.
          break.
        }


        // print " Burnstop: Vdot < 0.          " at (13,11).
        // lock throttle to 0.
        // break.
      }


      if nd:deltav:mag < 0.1
      {
        print " Burnstop: DeltaV Mag < 0.1.            " at (13,11).
        wait until vdot(dv0, nd:deltav) < 0.5.
        lock throttle to 0.
        set done to True.
      }

      // if vdot(dv0, nd:deltav) < 0.1
      // {

      //   // if nodea = 1
      //   // {
      //   //   set estburntime to burn_duration.
    
      //   //   // set estburntimea to time.
      //   //   set estendburntime to time + burn_duration.
      //   //   set nodea to 2.
      //   // }

      

      //   // if time > estendburntime
      //   // {
      //     print " Burnstop: Burn Duration.          " at (13,11).
      //     lock throttle to 0.
      //     break.
      //   // }


      //   // print " Burnstop: Vdot < 0.          " at (13,11).
      //   // lock throttle to 0.
      //   // break.
      // }



      // if nd:deltav:mag < 0.1
      // {
      //   print " Burnstop: DeltaV Mag < 0.1.            " at (13,11).
      //   //wait until vdot(dv0, nd:deltav) < 0.5.
      //   lock throttle to 0.
      //   set done to True.
      // }

      // if ship:orbit:hasnextpatch = true
      // {
      //   if ship:orbit:nextpatch:hasnextpatch
      //   {
      //     if ship:patches[2]:body = target
      //     {
      //       print " Burnstop: Target Match.               " at (13,11).
      //       lock throttle to 0.
      //       set done to True.
      //     }
      //   }
      // }

      if ship:orbit:hasnextpatch = true
      {
        if abs(1-(ship:orbit:nextpatch:apoapsis/nextNode:orbit:nextpatch:apoapsis)) < .01
        {
          if abs(1-(ship:orbit:nextpatch:periapsis/nextNode:orbit:nextpatch:periapsis)) < .01
          {
            print " Burnstop: Periapsis Match.            " at (13,11).
            lock throttle to 0.
            set done to True.
          }
        }
      }

      if ship:orbit:hasnextpatch = true
      {
        if abs(1-(ship:orbit:nextpatch:periapsis/nextNode:orbit:nextpatch:periapsis)) < .01
        {
          if abs(1-(ship:orbit:nextpatch:apoapsis/nextNode:orbit:nextpatch:apoapsis)) < .01
          {
            print " Burnstop: Apoapsis Match.            " at (13,11).
            lock throttle to 0.
            set done to True.
          }
        }
      }

    }

    unlock steering.
    unlock throttle.
    sas on.
    rcs on.
    SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
    print " Remain dv " + round(nd:deltav:mag,1) + "m/s, vdot: " + round(vdot(dv0, nd:deltav),1) at (13,8).
    wait 10.
    bakernode().
  } 
  else 
  {
    clearscreen.
    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |               Baker Execute Node v2.0                 |           |".
    print "|          |                                                       |           |".
    print "|          |           No Node Found!                              |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
    wait 3.
    bakeros().
  }
  
}    
   
function bakerscience
{
  Declare Local SensorList to list().
  Declare Local plist to ship:parts.

  for item in plist 
  {
    if item:hasmodule("ModuleScienceExperiment") or item:hasmodule("DMModuleScienceAnimate")
    {
      SensorList:add(item).
    }
  }

  function sensorcontrol
  {
    function sensorcontrolmain 
    {

    CLEARSCREEN.
    set cursorPosition to 0.
    set currentPage to 0.
    LOCAL totalItems is 12.
    SET isDone to 0.
    set actiontype to 1.
    
    function select
    {
        set p to sensorlist[currentPage * totalItems + cursorPosition].
        
        if p:hasmodule("ModuleScienceExperiment")
        {
          SET M TO P:GETMODULE("ModuleScienceExperiment").
        }
        
        if p:hasmodule("DMModuleScienceAnimate")
        {
          SET M TO P:GETMODULE("DMModuleScienceAnimate").
        }
        

        
        if actiontype = 1
        {
            
            
            if m:inoperable
            {
              print "Sensor Inoperable.                     " at (20,16).
            }

            if m:hasdata
            {
              print "Sensor Data full.                       " at (20,16).
              print "Sensor Data...                      " at (40,5).
              print m:data at (40,6).
            }
            else
            {
              m:deploy().
              
              print "Sensor Deployed.         " at (20,16).
              
              wait 1.

              if m:hasdata
              {
                print "Sensor has data.            " at (40,16).
                print "Sensor Data...                      " at (40,5).
                print m:data at (40,6).
              }
              else
              {
                print "Sensor has no data.           " at (40,16).
                print "Sensor Data...                      " at (40,5).
                print "             " at (40,6).
              }
            }
            //sensorlist[currentPage * totalItems + cursorPosition]:toggle().
            // sensorlist[currentPage * totalItems + cursorPosition]:deploy().
            // print "Sensor " + sensorlist[cursorPosition] + " Deployed." at (20,16).
        }

        if actiontype = 2
        {
          if m:rerunnable
          {
            m:reset().
            print "Sensor Reset.         " at (20,16).
          }
          else
          {
            print "Sensor Not Rerunnable.            " at (20,16).
          }
        }

        if actiontype = 3
        {
          if m:hasdata
          {
            m:transmit().
            print "Sensor data Transmiting...          " at (20,16).
            print "Sensor Data...                      " at (40,5).
            print m:data at (40,6).
            wait 5.
            print "Sensor data Transmited.             " at (20,16).
          }
          else
          {
            print "Sensor Has no data.             " at (20,16).
            print "Sensor Data...                      " at (40,5).
            print "                                    " at (40,6).
          }
        }

        if actiontype = 4
        {
          if m:hasdata
          {
            m:dump().
            print "Sensor Data deleted.            " at (20,16).
            wait 1.
            print "Sensor Data...                      " at (40,5).
            print m:data at (40,6).
          }
          else
          {
            print "Sensor Has no data.              " at (20,16).
            print "Sensor Data...                      " at (40,5).
            print "                                        " at (40,6).
          }
            
        }

        if actiontype = 5
        {
          if m:hasdata
          {   
            print "Sensor Data retrieved.            " at (20,16).
            wait 1.
            print "Sensor Data...                      " at (40,5).
            print m:data at (40,6).
          }
          else
          {
            print "Sensor Has no data.              " at (20,16).
            print "Sensor Data...                      " at (40,5).
            print "                                        " at (40,6).
          }
        }

        if actiontype = 6
        {
          m:toggle.
          print "Toggling Sensor...                  " at (20,16).
        }
    }
    
    function button0 
    {
      if cursorPosition > 0 
      {
      set cursorPosition to cursorPosition - 1.
      }
    }
    buttons:setdelegate(-3,button0@).
    
    function button1 
    {
      if cursorPosition < currentPageList:LENGTH - 1 
      {
      set cursorPosition to cursorPosition + 1.
      }
    }
    buttons:setdelegate(-4,button1@).
    
    function button2 
    {
      if currentPage < maxPages - 1 
      {
      SET currentPage to currentPage + 1.
      SET cursorPosition to 0.
      }
    }
    buttons:setdelegate(-6,button2@).

    function button3 
    {
      if currentPage > 0 
      {
      SET currentPage to currentPage - 1.
      SET cursorPosition to 0.
      }
    }
    buttons:setdelegate(-5,button3@).

    function button4 
    {
      select().
    }
    buttons:setdelegate(-1,button4@).

    function button5 
    {
    }
    buttons:setdelegate(5,button5@).

    function button7 
    {
      set actiontype to 1.
      print "MODE: Deploy      " at (0,16).
    }
    buttons:setdelegate(7,button7@).
    
    function button8 
    {
      set actiontype to 2.
      print "MODE: Reset     " at (0,16).
    }
    buttons:setdelegate(8,button8@).
    
    function button9 
    {
      set actiontype to 3.
      print "MODE: Transmit   " at (0,16).
    }
    buttons:setdelegate(9,button9@).
    
    function button10 
    {
      set actiontype to 4.
      print "MODE: Dump data   " at (0,16).
    }
    buttons:setdelegate(10,button10@).
    
    function button11 
    {
      set actiontype to 5.
      print "MODE: Data Info    " at (0,16).
    }
    buttons:setdelegate(11,button11@).
    
    function button12 
    {
      set actiontype to 6.
      print "MODE: Toggle      " at (0,16).
    }
    buttons:setdelegate(12,button12@).
    
    function button13 
    {
      SET isDone to 1.
      clearscreen.
    }
    buttons:setdelegate(13,button13@).
    
    UNTIL isDone > 0 
    {

      LOCAL position is 1.
      set maxPages to CEILING(sensorlist:LENGTH / totalItems).
      SET currentPageList to sensorlist:SUBLIST(currentPage * totalItems, totalItems).
      SET itersensorList to currentPageList:ITERATOR.
      set realPage to currentPage + 1.
      set p to sensorlist[currentPage * totalItems + cursorPosition].
      print "MODE:" at (0,16).
  
      if p:hasmodule("ModuleScienceExperiment")
      {
        SET M TO P:GETMODULE("ModuleScienceExperiment").
      }
      
      if p:hasmodule("DMModuleScienceAnimate")
      {
        SET M TO P:GETMODULE("DMModuleScienceAnimate").
      }

      PRINT "|  DEPLOY  |  RESET   | TRANSMIT | DUMPDATA | LISTDATA |  TOGGLE  |   EXIT   |" at (0,20).
      PRINT "PAGE " + realPage + " OF " + maxPages + "     BAKER SENSOR CONTROL v2.0" AT (1,0).
      PRINT "--------------------------------------------------------------------------------" AT (0,13).
      PRINT "Sensor: " AT (0,14).
      
      UNTIL NOT itersensorList:NEXT 
      {
        if cursorPosition = itersensorList:INDEX 
        {
          PRINT ">" AT (0,position).
        } 
        else 
        {
          PRINT " " AT (0,position).
        }
        
        SET strcurrentPageList to currentPageList[position - 1]:title.// + " " + "(" + currentPageList[position - 1]:BODY:NAME + ")".
        PRINT strcurrentPageList:PADRIGHT(20) + "           " AT (2,position).
        PRINT sensorlist[cursorPosition]:name + "                                 " AT (7,14).

        if m:hasdata
        {    
          print "Sensor Data: Yes            " at (0,15).
        }
        else
        {
          print "Sensor Data: No              " at (0,15).
        }

        set position to position + 1.

        if RealPage = maxPages 
        {
          set cleanLocation to currentPageList:LENGTH + 1.
          set cleanDisplayTotal to totalItems - currentPageList:LENGTH.
          set cleanDisplayCounter to 0.
          UNTIL cleanDisplayCounter = cleanDisplayTotal 
          {
          PRINT "                                        " AT (0,cleanLocation).
          set cleanLocation to cleanLocation + 1.
          set cleanDisplayCounter to cleanDisplayCounter + 1.
          }
        }
      }
      wait 0.001.
    }
    CLEARSCREEN.
    }
    sensorcontrolmain().
  }    
  sensorcontrol().
  bakeros().
}

function shipsystems
{
    
  function printscreenall
  {
    printscreen().
  }

  function printscreen
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Ship Systems                     |           |".
    print "|          |   ---Select Operation---                              |           |".
    print "|          |                                                       |           |".
    print "|          |     1. Toggle Radiators 2. Extend Ladders             |           |".
    print "|          |     3. Toggle Bays      4. Deploy/Retract Drills      |           |".
    print "|          |     5. Toggle Drills    6. Toggle ISRU                |           |".
    print "|          |     7. Toggle Intakes   8. Toggle Fuelcells           |           |".
    print "|          |     9. Toggle Legs      10. Toggle Solar Panels       |           |".
    print "|          |     11. Exit                                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".

    print selss at (45,7).

  }

  function printscreen2
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 1                           |           |".
    print "|          |   ---Select Operation---                              |           |".
    print "|          |                                        " + selss + "             |           |".
    print "|          |     10. A.A.             11. Ascent                   |           |".
    print "|          |     12. Cyclecam         13. Editnode                 |           |".
    print "|          |     14. Eject            15. Execnode                 |           |".
    print "|          |     16. Hover            17. Help File                |           |".
    print "|          |     18. Patch Info       19. Remote Rover             |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".

  }

  function printscreen3
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 2                           |           |".
    print "|          |   ---Select Operation---                              |           |".
    print "|          |                                        " + selss + "             |           |".
    print "|          |     20. Remote Station   21. Servo                    |           |".
    print "|          |     22. Set Limit        23. Set Node                 |           |".
    print "|          |     24. Set Target       25. SMS                      |           |".
    print "|          |     26. Undock           27. VTOL                     |           |".
    print "|          |     28. Warp to          29. Xfer Fuel                |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".

  }

  set isdone to 0.
  function shipsystemsgui
  {
    set selss to 1.
    clearscreen.
    printscreen().
    
    function button0 
    {
      
      set selss to selss - 1.
      printscreenall().
      
      if selss < 1
      {
        set selss to 1.
      }
    }
    buttons:setdelegate(-4,button0@).
    
    function button1 
    {
      set selss to selss + 1.
      
      if selss > 11
      {
        
        {
          set selss to 1.
        }
      }
      printscreenall().
    }
    buttons:setdelegate(-3,button1@).

    function button2
    {
    }
    buttons:setdelegate(-6,button2@).

    function button3
    {
    }
    buttons:setdelegate(-5,button3@).

    function button4 
    {
      V0:PLAY(NOTE(440,0.5)).
      set answer to selss.
      shipsystemsanswer().
    }
    buttons:setdelegate(-1,button4@).

    function button5 
    {
    }
    buttons:setdelegate(5,button5@).
    
    function button7 
    {
    }
    buttons:setdelegate(7,button7@).
    
    function button8 
    {
    }
    buttons:setdelegate(8,button8@).
    
    function button16 
    {
    }
    buttons:setdelegate(13,button16@).

    function button13 
    {
    }
    buttons:setdelegate(13,button13@).

    printscreenall().

    until isdone > 0
    {
      set ch to terminal:input:getchar().

      if ch = terminal:input:DOWNCURSORONE 
      {
        //V0:PLAY(NOTE(440,0.5)).
        set selss to selss - 1.
        if selss < 2
          {
          set sel to 1.
          }
          when selss < 2 then
          {
          set selss to 1.
          }

        set ch to "".
        printscreenall().
          
      }

      if ch = terminal:input:UPCURSORONE 
      {
        //V0:PLAY(NOTE(440,0.5)).
        set selss to (selss + 1).
          if selss > 11
          {
          set selss to 1.
          }
          when selss > 11 then
          {
          set selss to 1.
          }

        set ch to "".
        printscreenall().
      }

      if ch = terminal:input:enter
      {
        V0:PLAY(NOTE(440,0.5)).
        set answer to selss.
        set ch to "".
        shipsystemsanswer().
      }

      if ch = terminal:input:RIGHTCURSORONE 
      {
      }

      if ch = terminal:input:LEFTCURSORONE 
      {
      }
    }
  }

  function shipsystemsanswer
  {
    if answer = 1
    {
      if radiators = true
      {
        radiators off.
        wait 1.
        print "Radiators: " + radiators + "     " at (40,16).
      }
      else
      {
        radiators on.
        wait 1.
        print "Radiators: " + radiators + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 2
    {
      if ladders = true
      {
        ladders off.
        wait 1.
        print "Ladders: " + ladders + "     " at (40,16).
      }
      else
      {
        ladders on.
        wait 1.
        print "Ladders: " + ladders + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 3
    {
      if bays = true
      {
        bays off.
        wait 1.
        print "Bays: " + bays + "     " at (40,16).
      }
      else
      {
        bays on.
        wait 1.
        print "Bays: " + bays + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 5
    {
      if DeployDrills = true
      {
        Deploydrills off.
        wait 1.
        print "DeployDrills: " + deploydrills + "     " at (40,16).
      }
      else
      {
        Deploydrills on.
        wait 1.
        print "DeployDrills: " + deploydrills + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 4
    {
      if drills = true
      {
        drills off.
        wait 1.
        print "Drills: " + drills + "     " at (40,16).
      }
      else
      {
        drills on.
        wait 1.
        print "Drills: " + drills + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 6
    {
      if isru = true
      {
        isru off.
        wait 1.
        print "ISRU: " + ISRU + "     " at (40,16).
      }
      else
      {
        isru on.
        wait 1.
        print "ISRU: " + ISRU + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 7
    {
      if intakes = true
      {
        intakes off.
        wait 1.
        print "Intakes: " + intakes + "     " at (40,16).
      }
      else
      {
        intakes on.
        wait 1.
        print "Intakes: " + intakes + "     " at (40,16).
      }
      wait 1.
    }

    if answer = 8
    {
      if fuelcells = true
      {
        fuelcells off.
        wait 1.
        print "Fuelcells: " + drills + "     " at (40,16).
      }
      else
      {
        fuelcells on.
        wait 1.
        print "Fuelcells: " + drills + "     " at (40,16).
      }
      wait 1.

    }

    if answer = 9
    {
    
    }

    if answer = 10
    {
      
      if panels = true
      {
      panels off.
      wait 1.
      print "Solar Panels: " + panels + "     " at (40,16).
      }
      else
      {
      panels on.
      wait 1.
      print "Solar Panels: " + panels + "     " at (40,16).
      }
      
    
    }

    if answer = 11
    {
      print "Exiting..." at (20,16).
      set sel to 50.
      wait 1.
      set isdone to 1.
      bakeros().
    }

    if answer = 12
    {
      
    }   
    
    if answer = 13
    {
      
    }

    if answer = 14
    {
      
    }

    if answer = 15
    {
      
    }

    if answer = 16
    {
      
    }

    if answer = 17
    {
      
    }

    if answer = 18
    {
      
    }

    if answer = 19
    {
      
    }

    if answer = 20
    {
      
    }

    if answer = 21
    {
      
    }

    if answer = 22
    {
      
    }

    if answer = 23
    {
      
    }

    if answer = 24
    {
      
    }

    if answer = 25
    {
      
    }

    if answer = 26
    {
      
    }

    if answer = 27
    {
      
    }

    if answer = 28
    {
      
    }

    if answer = 29
    {
      
    }

    if answer = 30
    {
      
    }

  }

  shipsystemsgui().
  shipsystemsanswer().
  bakeros().

}

function bakertransfer
{
    function xferfuelmain{

    SET isDone to 0.
    CLEARSCREEN.
    
    function button0 {
      PRINT "<----" AT (37,17).
      set selSide to 1.
      set selResource to 0.
      PRINT elist[1]:resources[selResource]:name:padleft(40) AT (40,16).
    }
    buttons:setdelegate(-6,button0@).
    
    function button1 {
      PRINT "---->" AT (37,17).
      set selSide to 0.
      set selResource to 0.
      PRINT elist[0]:resources[selResource]:name:padleft(40) AT (40,16).
    }
    buttons:setdelegate(-5,button1@).
    
    function button2 {
      if selSide = 0 {
        if selResource > 0 {
          set selResource to selResource - 1.
          PRINT elist[0]:resources[selResource]:name:padright(40) AT (20,16).
        }
      } else {
        if selResource > 0 {
          set selResource to selResource - 1.
          PRINT elist[1]:resources[selResource]:name:padright(40) AT (20,16).
        }
      }
    }
    buttons:setdelegate(-3,button2@).

    function button3 {
      if selSide = 0 {
        if selResource < countResourcesLeft - 1 {
          set selResource to selResource + 1.
          PRINT elist[0]:resources[selResource]:name:padright(40) AT (20,16).
        }
      } else {
        if selResource < countResourcesRight - 1 {
          set selResource to selResource + 1.
          PRINT elist[1]:resources[selResource]:name:padright(40) AT (20,16).
        }
      }
    }
    buttons:setdelegate(-4,button3@).

    function button4 {
      if selSide = 0 {
        SET xfer TO TRANSFER(elist[0]:resources[selResource]:name, elist[0], elist[1], amount).
        SET xfer:ACTIVE to TRUE.
      } else {
        SET xfer TO TRANSFER(elist[1]:resources[selResource]:name, elist[1], elist[0], amount).
        SET xfer:ACTIVE to TRUE.
      }
    }
    buttons:setdelegate(-1,button4@).

    function button5 {
    }
    buttons:setdelegate(5,button5@).

    function button7 {
      SET amount TO amount * 10.
      SET strAmount to "" + amount.
      PRINT strAmount:padright(40) AT (20,15).
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
      SET amount TO amount * 0.1.
      SET strAmount to "" + amount.
      PRINT strAmount:padright(40) AT (20,15).
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
    }
    buttons:setdelegate(9,button9@).
    
    function button10 {
    }
    buttons:setdelegate(10,button10@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).
    
    function button12 {
    }
    buttons:setdelegate(12,button12@).
    
    function button13 {
      SET isDone to 1.
      clearscreen.
    }
    buttons:setdelegate(13,button13@).
    
    LIST ELEMENTS IN elist.
    set selResource to 0.
    PRINT elist[0]:resources[selResource]:name:padleft(40) AT (40,16).
    set selSide to 0.
    PRINT "---->" AT (37,17).
    set amount to 1.
    set strAmount to "" + amount.
    PRINT strAmount:padleft(40) AT (40,15).
    set verticalLine to 0.
    UNTIL verticalLine > 13 {
      PRINT "|" AT (39,verticalLine + 1).
      set verticalLine to verticalLine + 1.
    }
    
    UNTIL isDone > 0 
    {
      
      LIST ELEMENTS IN elist.
      if elist:length < 2 
      {
        clearscreen.
        print "No docked vessel found, exiting".
        return.
      } 
      else 
      {
      
        if elist[0]:name:length > 39 
        {
          PRINT elist[0]:name:remove(39,elist[0]:name:length-39) AT (0,1).
        } 
        else 
        {
          PRINT elist[0]:name AT (0,1).
        }

        set countResourcesLeft to elist[0]:resources:length.
        set countResourcesRight to elist[1]:resources:length.
        set numResourcesLeft to elist[0]:resources:ITERATOR.
        set position to 2.

        UNTIL NOT numResourcesLeft:next 
        {
          if selResource = numResourcesLeft:index and selSide = 0 
          {
            set strResourceAmount to ">" + round(elist[0]:resources[numResourcesLeft:index]:amount,1) + " " + elist[0]:resources[numResourcesLeft:index]:name + "  ".
            PRINT strResourceAmount AT (0,position).
          } 
          else 
          {
            set strResourceAmount to " " + round(elist[0]:resources[numResourcesLeft:index]:amount,1) + " " + elist[0]:resources[numResourcesLeft:index]:name + "  ".
            PRINT strResourceAmount AT (0,position).
          }

          set position to position + 1.
        }
        
        if elist[1]:name:length > 39 {
          PRINT elist[1]:name:remove(39,elist[1]:name:length-39):padleft(40) AT (40,1).
        } else {
          PRINT elist[1]:name:padleft(40) AT (40,1).
        }
        set numResourcesRight to elist[1]:resources:ITERATOR.
        set position to 2.
        UNTIL NOT numResourcesRight:next {
          if selResource = numResourcesRight:index  and selSide = 1 {
            set strResourceAmount to ">" + round(elist[1]:resources[numResourcesRight:index]:amount,1) + " " + elist[1]:resources[numResourcesRight:index]:name.
            PRINT strResourceAmount:padleft(40) AT (40,position).
          } else {
            set strResourceAmount to " " + round(elist[1]:resources[numResourcesRight:index]:amount,1) + " " + elist[1]:resources[numResourcesRight:index]:name.
            PRINT strResourceAmount:padleft(40) AT (40,position).
          }
          set position to position + 1.
        }
        PRINT "|AMOUNT+   |AMOUNT-   |          |          |          |          |EXIT      |" at (0,18).
        PRINT "AMOUNT TO TRANSFER:" AT (0,15).
        PRINT "SELECTED RESOURCE:" AT (0,16).
        PRINT "DIRECTION OF TRANSFER:" AT (0,17).
      }
    wait 0.001.
    }
  CLEARSCREEN.
  }
  xferfuelmain().
  bakeros().
}  

function bakercircleap
{

	rcs on.
  sas off.
	clearscreen.
	set running to true.
  set isdone to 0.

  function circleatapgui
  {
    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |               Circularize at Apoapsis                 |           |".
    print "|          |   Running Program...                                  |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function circletoapdef
  {
    
    lock steering to prograde.
    set TargetV to ((body:mu)/(body:radius+apoapsis))^0.5.
    set ApoapsisV to (2*body:mu*((1/(body:radius+apoapsis))-(1/orbit:semimajoraxis/2)))^0.5.
    set BurnDeltaV to TargetV-ApoapsisV.
    set BurnTime to (BurnDeltaV*mass)/availablethrust.
    set BurnMoment to time:seconds + eta:apoapsis.
    rcs on.
    sas off.
    set circlestart to 1.

  }

  circletoapdef().
  circleatapgui().

  print " Burntime: "+round(burntime)+"s                 " at (13,11).
  Print " Burn DeltaV: "+burndeltav+"               " at (13,12).
  print " Apoapsis: "+round(apoapsis)+" m            " at (13,8).
  print " Periapsis: "+round(periapsis)+" m                 " at (13,9).

  When time:seconds > BurnMoment-(BurnTime/2) then
  {

    if vang(ship:facing:forevector,steering:forevector) <  20 and circlestart = 1
    {
      
      unlock throttle.
      set ship:control:fore to 0.7.
      wait 2.
      set throttle to 1.
      print "Circularization burn started..." at (13,6).
      set ship:control:fore to 0.
      rcs off.
      wait 2.
      set circlestart to 2.
      
    }
    preserve.
  }

    // When vang(ship:facing:forevector,steering:forevector) <  20 and circlestart = 1 then
    // {

    //   if time:seconds > BurnMoment-(BurnTime/2) 
    //   {
        
    //     unlock throttle.
    //     set ship:control:fore to 0.7.
    //     wait 2.
    //     set throttle to 1.
    //     print "Circularization burn started..." at (13,6).
    //     set ship:control:fore to 0.
    //     rcs off.
    //     wait 2.
    //     set circlestart to 2.
        
    //   }
    //   preserve.
    // }

  when TargetV < ship:velocity:orbit:mag and circlestart = 2 then
  {

    if time:seconds > BurnMoment+BurnTime - 10 and circlestart = 2.
    {
      set throttle to 0.
      rcs off.
      print "Circularization burn completed..." at (13,6).
      unlock steering.
      unlock throttle.
      sas on.
      wait 5.
      set isdone to 1.
      set running to false.
      set circlestart to 3.
    }
    preserve.
  }

  until isdone > 0
  {

    if running = true
    {
      print " Time to apoapsis: "+round(eta:apoapsis)+"s             " at (13,10).
      print " Burntime: "+round(burntime)+"s                 " at (13,11).
      Print " Burn DeltaV: "+burndeltav+"               " at (13,12).
      print " Apoapsis: "+round(apoapsis)+" m            " at (13,8).
      print " Periapsis: "+round(periapsis)+" m                 " at (13,9).
      print " Burn Moment: " + burnmoment at (13,8).
      //wait 1.
      //preserve.
    }

    //wait 0.

      //  when ship:altitude < targetapkm then
      //   {
      //       FOR engines IN MyList 
      //       {
      //           IF ENGines:FLAMEOUT and nos > 0
      //           {
      //               set nos to nos - 1.
      //               print "Flameout stage.".
      //               print "Stages left - " + nos.
      //               stage.
      //               wait 1.
      //           }
      //       }
      //   }
        
  }

  clearscreen.
  bakeros().
}	
	
function bakercirclepe
{
	rcs on.
  sas off.
	clearscreen.
	set running to true.
  set isdone to 0.

  function circleatpegui
  {
    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |               Circularize at Periapsis                |           |".
    print "|          |   Running Program...                                  |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |                                                       |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function circletopedef
  {
    lock steering to retrograde.
    set TargetV to ((body:mu)/(body:radius+periapsis))^0.5.
    set periapsisV to (2*body:mu*((1/(body:radius+periapsis))-(1/orbit:semimajoraxis/2)))^0.5.
    set BurnDeltaV to abs(TargetV-periapsisV).
    set BurnTime to abs(BurnDeltaV*mass)/availablethrust.
    set BurnMoment to time:seconds + eta:periapsis.
    set shipperi to ship:periapsis.
    rcs on.
    sas off.
    set circlestart to 1.

  }

  circletopedef().
  circleatpegui().
  
  until isdone > 0
  {

    when running = true then 
    {
      print " Apoapsis: "+round(apoapsis)+" m            " at (13,8).
      print " Periapsis: "+round(periapsis)+" m                 " at (13,9).
      print " Time to Periapsis: "+round(eta:periapsis)+"s             " at (13,10).
      print " Burntime: "+round(burntime)+"s                 " at (13,11).
      Print " Burn DeltaV: "+burndeltav+"               " at (13,12).
      preserve.
    }

    wait 0.

      //  when ship:altitude < targetapkm then
      //   {
      //       FOR engines IN MyList 
      //       {
      //           IF ENGines:FLAMEOUT and nos > 0
      //           {
      //               set nos to nos - 1.
      //               print "Flameout stage.".
      //               print "Stages left - " + nos.
      //               stage.
      //               wait 1.
      //           }
      //       }
      //   }
        
      when vang(ship:facing:forevector,steering:forevector) <  20 and circlestart = 1 then
      {
        if time:seconds > BurnMoment-(BurnTime/2) and circlestart = 1 
        {
          unlock throttle.
          set ship:control:fore to 0.7.
          wait 2.
          set circlestart to 2.
         
          set throttle to 1.
          set ship:control:fore to 0.
          print "Circularization burn started..." at (13,6).
          rcs off.
          wait 2.
        }
      }

    //when shipperi > ship:periapsis + 20 then

    when TargetV > ship:velocity:orbit:mag and circlestart = 2 then
    {
      if time:seconds > BurnMoment+(BurnTime/2) and circlestart = 2.
      {
        set circlestart to 3.
        set throttle to 0.
        rcs off.
        print "Circularization burn completed..." at (13,6).
        unlock steering.
        unlock throttle.
        sas on.
        set isdone to 1.
        set running to false.
        wait 2.
      }
    }
  }
  //wait 5.
  //clearscreen.
  bakeros().
}	
	
function bakercam 
{
  CLEARSCREEN.
  SET isDone to 0.

  function button0 
  {
  	if selectedCameraModule < cameraModules:length - 1 
    {
  		set selectedCameraModule to selectedCameraModule + 1.
  	}
  }

  buttons:setdelegate(-4,button0@).
  
  function button1 
  {
  	if selectedCameraModule > 0 
    {
      set selectedCameraModule to selectedCameraModule - 1.
    }
  }

  buttons:setdelegate(-3,button1@).
  
  function button7 
  {
  	cameraModules[selectedCameraModule]:doevent("id +").
  }

  buttons:setdelegate(7,button7@).
  
  function button8 
  {
  	cameraModules[selectedCameraModule]:doevent("id -").
  }

  buttons:setdelegate(8,button8@).
  
  function button16 
  {
    SET isDone to 1.
  }

  buttons:setdelegate(13,button16@).
  
  local cameraModules to list().
  local partList to ship:parts.
  for thePart in partList{
		local moduleList to thePart:modules.
		from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
			local theModule is moduleList[i].
			if (theModule = "JSIExternalCameraSelector") 
      {
				cameraModules:add(thePart:getModuleByIndex(i)).
			}                      
		}
	}
	
	local ch to "".
	local selectedcameraModule to 0.
	PRINT "          |          |  VULCAN CAMERA ROTATION  v2.0  |          |XXXXXXXXXX|" at (0,0).
	PRINT "WARNING: Flight and/or Landing camera MUST BE ExtCam1" at (0,17).
	PRINT "|id+       |id-       |          |          |          |          |EXIT      |" at (0,18).
	
  until isDone > 0 
  {
   	if cameraModules:length = 0 
    {
    	set isDone to 1.
    	clearscreen.
    	print "NO CAMERAS FOUND, EXITING".
    	return.
  	}

   	local iterCameraModules to cameraModules:ITERATOR.
	  local position to 1.

	  UNTIL NOT iterCameraModules:next 
    {
      if selectedCameraModule = iterCameraModules:index 
      {
        set selectorarrow to ">".
      } 
      else 
      {
        set selectorarrow to " ".
      }

      PRINT selectorarrow + cameraModules[iterCameraModules:index]:part:title + " (" + cameraModules[iterCameraModules:index]:part:tag + ")" + " " + cameraModules[iterCameraModules:index]:getfield("camera id: ") + "   " AT (1,position).
      set position to position + 1.
    }

    if terminal:input:haschar 
    {
      set ch to terminal:input:getchar().
    }

    if ch = "6" 
    {
    	set ch to "".
    }

    if ch = "4" 
    {
    	set ch to "".
    }

    if ch = "8" 
    {
    	set ch to "".
    }

    if ch = "2" 
    {
    	set ch to "".
    }

    if ch = "7" 
    {
    	set ch to "".
    }

    if ch = "1" 
    {
    	set ch to "".
    }

    if ch = "9" 
    {
    	set ch to "".
    }

    if ch = "3" 
    {
    	set ch to "".
    }

    if ch = "5" 
    {
    	set ch to "".
    }

    if ch = "+" 
    {
    	set ch to "".
    }

    if ch = "-" 
    {
    	set ch to "".
    }

    wait 0.001.
  }
  
  clearscreen.
  bakeros().
}

function bakertarget
{
    function settargetmain 
    {

    CLEARSCREEN.
    set cursorPosition to 0.
    set currentPage to 0.
    LOCAL totalItems is 12.
    SET isDone to 0.
    
    function selectTarget{
        SET target to targetList[currentPage * totalItems + cursorPosition].
    }
    
    function button0 {
        if cursorPosition > 0 {
        set cursorPosition to cursorPosition - 1.
        }
    }
    buttons:setdelegate(-3,button0@).
    
    function button1 {
        if cursorPosition < currentPageList:LENGTH - 1 {
        set cursorPosition to cursorPosition + 1.
        }
    }
    buttons:setdelegate(-4,button1@).
    
    function button2 {
        if currentPage < maxPages - 1 {
        SET currentPage to currentPage + 1.
        SET cursorPosition to 0.
        }
    }
    buttons:setdelegate(-6,button2@).

    function button3 {
        if currentPage > 0 {
        SET currentPage to currentPage - 1.
        SET cursorPosition to 0.
        }
    }
    buttons:setdelegate(-5,button3@).

    function button4 {
        selectTarget().
    }
    buttons:setdelegate(-1,button4@).

    function button5 {
    }
    buttons:setdelegate(5,button5@).

    function button7 {
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
    }
    buttons:setdelegate(9,button9@).
    
    function button10 {
    }
    buttons:setdelegate(10,button10@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).
    
    function button12 {
    }
    buttons:setdelegate(12,button12@).
    
    function button13 
    {
        SET isDone to 1.
        clearscreen.
    }
    buttons:setdelegate(13,button13@).
    
    UNTIL isDone > 0 
    {
      LOCAL position is 1.
      LIST targets in targetList.
      set maxPages to CEILING(targetList:LENGTH / totalItems).
      SET currentPageList to targetList:SUBLIST(currentPage * totalItems, totalItems).
      SET iterTargetList to currentPageList:ITERATOR.
      set realPage to currentPage + 1.
      
      PRINT "|          |          |          |          |          |          |EXIT      |" at (0,20).
      PRINT "PAGE " + realPage + " OF " + maxPages + "     TARGET SELECTION v2.0"AT (1,0).
      PRINT "--------------------------------------------------------------------------------" AT (0,13).
      PRINT "DIST: " AT (0,14).
      
      UNTIL NOT iterTargetList:NEXT 
      {
        if cursorPosition = iterTargetList:INDEX 
        {
          PRINT ">" AT (0,position).
        } 
        else 
        {
          PRINT " " AT (0,position).
        }

        if hastarget 
        {
          if target = currentPageList[iterTargetList:INDEX] 
          {
          PRINT ">" AT (1,position).
          } 
          else 
          {
          PRINT " " AT (1,position).
          }
        }

        SET strcurrentPageList to currentPageList[position - 1]:NAME + " " + "(" + currentPageList[position - 1]:BODY:NAME + ")".
        PRINT strcurrentPageList:PADRIGHT(20) AT (2,position).
        PRINT targetList[cursorPosition]:DISTANCE AT (7,14).
        set position to position + 1.
        if RealPage = maxPages 
        {
          set cleanLocation to currentPageList:LENGTH + 1.
          set cleanDisplayTotal to totalItems - currentPageList:LENGTH.
          set cleanDisplayCounter to 0.
          UNTIL cleanDisplayCounter = cleanDisplayTotal 
          {
          PRINT "                                        " AT (0,cleanLocation).
          set cleanLocation to cleanLocation + 1.
          set cleanDisplayCounter to cleanDisplayCounter + 1.
          }
        }
      }
      wait 0.001.
    }

    CLEARSCREEN.
    }
    settargetmain().
    
    bakeros().
}    

function bakertimewarp
{
    //Initialize local variables
  DECLARE PARAMETER secondPar is 0, minutePar is 0, hourPar is 0, dayPar is 0, yearPar is 0.
  local helpText to "     -Press Numpad up/down or up/down buttons to change selected time, numpad left/right or buttons to select time unit, numpad 5 or ENTER button creates new node at selected time, AN/DN sets time to next ascending/descending node, AP/PE toggles between setting time to next apoapsis or periapsis, RESET sets time to 0-     ".
  local stringStep to 0.
  local stringMin to 0.
  local stringMax to 0.
  local stringTime to 0.
  local scrollTime to 0.2.
  local toggleHelp to 0.
  local isDone to 0.
  local finalTime is 0.
  local currSel to 0.
  local ch to "".
  local finalTime to 0.
  local aPpEToggle to 0.
  local informationTimer to 0.
  local hpd to 0.
  local s to 0.
  local m to 0.
  local h to 0.
  local d to 0.
  local strCal to "".
  local minusSecs to 120.
  //Function to scroll help text
  function textScroller {
    local stringSize to helpText:length.
    local adjustedString to helpText:substring(0 + stringStep,78).
    print adjustedString AT (1,17).
    if stringStep + 78 = stringSize {
      set scrollTime to 3.
      set stringStep to 0.
    } else {
      set scrollTime to 0.2.
      set stringStep to stringStep + 1.
    }
    set stringTime TO TIME:SECONDS.
  }
  //Function to convert time units to seconds
  function toSeconds {
    PARAMETER seconds.
    PARAMETER minutes.
    PARAMETER hours.
    PARAMETER days.
    PARAMETER years.
    LOCAL minuteToSeconds is minutes*60.
    LOCAL hourToSeconds is hours*3600.
    LOCAL dayToSeconds is days*21600.
    LOCAL yearToSeconds is years*7884000.
    LOCAL totalTime is yearToSeconds+dayToSeconds+hourToSeconds+minuteToSeconds+seconds.
    return totalTime.
  }
  //Function to calculate ETA to AN/DN
  function anDn {
    if not (ship:status = "ORBITING") or (ship:status = "ESCAPING") {
      return.
    }
    if not hastarget {
      return.
    }
    local shipV is ship:obt:velocity:orbit.
    local tarV is target:obt:velocity:orbit.
    local shipN is vcrs(shipV,ship:position - body:position).
    local tarN is vcrs(tarV,target:position - body:position).
    if target:name = body:name { set tarN to body:angularvel. }
    set intersectV to vcrs(shipN,tarN).
    local shipVec is ship:position - body:position.
    local done is false.
    local time_mod is 100.
    local increment is 100.
    local last_angl is vang(shipVec,intersectV).
    until done {
      set shipVec to positionat(ship, time:seconds + time_mod) - body:position.
      set angl to vang(shipVec,intersectV).
      set spd to (last_angl-angl)/increment.
      if increment = 1 or angl < 0.05 and angl > last_angl {
        set done to true.
        set time_mod to time_mod - increment.
      } else {
        set increment to max(min(angl/(spd*1.1),50000),1).
        set last_angl to angl.
        set time_mod to time_mod + increment.
      }
    }
    return time_mod.
  }
  //Function to calculate ETA to AP/PE
  function apPe {
    local apoapsisETA is 0.
    local periapsisETA is 0.
    local apPETime is 0.
    local break1 is 0.
    local break2 is 0.
    if eta:apoapsis {
      set apoapsisETA to eta:apoapsis.
      set break1 to 1.
    }
    if eta:periapsis {
      set periapsisETA to eta:periapsis.
      set break2 to 1.
    }
    if break1 = 0 and break2 = 0 {
      return 0.
    }
    if aPpEToggle = 0 {
      set apPETime to periapsisETA.
      print "-SET TO PERIAPSIS-" AT (30,16).
      set informationTimer to time:seconds.
    } else {
      set apPETime to apoapsisETA.
      print "-SET TO APOAPSIS-" AT (30,16).
      set informationTimer to time:seconds.
    }
    return apPETime.
  }
  //Main loop
  function warptomain {
    CLEARSCREEN.
    //Button 0
    function button0 {
      if toggleHelp = 0 {
        set toggleHelp to 1.
      } else {
        set toggleHelp to 0.
        print " ":padright(79) AT (0,17).
      }
    }
    buttons:setdelegate(0,button0@).
    //Button 1
    function button1 {
      if minusSecs > 0 {
        set minusSecs to minusSecs - 5.
      }
    }
    buttons:setdelegate(1,button1@).
    //Button 2
    function button2 {
      set minusSecs to minusSecs + 5.
    }
    buttons:setdelegate(2,button2@).
    //Button 7
    function button7 {
      if aPpEToggle = 0 {
        set aPpEToggle to 1.
      } else {
        set aPpEToggle to 0.
      }
      set finalTime to apPe().
    }
    buttons:setdelegate(7,button7@).
    //Button 8
    function button8 {
      set finalTime to anDn().
    }
    buttons:setdelegate(8,button8@).
    //Button 9
    function button9 {
      set finalTime to 0.
    }
    buttons:setdelegate(9,button9@).
    //Button 10
    function button10 {
      if hasnode {
        set finalTime to nextnode:eta.
      }
    }
    buttons:setdelegate(10,button10@).
    //Button 11
    function button11 {
      if ship:sensors:light > 0 {
        set kuniverse:timewarp:warp to 4.
        until ship:sensors:light = 0 {
          
        }
      set kuniverse:timewarp:warp to 0.
      } else {
        set kuniverse:timewarp:warp to 4.
        until ship:sensors:light > 0 {
          
        }
      set kuniverse:timewarp:warp to 0.
      }
    }
    buttons:setdelegate(11,button11@).  
    //Button 12
    function button12 {

    }
    buttons:setdelegate(12,button12@).
    //Button 13
    function button13 {
      SET isDone to 1.
    }
    buttons:setdelegate(13,button13@).
    //UP Button
    function button14 {
      if currSel = 1 {
        set finalTime to finalTime + 21600.
      }
      if currSel = 2 {
        set finalTime to finalTime + 3600.
      }
      if currSel = 3 {
        set finalTime to finalTime + 60.
      }
      if currSel = 4 {
        set finalTime to finalTime + 1.
      }
    }
    buttons:setdelegate(-3,button14@).
    //DOWN Button
    function button15 {
      if currSel = 1 {
        set finalTime to finalTime - 21600.
      }
      if currSel = 2 {
        set finalTime to finalTime - 3600.
      }
      if currSel = 3 {
        set finalTime to finalTime - 60.
      }
      if currSel = 4 {
        set finalTime to finalTime - 1.
      }
    }
    buttons:setdelegate(-4,button15@).
    //LEFT Button
    function button16 {
      if currSel > 0 {
        SET currSel to currSel - 1.
      }
    }
    buttons:setdelegate(-5,button16@).
    //RIGHT Button
    function button17 {
      if currSel < 4 {
        SET currSel to currSel + 1.
      }
    }
    buttons:setdelegate(-6,button17@).
    //ENTER Button
    function button18 {
      kuniverse:timewarp:warpto( TIME:SECONDS+finalTime-minusSecs ).
      set isDone to 1.
    }
    buttons:setdelegate(-1,button18@).
    //Initialize time from parameter
    set finalTime to toSeconds(secondPar,minutePar,hourPar,dayPar,yearPar).
    if finalTime > 0 {
      kuniverse:timewarp:warpto( TIME:SECONDS+finalTime-minusSecs ).
      clearscreen.
      return.
    }
    print finalTime at (10,1).
    //Sub loop
    until isDone > 0 {
      //Convert seconds to calndar time
      set hpd TO kuniverse:hoursperday.
      set s to floor(finalTime).
      set m to floor(s/60). set s to mod(s,60).
      set h to floor(m/60). set m to mod(m,60).
      set d to floor(h/hpd). set h to mod(h,hpd).
      //Print UI elements
      PRINT "HELP      |-5SECS    |+5SECS    |       VULCAN TIMEWARP CONTROL   v2.0      |" at (0,0).
      PRINT "|AP/PE     |AN/DN     |RESET     |NODE      |SUN UP/DWN|          |EXIT      |" at (0,20).
      PRINT "WARP TO:" at (0,1).
      local strFinalTime to "" + finalTime.
      PRINT strFinalTime:padright(20) at (10,1).
      PRINT "CALEND:" at (0,2).
      PRINT "SUBTRACTING " + minusSecs + "S    " at (0,3).
      PRINT "-WARP WILL NOT BEGIN IF IN KEYBOARD MODE-" at (15,15).
      //AP/PE information display
      if time:seconds - informationTimer > 2 {
        print " ":padright(40) AT (30,16).
      }
      //Print help text
      if toggleHelp = 1 {
        IF TIME:SECONDS - stringTime > scrollTime {
          textScroller().
        }
      }
      //Set color to current selection
      if currSel = 0 {
        set strCal to "" + + d + "d" + h + "h" + m + "m" + s + "s     ".
        PRINT strCal:padright(20) at (10,2).
      }
      if currSel = 1 {
        set strCal to "" + + d + "[#008000]d" + h + "h" + m + "m" + s + "s" + "      ".
        PRINT strCal:padright(20) at (10,2).
      }
      if currSel = 2 {
        set strCal to "[#008000]" + + d + "d[#00ff00]" + h + "[#008000]h" + m + "m" + s + "s    ".
        PRINT strCal:padright(20) at (10,2).
      }
      if currSel = 3 {
        set strCal to "[#008000]" + + d + "d" + h + "h[#00ff00]" + m + "[#008000]m" + s + "s     ".
        PRINT strCal:padright(20) at (10,2).
      }
      if currSel = 4 {
        set strCal to "[#008000]" + + d + "d" + h + "h" + m + "m[#00ff00]" + s + "[#008000]s    ".
        PRINT strCal:padright(20) at (10,2).
      }
      //Numpad listener
      if terminal:input:haschar {
        set ch to terminal:input:getchar().
      }
      if ch = "6" {
        button17().
        set ch to "".
      }
      if ch = "4" {
        button16().
        set ch to "".
      }
      if ch = "8" {
        button14().
        set ch to "".
      }
      if ch = "2" {
        button15().
        set ch to "".
      }
      if ch = "5" {
        button18().
        set ch to "".
      }
      wait 0.001.
    }
  clearscreen.
  }
  warptomain().
  bakeros().
}  
  
function bakernode
{
  if not HASNODE
  {
    clearscreen.
    bakersetnode().
    bakernode().
    //print "No node found, exiting".
  } 
  else 
  {
      //Setting and initializing local variables
      local pNL to LIST("None","None","None","None","None").
      local pPL to LIST(0,0,0,0,0).
      local pIL to LIST(0,0,0,0,0).
      local selectionList to LIST ("NODE","PROGRADE","RADIALOUT","NORMAL","ETA","UNITSIZE").
      local currPatch to 0.
      local currNode to 1.
      local currSelection to 0.
      local numPatches to 0.
      local numNodes to 0.
      local unitSize to 1.
      local patches to 0.
      local isDone to 0.
      local ch to "".
      local originalPrograde TO ALLNODES[currNode-1]:PROGRADE.
      local originalRadial TO ALLNODES[currNode-1]:RADIALOUT.
      local originalNormal TO ALLNODES[currNode-1]:NORMAL.
      local originalETA TO ALLNODES[currNode-1]:ETA.
      local hasRan to 0.
      local recordTime to 0.
      local hpd to 0.
      local s to 0.
      local m to 0.
      local h to 0.
      local d to 0.
      local helpText to "     -Press Numpad up/down or up/down buttons to move selection, numpad left/right or buttons to adjust value, numpad +/- to change unit sizes, numpad 5 or X button sets selected value to 0, OP+/- sets ETA to next or previous orbital period, RESET sets vectors back to their original values-     ".
      local stringStep to 0.
      local stringMin to 0.
      local stringMax to 0.
      local stringTime to 0.
      local scrollTime to 0.2.
      local toggleHelp to 0.
      ////////

      function orbit_normal 
      {
        parameter orbit_in.

        return VCRS(orbit_in:body:position - orbit_in:position,
                      orbit_in:velocity:orbit):normalized.
      }

      function swapYZ 
      {
        parameter vec_in.

        return V(vec_in:X, vec_in:Z, vec_in:Y).
      }

      function swapped_orbit_normal 
      {
        parameter orbit_in.

        return -swapYZ(orbit_normal(orbit_in)).
      }

      function relativeInc 
      {
        parameter orbiter_a, orbiter_b.

        return abs(vang(swapped_orbit_normal(orbiter_a), swapped_orbit_normal(orbiter_b))).
      }

      //Function to crawl through existing patches
      function countPatches
      {
        set patches to 0.
        if nextnode:orbit:hasnextpatch 
        {
          set patches to patches + 1.
          pNL:REMOVE(0).
          pNL:INSERT(0,nextnode:orbit:name).
          pPL:REMOVE(0).
          pPL:INSERT(0,nextnode:orbit:periapsis).
          pIL:REMOVE(0).
          pIL:INSERT(0,nextnode:orbit:inclination).
        } 
        else 
        {
          return patches.
        }

        if nextnode:orbit:nextpatch:hasnextpatch 
        {
          set patches to patches + 1.
          pNL:REMOVE(1).
          pNL:INSERT(1,nextnode:orbit:nextpatch:name).
          pPL:REMOVE(1).
          pPL:INSERT(1,nextnode:orbit:nextpatch:periapsis).
          pIL:REMOVE(1).
          pIL:INSERT(1,nextnode:orbit:nextpatch:inclination).
        } 
        else 
        {
          return patches.
        }

        if nextnode:orbit:nextpatch:nextpatch:hasnextpatch 
        {
          set patches to patches + 1.
          pNL:REMOVE(2).
          pNL:INSERT(2,nextnode:orbit:nextpatch:nextpatch:name).
          pPL:REMOVE(2).
          pPL:INSERT(2,nextnode:orbit:nextpatch:nextpatch:periapsis).
          pIL:REMOVE(2).
          pIL:INSERT(2,nextnode:orbit:nextpatch:nextpatch:inclination).
        } 
        else 
        {
          return patches.
        }

        if nextnode:orbit:nextpatch:nextpatch:nextpatch:hasnextpatch 
        {
          set patches to patches + 1.
          pNL:REMOVE(3).
          pNL:INSERT(3,nextnode:orbit:nextpatch:nextpatch:nextpatch:name).
          pPL:REMOVE(3).
          pPL:INSERT(3,nextnode:orbit:nextpatch:nextpatch:nextpatch:periapsis).
          pIL:REMOVE(3).
          pIL:INSERT(3,nextnode:orbit:nextpatch:nextpatch:nextpatch:inclination).
        } 
        else 
        {
          return patches.
        }

        if nextnode:orbit:nextpatch:nextpatch:nextpatch:nextpatch:hasnextpatch 
        {
          set patches to patches + 1.
          pNL:REMOVE(4).
          pNL:INSERT(4,nextnode:orbit:nextpatch:nextpatch:nextpatch:nextpatch:name).
          pPL:REMOVE(4).
          pPL:INSERT(4,nextnode:orbit:nextpatch:nextpatch:nextpatch:nextpatch:periapsis).
          pIL:REMOVE(4).
          pIL:INSERT(4,nextnode:orbit:nextpatch:nextpatch:nextpatch:nextpatch:inclination).
        } 
        else 
        {
          return patches.
        }
        return patches.
      }

      //Function to populate patch information display
      function checkPatches 
      {
        if numPatches = 0 
        {
          set currPatch to 0.
          print "None" + "         " AT (16,12).
          print "None":padright(19) AT (16,13).
          print "N/A":padright(19) AT (16,14).
          print "N/A":padright(19) AT (16,15).
        } 
        else 
        {
          print currPatch + 1 AT (16,12).
          print " OF " AT (17,12).
          print numPatches AT (21,12).
          print pNL[currPatch]:padright(19) AT (16,13).
          print round(pPL[currPatch],3) + "        " AT (16,14).
          print round(pIL[currPatch],3) + "      " AT (16,15).
        }
      }
      
      //Function to populate target display
      function checkTarget 
      {
        if hastarget 
        {
          local a1 to sin(nextnode:obt:inclination)*cos(nextnode:obt:LAN).
          local a2 to sin(nextnode:obt:inclination)*sin(nextnode:obt:LAN).
          local a3 to cos(nextnode:obt:inclination).

          local b1 to sin(target:obt:inclination)*cos(target:obt:LAN).
          local b2 to sin(target:obt:inclination)*sin(target:obt:LAN).
          local b3 to cos(target:obt:inclination).

          local angle to arccos(a1*b1+a2*b2+a3*b3).
          print "t.INC: " + target:orbit:inclination + "/" + round(relativeInc(ship, target), 3) + "/" + round(angle,3) + "  " AT (41,8).
          print "t.AP:  " + target:apoapsis + "   " AT (41,9).
          print "t.PE:  " + target:periapsis + "   " AT (41,10).
        } else 
        {
          print " ":padright(39) AT (41,9).
          print " ":padright(39) AT (41,10).
        }
      }

      //Function to check for an existing node
      function checkNode 
      {
        if not HASNODE
        {
          clearscreen.
          print "Node lost, exiting".
          return -1.
        }
      }

      //Function to clear out selection pips on UP/DOWN press
      function clearPips 
      {
        local i to selectionList:iterator.
        until not i:NEXT 
        {
          print " " AT (0,i:index + 1).
        }
      }

      //Function to print and convert ETA to calendar format
      function calculateETA 
      {
        set hpd TO kuniverse:hoursperday.
        set s to floor(ALLNODES[currNode-1]:ETA).
        set m to floor(s/60). set s to mod(s,60).
        set h to floor(m/60). set m to mod(m,60).
        set d to floor(h/hpd). set h to mod(h,hpd).
        local strCal to "" + + d + "d" + h + "h" + m + "m" + s + "s".
        print strCal:padright(20) at (15,5).
        set recordTime TO TIME:SECONDS.
      }

      //Function to scroll help text
      function textScroller 
      {
        local stringSize to helpText:length.
        local adjustedString to helpText:substring(0 + stringStep,78).
        print adjustedString AT (1,17).
        if stringStep + 78 = stringSize 
        {
          set scrollTime to 3.
          set stringStep to 0.
        } 
        else 
        {
          set scrollTime to 0.2.
          set stringStep to stringStep + 1.
        }

        set stringTime TO TIME:SECONDS.
      }

      //Function to populate node information display
      function refreshDisplay 
      {
        if allnodes[currNode-1]:prograde > 0 
        {
          if checkNode = -1 {Return.}
          print round(ALLNODES[currNode-1]:PROGRADE,5) + "          " AT (15,2).
        } 
        else 
        {
          print round(ALLNODES[currNode-1]:PROGRADE,5) + "          " AT (15,2).
        }

        if allnodes[currNode-1]:radialout > 0 
        {
          print round(ALLNODES[currNode-1]:RADIALOUT,5) + "          " AT (15,3).
        } 
        else 
        {
          print round(ALLNODES[currNode-1]:RADIALOUT,5) + "          " AT (15,3).
        }

        if allnodes[currNode-1]:normal > 0 
        {
          print round(ALLNODES[currNode-1]:NORMAL,5) + "          " AT (15,4).
        } 
        else 
        {
          print round(ALLNODES[currNode-1]:NORMAL,5) + "          " AT (15,4).
        }

        calculateETA().

        if nextnode:orbit:hasnextpatch 
        {
          print "n.AP:         " + round(nextnode:orbit:nextpatch:apoapsis, 3) + "  " AT (0,7).
        } 
        else 
        {
          print "                                     " AT (0,7).
        }

        print round(nextnode:orbit:inclination,3) + "   " AT (15,8).
        print round(nextnode:orbit:apoapsis,3) + "   " AT (15,9).
        print round(nextnode:orbit:periapsis,3) + "   " AT (15,10).
        print unitSize + "   " AT (15,6).
        print currNode AT (14,1).
        print numNodes AT (19,1).
        checkPatches().
      }

      //Main loop
      function main
      {
        //Button 1
        function button1 
        {
          REMOVE ALLNODES[currNode-1].
        }

        buttons:setdelegate(1,button1@).  

        //Button 2
        function button2 
        {
          if toggleHelp = 0 
          {
            set toggleHelp to 1.
          } 
          else 
          {
            set toggleHelp to 0.
            print " ":padright(79) AT (0,17).
          }
        }

        buttons:setdelegate(2,button2@).

        //Button 3
        function button3 
        {
          SET ALLNODES[currNode-1]:ETA to ALLNODES[currNode-1]:ETA + ship:orbit:period / 2.
          set numPatches to countPatches().
          set numNodes to allnodes:length.
          refreshDisplay().
        }

        buttons:setdelegate(3,button3@).

        //Button 4
        function button4 
        {
          SET ALLNODES[currNode-1]:ETA to ALLNODES[currNode-1]:ETA - ship:orbit:period / 2.
          set numPatches to countPatches().
          set numNodes to allnodes:length.
          refreshDisplay().
        }

        buttons:setdelegate(4,button4@).

        //Button 5
        function button5 
        {
          SET ALLNODES[currNode-1]:PROGRADE to originalPrograde.
          SET ALLNODES[currNode-1]:RADIALOUT to originalRadial.
          SET ALLNODES[currNode-1]:NORMAL to originalNormal.
          SET ALLNODES[currNode-1]:ETA to originalETA.
          refreshDisplay().
        }

        buttons:setdelegate(5,button5@).
        //Button 7
        function button7 
        {
          SET unitSize TO unitSize * 10.
          refreshDisplay().
        }

        buttons:setdelegate(7,button7@).

        //Button 8
        function button8 
        {
          SET unitSize TO unitSize * 0.1.
          refreshDisplay().
        }

        buttons:setdelegate(8,button8@).

        //Button 9
        function button9 
        {
          if currNode < numNodes 
          {
            set currNode to currNode + 1.
          }

          refreshDisplay().
        }

        buttons:setdelegate(9,button9@).

        //Button 10
        function button10 
        {
          if currNode > 1 
          {
            set currNode to currNode - 1.
          }

          refreshDisplay().
        }

        buttons:setdelegate(10,button10@).

        //Button 11
        function button11 
        {
          if currPatch < numPatches - 1 
          {
            set currPatch to currPatch + 1.
          }

          refreshDisplay().
        }

        buttons:setdelegate(11,button11@).

        //Button 12
        function button12 
        {
          if currPatch > 0 
          {
            set currPatch to currPatch - 1.
          }

          refreshDisplay().
        }

        buttons:setdelegate(12,button12@).

        //Button 13
        function button13 
        {
          SET isDone to 1.
        }

        buttons:setdelegate(13,button13@).

        //UP Button
        function button14 
        {
          if currSelection > 0 
          {
            set currSelection to currSelection - 1.
          }

          clearPips().
          refreshDisplay().
        }

        buttons:setdelegate(-3,button14@).

        //DOWN Button
        function button15 
        {
          if currSelection < 5 
          {
            set currSelection to currSelection + 1.
          }

          clearPips().
          refreshDisplay().
        }

        buttons:setdelegate(-4,button15@).

        //LEFT Button
        function button16 
        {
          if currSelection = 0 
          {
            if currNode > 1 
            {
              set currNode to currNode - 1.
            }
          }

          if currSelection = 1 
          {
            SET ALLNODES[currNode-1]:PROGRADE to ALLNODES[currNode-1]:PROGRADE - unitSize.
          }

          if currSelection = 2 
          {
            SET ALLNODES[currNode-1]:RADIALOUT to ALLNODES[currNode-1]:RADIALOUT - unitSize.
          }

          if currSelection = 3 
          {
            SET ALLNODES[currNode-1]:NORMAL to ALLNODES[currNode-1]:NORMAL - unitSize.
          }

          if currSelection = 4 
          {
            SET ALLNODES[currNode-1]:ETA to ALLNODES[currNode-1]:ETA - unitSize.
          }

          if currSelection = 5 
          {
            SET unitSize TO unitSize * 0.1.
          }

          set numPatches to countPatches().
          set numNodes to allnodes:length.
          refreshDisplay().
        }

        buttons:setdelegate(-5,button16@).

        //RIGHT Button
        function button17 
        {
          if currSelection = 0 
          {
            if currNode < numNodes 
            {
              set currNode to currNode + 1.
            }
          }

          if currSelection = 1 
          {
            SET ALLNODES[currNode-1]:PROGRADE to ALLNODES[currNode-1]:PROGRADE + unitSize.
          }

          if currSelection = 2 
          {
            SET ALLNODES[currNode-1]:RADIALOUT to ALLNODES[currNode-1]:RADIALOUT + unitSize.
          }

          if currSelection = 3 
          {
            SET ALLNODES[currNode-1]:NORMAL to ALLNODES[currNode-1]:NORMAL + unitSize.
          }

          if currSelection = 4 
          {
            SET ALLNODES[currNode-1]:ETA to ALLNODES[currNode-1]:ETA + unitSize.
          }

          if currSelection = 5 
          {
            SET unitSize TO unitSize * 10.
          }

          set numPatches to countPatches().
          set numNodes to allnodes:length.
          refreshDisplay().
        }

        buttons:setdelegate(-6,button17@).

        //X Button
        function button19 
        {
          if currSelection = 0 
          {
            set currNode to 1.
          }

          if currSelection = 1 
          {
            SET ALLNODES[currNode-1]:PROGRADE to 0.
          }

          if currSelection = 2 
          {
            SET ALLNODES[currNode-1]:RADIALOUT to 0.
          }

          if currSelection = 3 
          {
            SET ALLNODES[currNode-1]:NORMAL to 0.
          }

          if currSelection = 4 
          {
            SET ALLNODES[currNode-1]:ETA to 0.
          }

          if currSelection = 5 
          {
            SET unitSize TO 1.
          }

          set numPatches to countPatches().
          set numNodes to allnodes:length.
          refreshDisplay().
        }

        buttons:setdelegate(-2,button19@).

        CLEARSCREEN.

        //Print UI layout
        PRINT "          |DEL NODE  |HELP      |OP+       |OP-       |RESET     |XXXXXXXXXX|" at (0,0).
        PRINT "|UNIT +    |UNIT -    |NEXT NODE |PREV NODE |NEXT PATCH|PREV PATCH|EXIT      |" at (0,20).
        PRINT "NODE:" AT (2,1).
        PRINT "OF" AT (16,1).
        PRINT "PROGRADE:" AT (2,2).
        PRINT "RADIAL:" AT (2,3).
        PRINT "NORMAL:" AT (2,4).
        PRINT "ETA TO NODE:" AT (2,5).
        PRINT "UNIT SIZE:" AT (2,6).
        print "INC:" AT (0,8).
        PRINT "AP:" AT (0,9).
        PRINT "PE:" AT (0,10).
        PRINT "--------------------------------------------------------------------------------" AT (0,11).
        print "# OF PATCHES:" AT (0,12).
        print "ENCOUNTER WITH:" AT (0,13).
        print "ALTITUDE:" AT (0,14).
        print "INCLINATION:" AT (0,15).
        print "Node Angle to Prograde: " at (40,3).
        print "Node Angle to Retrograde: " at (40,4).
        print "Ship Angle to Prograde: " at (40,1).
        print "Ship Angle to Retrograde: " at (40,2).
        print "Next Body Encounter: " at(40,13).

        set numPatches to countPatches().
        set numNodes to allnodes:length.
        refreshDisplay().

        //Sub loop
        UNTIL isDone > 0 
        {
            ///////////////
                    if not HASNODE
                    {
                      clearscreen.
                      print "Node lost, exiting".
                      wait 3.
                      return.
                    }
                    
                    print encounter at (60,13).
                    

            
                    set v1 to velocityat(ship, nextnode:eta + time:seconds):orbit.
                    set v2 to velocityat(ship:body, nextnode:eta + time:seconds):orbit - velocityat(sun, nextnode:eta + time:seconds):orbit.
                    set v_ang to vectorangle(v1, v2).
                    set svdot2 to vdot(v1,v2).
                    set test to vcrs(v1,v2).
                    lock ang2 to svdot2.

                    if not(defined ang1)
                    {
                      set ang1 to svdot2.
                    }

                    if not(defined angle)
                    {
                      set angle to 0.
                    }
                    
                    wait 0.

                    if ang1 < ang2
                    {

                      if test:y > 0
                      {

                        set angle to abs(90 - v_ang).

                        if angle < 0
                        {
                          set angle to round(360 - abs(angle), 2).
                        }

                        set ang1 to v_ang.
                      }
                      else
                      {
                        set angle to round(v_ang + 90, 2).
                        set ang1 to v_ang.
                      }
                    }

                    if ang1 > ang2
                    {

                        if test:y > 0
                        {

                          set angle to ((v_ang*-1) + 450).

                          if angle < 0
                          {
                            set angle to 360 - abs(v_ang).
                            set ang1 to v_ang.
              
                          }
                          else
                          {
                          }
                        }
                        else
                        {
                          set angle to (v_ang + 90).

                          if angle < 0
                          {
                            set angle to 360 - abs(v_ang).
                            set ang1 to v_ang.
                          }
                          else
                          {
                          }
                        }
                    }

                    if angle - 180 < 0
                    {
                      set retroangle to angle + 180.
                    }

                    if angle - 180 > 0
                    {
                      set retroangle to round(angle - 180, 2).
                    }

                    set nodeanglepro to (round(angle, 2)).
                    print  round(angle, 2) + "  " at (70,3).
                    print  retroangle + "  "at (70,4).

                    /////////////////

                    set v1s to ship:velocity:orbit.
                    set v2s to Kerbin:velocity:orbit - Sun:velocity:orbit.
                    set v_angs to vectorangle(v1s, v2s).
                    set svdot2s to vdot(v1s,v2s).
                    lock ang2s to svdot2s.

                    if not(defined ang1s)
                    {
                     set ang1s to svdot2s.
                    }

                    if not(defined angless)
                    {
                     set angless to 0.
                    }
                    
                    wait 0.

                    if ang1s < ang2s
                    {
                      set angless to round(v_angs + 90, 2).
                      set ang1s to svdot2s.
                    }

                    if ang1s > ang2s
                    {
                        set angless to 90 - round(v_angs, 2).
                        
                        if angless < 0
                        {
                            set angless to 360 - abs(angless).
                            set ang1s to svdot2s. 
                        }
                    }

                    if angless - 180 < 0
                    {
                        set retroangless to angless + 180.
                    }

                    if angless - 180 > 0
                    {
                        set retroangless to round(angless - 180, 2).
                    }

                    print round(angless, 2)+ "  "  at (70,1).
                    print retroangless + "  " at (70,2).

            ////////////////////


          //Bail on node lost
          if not HASNODE
          {
            clearscreen.
            print "Node lost, exiting".
            return.
          }
          //Check for trajectory escape
          if nextnode:orbit:transition = "ESCAPE" 
          {
            print "-ON ESCAPE TRAJECTORY-" AT (27,16).
          } 
          else 
          {
            print "                      " AT (27,16).
          }
          //Print selection pip
          print ">" at (0,currSelection + 1).
          //Recalculate ETA every half second
          IF TIME:SECONDS - recordTime > 0.5 
          {
            if checkNode = -1 
            {
              Return.
            } 
            else 
            {
              calculateETA().
              checkTarget().
            }
          }

          //Print help text
          if toggleHelp = 1 
          {
            IF TIME:SECONDS - stringTime > scrollTime 
            {
              textScroller().
            }
          }

          //Numpad listener
          if terminal:input:haschar 
          {
            set ch to terminal:input:getchar().
          }

          if ch = "8" 
          {
            button14().
            SET ch to "".
          }

          if ch = "2" 
          {
            button15().
            SET ch to "".
          }

          if ch = "4" 
          {
            button16().
            SET ch to "".
          }

          if ch = "5" 
          {
            button19().
            SET ch to "".
          }

          if ch = "6" 
          {
            button17().
            SET ch to "".
          }

          if ch = "+" 
          {
            SET unitSize TO unitSize * 10.
            refreshDisplay().
            SET ch to "".
          }

          if ch = "-" 
          {
            SET unitSize TO unitSize * 0.1.
            refreshDisplay().
            SET ch to "".
          }

          //First time refresh
          if hasRan = 0 
          {
            refreshDisplay().
            set hasRan to 1.
          }
          wait 0.001.
        }
      clearscreen.
      }
      main().
      bakeros().
  }
}

function bakerservo
{
    //Initialize local variables
  local selectedServoModule to 0.
  local selectedPower to 1.
  local invertedX to 0.
  local modifierX to -1.
  local lrSet to -1.
  local udSet to -1.
  local fbSet to -1.
  local xySet to -1.
  local ch to "".
  local helpText to "     -Press UP/DOWN buttons to select robotic part, press LEFT/RIGHT to change desired angle, press ENTER to reset selected part angle to default state, SET buttons allow assigning the labelled numpad number set to selected robotic part for direct control, set power with POWER+/- buttons, invert controls with INVRT CTRL button, toggle attached grabber activation with GRABBER button, enable and turn on attached laser measures with LASER button (Requires Laserdist mod)-     ".
  local stringStep to 0.
  local stringMin to 0.
  local stringMax to 0.
  local stringTime to 0.
  local scrollTime to 0.1.
  local toggleHelp to 0.

  //Function to scroll help text
  function textScroller 
  {
    parameter row.
    if not toggleHelp 
    {
      print " ":padright(79) AT (0,row).
    } 
    else 
    {
      local stringSize to helpText:length.
      local adjustedString to helpText:substring(0 + stringStep,78).
      print adjustedString AT (1,row).
      if stringStep + 78 = stringSize 
      {
        set scrollTime to 3.
        set stringStep to 0.
      } 
      else 
      {
        set scrollTime to 0.1.
        set stringStep to stringStep + 1.
      }

      set stringTime TO TIME:SECONDS.
    }
  }

  function servomain 
  {
    CLEARSCREEN.
    SET isDone to 0.

    function button0 
    {
      if selectedServoModule < servoModules:length - 1 
      {
        set selectedServoModule to selectedServoModule + 1.
      }
    }

    buttons:setdelegate(-4,button0@).
    
    function button1 
    {
      if selectedServoModule > 0 
      {
        set selectedServoModule to selectedServoModule - 1.
      }
    }

    buttons:setdelegate(-3,button1@).
    
    function button2 
    {
      if servoModules[selectedServoModule]:name = "ModuleRoboticServoPiston" 
      {
        local currentExtension to servoModules[selectedServoModule]:getfield("target extension").
        servoModules[selectedServoModule]:setfield("target extension", currentExtension - selectedPower * modifierX).
      } 
      else 
      {
        local currentAngle to servoModules[selectedServoModule]:getfield("target angle").
        servoModules[selectedServoModule]:setfield("target angle", currentangle + selectedPower * modifierX).
      }
    }

    buttons:setdelegate(-6,button2@).
      
    function button3 
    {
      if servoModules[selectedServoModule]:name = "ModuleRoboticServoPiston" 
      {
        local currentExtension to servoModules[selectedServoModule]:getfield("target extension").
        servoModules[selectedServoModule]:setfield("target extension", currentExtension + selectedPower * modifierX).
      } 
      else 
      {
        local currentAngle to servoModules[selectedServoModule]:getfield("target angle").
        servoModules[selectedServoModule]:setfield("target angle", currentangle - selectedPower * modifierX).
      }
    }

    buttons:setdelegate(-5,button3@).

    function button4 
    {
      if servoModules[selectedServoModule]:name = "ModuleRoboticServoPiston" 
      {
        servoModules[selectedServoModule]:doevent("reset to build extension").
      } 
      else 
      {
        servoModules[selectedServoModule]:doevent("reset to build angle").
      }
    }

    buttons:setdelegate(-1,button4@).

    function button5 
    {
    }

    buttons:setdelegate(5,button5@).

    function button7 
    {
      set selectedPower to selectedPower + 0.05.
    }

    buttons:setdelegate(7,button7@).
    
    function button8 
    {
      if selectedPower > 0 
      {
        set selectedPower to selectedPower - 0.05.
      }
    }

    buttons:setdelegate(8,button8@).
    
    function button9 
    {
      if invertedX 
      {
        set modifierX to -1.
        set invertedX to 0.
        print "               " at (30,17).
      } 
      else 
      {
        set modifierX to 1.
        set invertedX to 1.
        print "-INVERTED CTRL-" at (30,17).
      }
    }

    buttons:setdelegate(9,button9@).
    
    function button10 
    {
      if grabberModules:length > 0 
      {
        set iterGrabberModules to grabberModules:ITERATOR.
        UNTIL NOT iterGrabberModules:next 
        {
          grabberModules[iterGrabberModules:index]:doaction("toggle arming", true).
        }
      }
    }

    buttons:setdelegate(10,button10@).
    
    function button11 
    {
      set lrSet to selectedServoModule.
    }

    buttons:setdelegate(0,button11@).
    
    function button12 
    {
      set udSet to selectedServoModule.
    }

    buttons:setdelegate(1,button12@).
    
    function button13 
    {
      set fbSet to selectedServoModule.
    }

    buttons:setdelegate(2,button13@).
    
    function button14 
    {
      set xySet to selectedServoModule.
    }

    buttons:setdelegate(3,button14@).
    
    function button15 
    {
      if laserModules:length > 0 {
        laserModules[0]:doaction("toggle", true).
        laserModules[0]:setfield("visible", true).
      }
    }

    buttons:setdelegate(11,button15@).
    
    function button16 
    {
      SET isDone to 1.
    }

    buttons:setdelegate(13,button16@).
    
    function button17 
    {
      if toggleHelp = 0 
      {
        set toggleHelp to 1.
      } 
      else 
      {
        set toggleHelp to 0.
      }
    }

    buttons:setdelegate(12,button17@).
    
    local servoModules to list().
    local partList to ship:parts.
    for thePart in partList{
      local moduleList to thePart:modules.
      from{local i is 0.}until i = moduleList:length step{set i to i+1.}do
      {
        local theModule is moduleList[i].
        if (theModule = "ModuleRoboticRotationServo") or (theModule = "ModuleRoboticServoPiston") or (theModule = "ModuleRoboticServoHinge")
        {
          servoModules:add(thePart:getModuleByIndex(i)).
        }                      
      }
    }
    
    local grabberModules to list().
    for thePart in partList
    {
      local moduleList2 to thePart:modules.
      from{local i is 0.}until i = moduleList2:length step{set i to i+1.}do
      {
        local theModule is moduleList2[i].
        if (theModule = "ModuleAnimateGeneric") and (thePart:name = "GrapplingDevice")
        {
          grabberModules:add(thePart:getModuleByIndex(i)).
        }                      
      }
    }
    
    local laserModules to list().

    for thePart in partList
    {
      local moduleList3 to thePart:modules.
      from{local i is 0.}until i = moduleList3:length step{set i to i+1.}do
      {
        local theModule is moduleList3[i].
        if (theModule = "LaserDistModule")
        {
          laserModules:add(thePart:getModuleByIndex(i)).
        }                      
      }
    }

    PRINT "SET 4/6   |SET 2/8   |SET 1/7   |SET 3/9   | VULCAN SERVOCONTROL |XXXXXXXXXX|" at (0,0).
    PRINT "|POWER+    |POWER-    |INVRT CTRL|          |          |HELP      |EXIT      |" at (0,18).
    
    until isDone > 0 
    {
      if servoModules:length = 0 
      {
        set isDone to 1.
        clearscreen.
        print "NO ROBOTIC PARTS FOUND, EXITING".
        return.
      }

      local iterServoModules to servoModules:ITERATOR.
      local position to 1.
    
      if laserModules:length > 0
      {
        print "Laser Target:   " + laserModules[0]:getfield("hit") + "               " at (0,16).
      }

      print "Selected Power: " + selectedPower + "   " at (0,17).
      
      IF TIME:SECONDS - stringTime > scrollTime 
      {
        textScroller(15).
      }
      
      UNTIL NOT iterServoModules:next 
      {
        if selectedservoModule = iterServoModules:index 
        {
          set selectorarrow to ">".
        } 
        else 
        {
          set selectorarrow to " ".
        }

        if lrSet = iterServoModules:index 
        {
          set numpadIndicator to " <4/6> ".
        } 
        else 
        {
          if udSet = iterServoModules:index 
          {
            set numpadIndicator to " <2/8> ".
          } 
          else 
          {
            if fbSet = iterServoModules:index 
            {
              set numpadIndicator to " <1/7> ".
            } 
            else 
            {
              if xySet = iterServoModules:index 
              {
                set numpadIndicator to " <3/9> ".
              } 
              else 
              {
                set numpadIndicator to "       ".
              }
            }
          }
        }
        if servoModules[iterServoModules:index]:name = "ModuleRoboticServoPiston" 
        {
          set strAngle to "" + round(servoModules[iterServoModules:index]:getfield("target extension"),2).
          PRINT strAngle:padleft(7) AT (72,position).
        } 
        else 
        {
          set strAngle to "" + round(servoModules[iterServoModules:index]:getfield("target angle"),2).
          PRINT strAngle:padleft(7) AT (72,position).
        }

        PRINT selectorarrow + servoModules[iterServoModules:index]:part:title + " (" + servoModules[iterServoModules:index]:part:tag + ")" + numpadIndicator + "   " AT (1,position).
        set position to position + 1.
      }

      if grabberModules:length > 0 
      {
        PRINT "GRABBER   " at (34,18).
      }

      if laserModules:length > 0 
      {
        PRINT "LASER     " at (45,18).
      }

      if terminal:input:haschar 
      {
        set ch to terminal:input:getchar().
      }

      if ch = "6" 
      {
        if lrSet = -1 
        {
        } 
        else 
        {
          if servoModules[lrSet]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[lrSet]:getfield("target extension").
            servoModules[lrSet]:setfield("target extension", currentExtension - selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[lrSet]:getfield("target angle").
            servoModules[lrSet]:setfield("target angle", currentangle + selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "4" 
      {
        if lrSet = -1 
        {
        } 
        else 
        {
          if servoModules[lrSet]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[lrSet]:getfield("target extension").
            servoModules[lrSet]:setfield("target extension", currentExtension + selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[lrSet]:getfield("target angle").
            servoModules[lrSet]:setfield("target angle", currentangle - selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "8" 
      {
        if udSet = -1 
        {
        } 
        else 
        {
          if servoModules[udset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[udset]:getfield("target extension").
            servoModules[udset]:setfield("target extension", currentExtension - selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[udset]:getfield("target angle").
            servoModules[udset]:setfield("target angle", currentangle + selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "2" 
      {
        if udSet = -1 
        {
        } 
        else 
        {
          if servoModules[udset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[udset]:getfield("target extension").
            servoModules[udset]:setfield("target extension", currentExtension + selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[udset]:getfield("target angle").
            servoModules[udset]:setfield("target angle", currentangle - selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "7" 
      {
        if fbSet = -1 
        {
        } 
        else 
        {
          if servoModules[fbset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[fbset]:getfield("target extension").
            servoModules[fbset]:setfield("target extension", currentExtension - selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[fbset]:getfield("target angle").
            servoModules[fbset]:setfield("target angle", currentangle + selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "1" 
      {
        if fbSet = -1 
        {
        } 
        else 
        {
          if servoModules[fbset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[fbset]:getfield("target extension").
            servoModules[fbset]:setfield("target extension", currentExtension + selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[fbset]:getfield("target angle").
            servoModules[fbset]:setfield("target angle", currentangle - selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "9" 
      {
        if xySet = -1 
        {
        } 
        else 
        {
          if servoModules[xyset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[xyset]:getfield("target extension").
            servoModules[xyset]:setfield("target extension", currentExtension - selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[xyset]:getfield("target angle").
            servoModules[xyset]:setfield("target angle", currentangle + selectedPower * modifierX).
          }

          set ch to "".
        }
      }

      if ch = "3" 
      {
        if xySet = -1 
        {
        } 
        else 
        {
          if servoModules[xyset]:name = "ModuleRoboticServoPiston" 
          {
            local currentExtension to servoModules[xyset]:getfield("target extension").
            servoModules[xyset]:setfield("target extension", currentExtension + selectedPower * modifierX).
          } 
          else 
          {
            local currentAngle to servoModules[xyset]:getfield("target angle").
            servoModules[xyset]:setfield("target angle", currentangle - selectedPower * modifierX).
          }
          set ch to "".
        }
      }

      if ch = "5" 
      {
        if grabberModules:length > 0 
        {
          set iterGrabberModules to grabberModules:ITERATOR.
          UNTIL NOT iterGrabberModules:next 
          {
            grabberModules[iterGrabberModules:index]:doaction("toggle arming", true).
          }
        }

        set ch to "".
      }

      if ch = "+" 
      {
        set selectedPower to selectedPower + 1.
        set ch to "".
      }
      if ch = "-" 
      {
        if selectedPower > 0 
        {
          set selectedPower to selectedPower - 1.
        }
        set ch to "".
      }
      wait 0.001.
    }
    clearscreen.
  }
  servomain().
  bakeros().
}  
  
function bakerpatchinfo 
{
  CLEARSCREEN.
  SET isDone to 0.

  function button0 
  {
  }

  buttons:setdelegate(-4,button0@).
  
  function button1 
  {
  }

  buttons:setdelegate(-3,button1@).
  
  function button7 
  {
  }

  buttons:setdelegate(7,button7@).
  
  function button8 
  {
  }

  buttons:setdelegate(8,button8@).
  
  function button16 
  {
    SET isDone to 1.
  }

  buttons:setdelegate(13,button16@).
  
	local ch to "".
	local nextBody to "".
	local hpd to "".
	local s to "".
	local m to "".
	local h to "".
	local d to "".
	local finalTime to "".

	function convertTime 
  {
  	parameter timeSeconds.
  	SET hpd TO kuniverse:hoursperday.
  	set s to floor(timeSeconds).
  	set m to floor(s/60). set s to mod(s,60).
  	set h to floor(m/60). set m to mod(m,60).
  	set d to floor(h/hpd). set h to mod(h,hpd).
  }

	PRINT "          |          |          |  VULCAN PATCH INFO  |          |XXXXXXXXXX|" at (0,0).
	PRINT "|          |          |          |          |          |          |EXIT      |" at (0,18).
	
  until isDone > 0 
  {

		if ORBIT:HASNEXTPATCH 
    {
			set nextPatch TO OBT:NEXTPATCH.
			print "Encounter: " + nextPatch:body:name + "   " at (0,1).
			print "Apoapsis: " + round(nextPatch:apoapsis,2) + "   " at (0,2).
			print "Periapsis: " + round(nextPatch:periapsis,2) + "   " at (0,3).
			print "Inclination: " + round(nextPatch:inclination,2) + "   " at (0,4).
			convertTime(nextPatch:nextpatcheta).
			print "ETA: " + d + "d" + h + "h" + m + "m" + s + "s" + "   " at (0,5).
		} 
    else 
    {
			set nextPatch to "".
			print "Encounter: ":padright(40) at (0,1).
			print "Apoapsis: ":padright(40) at (0,2).
			print "Periapsis: ":padright(40) at (0,3).
			print "Inclination: ":padright(40) at (0,4).
			print "ETA: ":padright(40) at (0,5).
		}

    if terminal:input:haschar 
    {
      set ch to terminal:input:getchar().
    }

    if ch = "6" 
    {
    	set ch to "".
    }

    if ch = "4" 
    {
    	set ch to "".
    }

    if ch = "8" 
    {
    	set ch to "".
    }

    if ch = "2" 
    {
    	set ch to "".
    }

    if ch = "7" 
    {
    	set ch to "".
    }

    if ch = "1" 
    {
    	set ch to "".
    }

    if ch = "9" 
    {
    	set ch to "".
    }

    if ch = "3" 
    {
    	set ch to "".
    }

    if ch = "5" 
    {
    	set ch to "".
    }

    if ch = "+" 
    {
    	set ch to "".
    }

    if ch = "-" 
    {
    	set ch to "".
    }

    wait 0.001.
  }
  clearscreen.
  bakeros().
}

function bakeraa
{
	function aamain 
	{
    CLEARSCREEN.
    local isDone to 0.
    SET addons:aa:flybywire to true.
    SET addons:aa:vertspeed to 0.
    SET addons:aa:maxclimbangle to 0.
    set rotHeading to 0.
    set killrotToggle to 1.
    local thePart to ship:parts[0].
    local moduleList to thePart:modules.
    local MJModule to list().
    local keepVert to 0.

    from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
      local theModule is moduleList[i].
      if (theModule = "MechJebCore") {
        MJModule:add(thePart:getModuleByIndex(i)).
      }                      
    }

    if addons:aa:speed = -1 {
      SET addons:aa:speed to 0.
    }

    if addons:aa:altitude = -1 {
      SET addons:aa:altitude to 0.
    }

    SET addons:aa:flybywire to false.
    local refreshTimer to 0.
    local selection to 0.
    local clearPips to 0.
    local buttonRefresh to 0.
    local v0 to getvoice(0).
    set v0:wave to "sawtooth".
    
    function button0 
      {
        if addons:aa:flybywire = true 
        {
          set addons:aa:flybywire to false.
          v0:play(slidenote(400, 200, 0.1)).
        } else 
        {
          set addons:aa:flybywire to true.
          v0:play(slidenote(200, 400, 0.1)).
        }
      }


    buttons:setdelegate(0,button0@).
    
    function button1 {
      if addons:aa:director = true {
        set addons:aa:director to false.
      } else {
        set addons:aa:director to true.
      }
      set buttonRefresh to 1.
    }
    buttons:setdelegate(1,button1@).
    
    function button2 {
      if addons:aa:cruise = true {
        set addons:aa:cruise to false.
        v0:play(slidenote(400, 200, 0.1)).
      } else {
        set addons:aa:cruise to true.
        v0:play(slidenote(200, 400, 0.1)).
      }
      set buttonRefresh to 1.
    }
    buttons:setdelegate(2,button2@).
    
    function button3 {
      if addons:aa:speedcontrol = true {
        set addons:aa:speedcontrol to false.
        v0:play(slidenote(400, 200, 0.1)).
      } else {
        set addons:aa:speedcontrol to true.
        v0:play(slidenote(200, 400, 0.1)).
      }
      set buttonRefresh to 1.
    }
    buttons:setdelegate(3,button3@).

    function buttonUp {
        if selection > 0 {
          set selection to selection - 1.
        }
        set buttonRefresh to 1.
    }
    buttons:setdelegate(-3,buttonUp@).

    function button7 {
        if killRotToggle = 1 {
          set killRot to ship:prograde + r(rotHeading,0,0).
          set addons:aa:flybywire to false.
          sas off.
          lock steering to killRot.
          set killRotToggle to 0.
          set buttonRefresh to 1.
        } else {
          unlock steering.
          sas on.
          set killRotToggle to 1.
          set buttonRefresh to 1.
        }
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
        set rotHeading to rotHeading - 10.
        set killRot to ship:prograde + r(rotHeading,0,0).
        set buttonRefresh to 1.
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
        set rotHeading to rotHeading + 10.
        set killRot to ship:prograde + r(rotHeading,0,0).
        set buttonRefresh to 1.
    }
    buttons:setdelegate(9,button9@).

    function buttonDown {
        if selection < 4 {
          set selection to selection + 1.
        }
        set buttonRefresh to 1.
    }
    buttons:setdelegate(-4,buttonDown@).

    function buttonLeft {
        if selection = 0 {
          if addons:aa:heading > 0 {
            set addons:aa:heading to addons:aa:heading - 1.
          } else {
            set addons:aa:heading to 359.
          }
        }
        if selection = 1 {
          if addons:aa:altitude > 0 {
            set addons:aa:altitude to addons:aa:altitude - 500.
          }
        }
        if selection = 2 {
          set addons:aa:vertspeed to addons:aa:vertspeed - 5.
        }
        if selection = 3 {
          set addons:aa:maxclimbangle to addons:aa:maxclimbangle - 1.
        }
        if selection = 4 {
          if addons:aa:speed > 0 {
            set addons:aa:speed to addons:aa:speed - 5.
          } 
        }
        set buttonRefresh to 1.
    }
    buttons:setdelegate(-5,buttonLeft@).

    function buttonRight {
        if selection = 0 {
          if addons:aa:heading < 359 {
            set addons:aa:heading to addons:aa:heading + 1.
          } else {
            set addons:aa:heading to 0.
          }
        }
        if selection = 1 {
          set addons:aa:altitude to addons:aa:altitude + 500.
        }
        if selection = 2 {
          set addons:aa:vertspeed to addons:aa:vertspeed + 5.
        }
        if selection = 3 {
          set addons:aa:maxclimbangle to addons:aa:maxclimbangle + 1.
        }
        if selection = 4 {
          set addons:aa:speed to addons:aa:speed + 5.
        }
        set buttonRefresh to 1.
    }
    buttons:setdelegate(-6,buttonRight@).

    function buttonEnter {

    }
    buttons:setdelegate(-1,buttonEnter@).

    function buttonCancel {
        if selection = 0 {
          set addons:aa:heading to -1.
        }
        if selection = 1 {
          set addons:aa:altitude to 0.
        }
        if selection = 2 {
          set addons:aa:vertspeed to 0.
        }
        if selection = 3 {
          set addons:aa:maxclimbangle to 0.
        }
        if selection = 4 {
          set addons:aa:speed to 0.
        }
        set buttonRefresh to 1.
    }
    buttons:setdelegate(-2,buttonCancel@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).

    function button12 {
        if keepVert = 0 {
          MJModule[0]:doaction("translatron keep vert", true).
          set keepVert to 1.
          set buttonRefresh to 1.
        } else {
          MJModule[0]:doaction("translatron off", true).
          set keepVert to 0.
          set buttonRefresh to 1.
        }
    }
    buttons:setdelegate(12,button12@).

    function button16 {
      SET isDone to 1.
    }
    buttons:setdelegate(13,button16@).
    
      local ch to "".
      PRINT "FWB       |DIRECTOR  |CRUISE    |SPEED     |   VULCAN AIRCRAFT   |XXXXXXXXXX|" at (0,0).
      PRINT "|KILL ROT  |LEFT ROT  |RITE ROT  |          |          |KEEP VERT |EXIT      |" at (0,18).
      
    until isDone > 0 {
      if time:seconds - refreshTimer > 1 or buttonRefresh = 1 {
        PRINT addons:aa:flybywire + " " at (0,1).
        PRINT addons:aa:director + " " at (12,1).
        PRINT addons:aa:cruise + " " at (23,1).
        PRINT addons:aa:speedcontrol + " " at (34,1).
        if killRotToggle = 0 {
          PRINT "--KILL ROT ON--" at (15, 10).
        } else {
          PRINT "               " at (15, 10).
        }
        if keepVert = 1 {
          PRINT "--KEEP VERT ON--" at (15, 9).
        } else {
          PRINT "                " at (15, 9).
        }
        PRINT "KILLROT SET: " + rotHeading + "   " at (2,12).
        PRINT "HEADING SET: " + addons:aa:heading + "   " at (2,13).
        PRINT "ALTITUDE SET: " + addons:aa:altitude + "   " at (2,14).
        PRINT "VERTICAL SPEED SET: " + addons:aa:vertspeed + "   " at (2,15).
        PRINT "MAX CLIMB ANGLE SET: " + addons:aa:maxclimbangle + "   " at (2,16).
        PRINT "SPEED SET: " + addons:aa:speed + "  " at (2,17).
        UNTIL clearPips = 5 {
          PRINT " " at (0,clearPips + 13).
          set clearPips to clearPips + 1.
        }
        set clearPips to 0.
        PRINT ">" at (0,selection + 13).
        SET refreshTimer to time:seconds.
        set buttonRefresh to 0.
      }
      if terminal:input:haschar {
      set ch to terminal:input:getchar().
      }

      if ch = "6" {
        buttonRight().
        set ch to "".
      }
      if ch = "4" {
        buttonLeft().
        set ch to "".
      }
      if ch = "8" {
        buttonUp().
        set ch to "".
      }
      if ch = "2" {
        buttonDown().
        set ch to "".
      }
      if ch = "7" {
        button0().
        set ch to "".
      }
      if ch = "1" {
        set ch to "".
      }
      if ch = "9" {
        button2().
        set ch to "".
      }
      if ch = "3" {
        button3().
        set ch to "".
      }
      if ch = "5" {
        buttonCancel().
        set ch to "".
      }
      if ch = "+" {
        set ch to "".
      }
      if ch = "-" {
        set ch to "".
      }
      wait 0.001.
    }
    clearscreen.
	}
	aamain().
  bakeros().
}	

function bakersetnode
{
    //Initialize local variables
  DECLARE PARAMETER secondPar is 0, minutePar is 0, hourPar is 0, dayPar is 0, yearPar is 0.
  local helpText to "     -Press Numpad up/down or up/down buttons to change selected time, numpad left/right or buttons to select time unit, numpad 5 or ENTER button creates new node at selected time, AN/DN sets time to next ascending/descending node, AP/PE toggles between setting time to next apoapsis or periapsis, RESET sets time to 0-     ".
  local stringStep to 0.
  local stringMin to 0.
  local stringMax to 0.
  local stringTime to 0.
  local scrollTime to 0.2.
  local toggleHelp to 0.
  local isDone to 0.
  local finalTime is 0.
  local currSel to 0.
  local ch to "".
  local finalTime to 0.
  local aPpEToggle to 0.
  local informationTimer to 0.
  local hpd to 0.
  local s to 0.
  local m to 0.
  local h to 0.
  local d to 0.
  local strCal to "".

  //Function to scroll help text
  function textScroller 
  {
    local stringSize to helpText:length.
    local adjustedString to helpText:substring(0 + stringStep,78).
    print adjustedString AT (1,17).
    if stringStep + 78 = stringSize 
    {
      set scrollTime to 3.
      set stringStep to 0.
    } 
    else 
    {
      set scrollTime to 0.2.
      set stringStep to stringStep + 1.
    }

    set stringTime TO TIME:SECONDS.
  }

  //Function to convert time units to seconds
  function toSeconds 
  {
    PARAMETER seconds.
    PARAMETER minutes.
    PARAMETER hours.
    PARAMETER days.
    PARAMETER years.
    LOCAL minuteToSeconds is minutes*60.
    LOCAL hourToSeconds is hours*3600.
    LOCAL dayToSeconds is days*21600.
    LOCAL yearToSeconds is years*7884000.
    LOCAL totalTime is yearToSeconds+dayToSeconds+hourToSeconds+minuteToSeconds+seconds.
    return totalTime.
  }

  //Function to calculate ETA to AN/DN
  function anDn 
  {
    if not (ship:status = "ORBITING") or (ship:status = "ESCAPING") 
    {
      return.
    }

    if not hastarget 
    {
      return.
    }

    local shipV is ship:obt:velocity:orbit.
    local tarV is target:obt:velocity:orbit.
    local shipN is vcrs(shipV,ship:position - body:position).
    local tarN is vcrs(tarV,target:position - body:position).

    if target:name = body:name 
    { 
      set tarN to body:angularvel. 
    }

    set intersectV to vcrs(shipN,tarN).
    local shipVec is ship:position - body:position.
    local done is false.
    local time_mod is 100.
    local increment is 100.
    local last_angl is vang(shipVec,intersectV).
    until done 
    {
      set shipVec to positionat(ship, time:seconds + time_mod) - body:position.
      set angl to vang(shipVec,intersectV).
      set spd to (last_angl-angl)/increment.
      if increment = 1 or angl < 0.05 and angl > last_angl 
      {
        set done to true.
        set time_mod to time_mod - increment.
      } 
      else 
      {
        set increment to max(min(angl/(spd*1.1),50000),1).
        set last_angl to angl.
        set time_mod to time_mod + increment.
      }
    }
    return time_mod.
  }

  //Function to calculate ETA to AP/PE
  function apPe 
  {
    local apoapsisETA is 0.
    local periapsisETA is 0.
    local apPETime is 0.
    local break1 is 0.
    local break2 is 0.
    if ship:orbit:eccentricity < 1 
    {
      set apoapsisETA to eta:apoapsis.
      set break1 to 1.
    }

    if eta:periapsis 
    {
      set periapsisETA to eta:periapsis.
      set break2 to 1.
    }

    if break1 = 0 and break2 = 0 
    {
      return 0.
    }

    if aPpEToggle = 0 
    {
      set apPETime to periapsisETA.
      print "-SET TO PERIAPSIS-" AT (30,16).
      set informationTimer to time:seconds.
    } 
    else 
    {
      set apPETime to apoapsisETA.
      print "-SET TO APOAPSIS-" AT (30,16).
      set informationTimer to time:seconds.
    }

    return apPETime.
  }

  //Main loop
  function setnodemain 
  {
    CLEARSCREEN.
    //Button 0
    function button0 
    {
      if toggleHelp = 0 
      {
        set toggleHelp to 1.
      } 
      else 
      {
        set toggleHelp to 0.
        print " ":padright(79) AT (0,17).
      }
    }

    buttons:setdelegate(0,button0@).

    //Button 7
    function button7 
    {
      if aPpEToggle = 0 
      {
        set aPpEToggle to 1.
      } 
      else 
      {
        set aPpEToggle to 0.
      }
      set finalTime to apPe().
    }

    buttons:setdelegate(7,button7@).

    //Button 8
    function button8 
    {
      set finalTime to anDn().
    }

    buttons:setdelegate(8,button8@).

    //Button 9
    function button9 
    {
      set finalTime to 0.
    }

    buttons:setdelegate(9,button9@).

    //Button 13
    function button13 
    {
      SET isDone to 1.
    }

    buttons:setdelegate(13,button13@).

    //UP Button
    function button14 
    {
      if currSel = 1 
      {
        set finalTime to finalTime + 21600.
      }

      if currSel = 2 
      {
        set finalTime to finalTime + 3600.
      }

      if currSel = 3 
      {
        set finalTime to finalTime + 60.
      }

      if currSel = 4 
      {
        set finalTime to finalTime + 1.
      }

    }

    buttons:setdelegate(-3,button14@).

    //DOWN Button
    function button15 
    {
      if currSel = 1 
      {
        set finalTime to finalTime - 21600.
      }

      if currSel = 2 
      {
        set finalTime to finalTime - 3600.
      }

      if currSel = 3 
      {
        set finalTime to finalTime - 60.
      }

      if currSel = 4 
      {
        set finalTime to finalTime - 1.
      }

    }

    buttons:setdelegate(-4,button15@).

    //LEFT Button
    function button16 
    {
      if currSel > 0 
      {
        SET currSel to currSel - 1.
      }
    }

    buttons:setdelegate(-5,button16@).

    //RIGHT Button
    function button17 
    {
      if currSel < 4 
      {
        SET currSel to currSel + 1.
      }
    }

    buttons:setdelegate(-6,button17@).

    //ENTER Button
    function button18 
    {
      local ND to NODE( TIME:SECONDS+finalTime, 0, 0, 0 ).
      ADD ND.
    }

    buttons:setdelegate(-1,button18@).

    //Initialize time from parameter
    set finalTime to toSeconds(secondPar,minutePar,hourPar,dayPar,yearPar).
    if finalTime > 0 
    {
      local ND to NODE( TIME:SECONDS+finalTime, 0, 0, 0 ).
      ADD ND.
      clearscreen.
      return.
    }

    print finalTime at (10,1).

    //Sub loop
    until isDone > 0 
    {
      //Convert seconds to calndar time

      set hpd TO kuniverse:hoursperday.
      set s to floor(finalTime).
      set m to floor(s/60). set s to mod(s,60).
      set h to floor(m/60). set m to mod(m,60).
      set d to floor(h/hpd). set h to mod(h,hpd).

      //Print UI elements
      PRINT "HELP      |          |          |   VULCAN SET NODE   |          |          |" at (0,0).
      PRINT "|AP/PE     |AN/DN     |RESET     |          |          |          |EXIT      |" at (0,20).
      PRINT "NODE IN:" at (0,1).
      local strFinalTime to "" + finalTime.
      PRINT strFinalTime:padright(20) at (10,1).
      PRINT "CALEND:" at (0,2).

      //AP/PE information display
      if time:seconds - informationTimer > 2 
      {
        print " ":padright(40) AT (30,16).
      }

      //Print help text
      if toggleHelp = 1 
      {
        IF TIME:SECONDS - stringTime > scrollTime 
        {
          textScroller().
        }
      }

      //Set color to current selection
      if currSel = 0 
      {
        set strCal to "" + + d + "d" + h + "h" + m + "m" + s + "s".
        PRINT strCal:padright(20) at (10,2).
      }

      if currSel = 1 
      {
        set strCal to "" + + d + "[#008000]d" + h + "h" + m + "m" + s + "s" + "                  ".
        PRINT strCal:padright(20) at (10,2).
      }

      if currSel = 2 
      {
        set strCal to "[#008000]" + + d + "d[#00ff00]" + h + "[#008000]h" + m + "m" + s + "s".
        PRINT strCal:padright(20) at (10,2).
      }

      if currSel = 3 
      {
        set strCal to "[#008000]" + + d + "d" + h + "h[#00ff00]" + m + "[#008000]m" + s + "s".
        PRINT strCal:padright(20) at (10,2).
      }

      if currSel = 4 
      {
        set strCal to "[#008000]" + + d + "d" + h + "h" + m + "m[#00ff00]" + s + "[#008000]s".
        PRINT strCal:padright(20) at (10,2).
      }

      //Numpad listener
      if terminal:input:haschar 
      {
        set ch to terminal:input:getchar().
      }

      if ch = "6"
      {
        button17().
        set ch to "".
      }

      if ch = "4" 
      {
        button16().
        set ch to "".
      }

      if ch = "8" 
      {
        button14().
        set ch to "".
      }

      if ch = "2" 
      {
        button15().
        set ch to "".
      }

      if ch = "5" 
      {
        button18().
        set ch to "".
      }

      wait 0.001.
    }
  clearscreen.
  }

  setnodemain().

  if not HASNODE
  {
    clearscreen.
    bakeros().
  } 

  bakernode().
}
  
function bakersms
{
	//Initialize local variables
	local ch to "".
	local selectedMissileModule to 0.
	local screenClear to 1.
	local inCoolDown to 0.
	local recordedRadarPos to 0.
	set forceBoreSight to 0.
	if not (defined radarFOV) {
		set radarFOV to 0.
	}
	if not (defined radarFOVHalf) {
		set radarFOVHalf to 0.
	}
	if not (defined radarFOVLeft) {
		set radarFOVLeft to 0.
	}
	if not (defined radarFOVRight) {
		set radarFOVRight to 0.
	}
	if not (defined missileModules) {
		set missileModules to list().
	}
	if not (defined missileAmount) {
		set missileAmount to 0.
	}
	if not (defined firstRun) {
		set firstRun to 1.
	}

	function smsmain {
	CLEARSCREEN.
	SET isDone to 0.

	function button0 {
	}
	buttons:setdelegate(-4,button0@).
	
	function buttonUp {
	}
	buttons:setdelegate(-3,buttonUp@).

	function buttonDown {
	}
	buttons:setdelegate(-4,buttonDown@).
	
	function buttonRight {
		if missileFireModules:length > 0 {
			missileFireModules[0]:doaction("next weapon", true).
		}
	}
	buttons:setdelegate(-6,buttonRight@).
		
	function buttonLeft {
		if missileFireModules:length > 0 {
			missileFireModules[0]:doaction("arm/disarm", true).
		}
	}
	buttons:setdelegate(-5,buttonLeft@).

	function button4 {
	}
	buttons:setdelegate(-1,button4@).

	function button5 {
		radarModules[0]:doaction("target unlock", true).
	}
	buttons:setdelegate(4,button5@).

	function button7 {
		gunPodModules[0]:doaction("toggle camera", true).
	}
	buttons:setdelegate(7,button7@).
	
	function button8 {
		gunPodModules[0]:doaction("slave turret", true).
	}
	buttons:setdelegate(8,button8@).
	
	function button9 {
		gunPodModules[0]:doaction("toggle target", true).
	}
	buttons:setdelegate(9,button9@).
	
	function button10 {
		gunPodModules[0]:doaction("toggle radar", true).
	}
	buttons:setdelegate(10,button10@).
	
	function button11 {
	}
	buttons:setdelegate(0,button11@).
	
	function button12 {
		if radarModules[0]:getfield("radar state") = true {
			radarModules[0]:doevent("disable radar").
		} else {
			radarModules[0]:doevent("enable radar").
		}
	}
	buttons:setdelegate(1,button12@).
	
	function button13 {
		radarModules[0]:doaction("toggle slave turrets", true).
	}
	buttons:setdelegate(2,button13@).
	
	function button14 {
		radarModules[0]:doaction("target next", true).
	}
	buttons:setdelegate(3,button14@).
	
	function button15 {
		radarModules[0]:doaction("toggle boresight", true).
		if radarModules[0]:getfield("boresight state") {
			set forceBoreSight to true.
		} else {
			set forceBoreSight to false.
		}
	}
	buttons:setdelegate(5,button15@).
	
	function button16 {
		SET isDone to 1.
	}
	buttons:setdelegate(13,button16@).
	
	function button17 {
		turretModules[0]:doaction("toggle weapon", true).
	}
	buttons:setdelegate(12,button17@).
	
	function populateStores {
		missileModules:clear().
		set missileAmount to 0.
		local partList to ship:partstagged("missile").
		for thePart in partList{
				local moduleList to thePart:modules.
				from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
					local theModule is moduleList[i].
					if (theModule = "MissileLauncher") {
						missileModules:add(thePart:getModuleByIndex(i)).
						set missileAmount to missileAmount + 1.
					}                      
				}
			}
	}
	
	if firstRun = 1 {
		print "Populating Stores...".
			populateStores().
			
			print "Finding Camera Pods...".
			set gunPodModules to list().
			local partList to ship:parts.
		for thePart in partList{
				local moduleList to thePart:modules.
				from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
					local theModule is moduleList[i].
					if (theModule = "ModuleTargetingCamera") {
						gunPodModules:add(thePart:getModuleByIndex(i)).
					}                      
				}
			}
		
			print "Finding Radars...".
			set radarModules to list().
			local partList to ship:parts.
		for thePart in partList {
				local moduleList to thePart:modules.
				from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
					local theModule is moduleList[i].
					if (theModule = "ModuleRadar") {
						radarModules:add(thePart:getModuleByIndex(i)).
					}                      
				}
			}
			if radarModules:length > 0 {
				set radarFOV to radarModules[0]:getfield("directional fov").
				set radarFOVHalf to radarFOV / 2.
				set radarFOVLeft to radarFOVHalf * -1.
				set radarFOVRight to radarFOVHalf.
			}
		
			print "Finding Weapon Managers...".
			set missileFireModules to list().
			local partList to ship:parts.
		for thePart in partList {
				local moduleList to thePart:modules.
				from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
					local theModule is moduleList[i].
					if (theModule = "MissileFire") {
						missileFireModules:add(thePart:getModuleByIndex(i)).
					}                      
				}
			}
		
			print "Finding Turrets...".
			set turretModules to list().
			local partList to ship:parts.
			for thePart in partList {
				local moduleList to thePart:modules.
				from{local i is 0.}until i = moduleList:length step{set i to i+1.}do{
					local theModule is moduleList[i].
					if (theModule = "ModuleWeapon") {
						turretModules:add(thePart:getModuleByIndex(i)).
					}                      
				}
			}
		}
		set firstRun to 0.
		PRINT "          | TGGL RDR | SLV TRT  | TGT NEXT |TGT UNLOCK| BORESITE |XXXXXXXXXX|" at (0,0).
		PRINT "--------------------------------------RADAR-----------------------------------" at (0,3).
		PRINT "--------------------------------------GUNPOD----------------------------------" at (0,15).
		PRINT "|  GUNPOD  | SLV TRT  | TGL TGT  | TGT RDR  |          |TGGL TURR |EXIT      |" at (0,18).
		LOCAL separator to 0.
		UNTIL separator = 10 {
			PRINT "|" at (40,separator + 4).
			set separator to separator + 1.
		}
		PRINT "S" at (40,6).
		PRINT "T" at (40,7).
		PRINT "O" at (40,8).
		PRINT "R" at (40,9).
		PRINT "E" at (40,10).
		PRINT "S" at (40,11).
		
	until isDone > 0 {
		if missileModules:length = 0 {
			set isDone to 1.
			clearscreen.
			print "NO MISSILES FOUND, EXITING".
			return.
		}
		local missileIterator to 0.
		local position to 4.
		
			if inCoolDown = 0 {
			if missileFireModules[0]:getfield("hasfiredmissile") = 1 {
				populateStores().
			}
			UNTIL missileIterator = missileAmount {
			if missileFireModules[0]:getfield("hasfiredmissile") = 1 {
				local cleanDisplay to 0.
				UNTIL cleanDisplay = 11 {
					PRINT "                                       " AT (0, cleanDisplay + 4).
					set cleanDisplay to cleanDisplay + 1.
				}
				populateStores().
				missileFireModules[0]:setfield("hasfiredmissile", 0).
			} else {
					LOCAL myList to missileModules[missileIterator]:part:title:split(" ").
				PRINT myList[0] + " | " + missileModules[missileIterator]:part:parent:tag AT (1,position).
			}
			set missileIterator to missileIterator + 1.
			set position to position + 1.
			}
			} else {
				if time:seconds < coolDownTimer + 0.5 {
					
				} else {
					set inCoolDown to 0.
				}
			}
		if gunPodModules:length > 0 {
			if gunPodModules[0]:getfield("guncam state") = 0 {
				PRINT "OFF" at (4,17).
			} else {
				PRINT "ON " at (4,17).
			}
			if gunPodModules[0]:getfield("slaveturrets") = 0 {
				PRINT "OFF" at (15,17).
			} else {
				PRINT "ON " at (15,17).
			}
			if gunPodModules[0]:getfield("target lock state") = 0 {
				PRINT "OFF" at (26,17).
			} else {
				PRINT "ON " at (26,17).
			}
			if gunPodModules[0]:getfield("radarlock") = 0 {
				PRINT "OFF" at (37,17).
			} else {
				PRINT "ON " at (37,17).
			}
			if gunPodModules[0]:getfield("targetrange") > 0 {
				PRINT "RNG: " + round(gunPodModules[0]:getfield("targetrange"),3) at (1,16).
			} else {
				PRINT "RNG: " at (1,16).
			}
				if gunPodModules[0]:getfield("lrlabel") = "LR" {
				PRINT "   LR" at (74,16).
			} else {
				PRINT "NO LR" at (74,16).
			}
		}

		if turretModules:length > 0 {
				if turretModules[0]:getfield("status") = "Disabled" {
				PRINT "OFF" at (59,17).
			} else {
				PRINT "ON " at (59,17).
			}
		}

			if radarModules:length > 0 {
				if radarModules[0]:getfield("radar state") {
				PRINT "ON " at (16,1).
			} else {
				PRINT "OFF" at (16,1).
			}
				if radarModules[0]:getfield("boresight state") {
				PRINT "ON " at (59,1).
			} else {
				PRINT "OFF" at (59,1).
			}
			if radarModules[0]:getfield("current locks") > 0 {
				PRINT "--LOCK ON--" at (39,1).
			} else {
				PRINT "           " at (39,1).
			}
			if radarModules[0]:getfield("current locks") = 0 AND forceBoreSight = true {
				if radarModules[0]:getfield("boresight state") = false {
					radarModules[0]:doaction("toggle boresight", true).
				}
			}
				if radarModules[0]:getfield("displayed targets") > 0 {
				PRINT "CNTCS:" + " " + radarModules[0]:getfield("displayed targets") at (70,1).
			} else {
				PRINT "CNTCS:" + " X" at (70,1).
			}
				if radarModules[0]:getfield("slave turrets") {
					PRINT "ON " at (26,1).
				} else {
					PRINT "OFF" at (26,1).
				}
			local radarPos to CEILING((radarModules[0]:getfield("current angle") - radarFOVLeft) * 79 / (radarFOVRight - radarFOVLeft) + 0).
				local radarCaret to "^".
			if radarPos > recordedRadarPos {
				PRINT radarCaret:padleft(radarPos + 1) at (0,2).
			} else {
				PRINT radarCaret:padright(terminal:width - radarPos) at (radarPos,2).
			}
			set recordedRadarPos to radarPos.
		}

			if missileFireModules:length > 0 {
				PRINT "ACTIVE WPN: " + missileFireModules[0]:getfield("weapon") + "              " AT (1,14).
				if missileFireModules[0]:getfield("isarmed") {
					PRINT "TRG: ARMD" AT (70,14).
				} else {
					PRINT "TRG: SAFE" AT (70,14).
				}
			}

		if terminal:input:haschar {
		set ch to terminal:input:getchar().
		}

		if ch = "6" {
			set ch to "".
		}
		if ch = "4" {
			set ch to "".
		}
		if ch = "8" {
			set ch to "".
		}
		if ch = "2" {
			set ch to "".
		}
		if ch = "7" {
			set ch to "".
		}
		if ch = "1" {
			set ch to "".
		}
		if ch = "9" {
			set ch to "".
		}
		if ch = "3" {
			set ch to "".
		}
		if ch = "5" {
		set ch to "".
			}
		if ch = "+" {
		set ch to "".
		}
		if ch = "-" {
		set ch to "".
		}
		wait 0.001.
	}
	clearscreen.
	}
	smsmain().
  wait 1.
  bakeros().
}	
	
function bakermoonplan
{
  function xfermoonmain {
    CLEARSCREEN.
    SET isDone to 0.

    function button0 {
    }
    buttons:setdelegate(0,button0@).
    
    function button1 {
    }
    buttons:setdelegate(1,button1@).
    
    function button2 {
    }
    buttons:setdelegate(2,button2@).

    function button3 {
    }
    buttons:setdelegate(3,button3@).

    function button4 {
    }
    buttons:setdelegate(4,button4@).

    function button5 {
    }
    buttons:setdelegate(5,button5@).

    function button7 {
      SET ND to NODE( TIME:SECONDS+timeToPhaseAngle, 0, 0, 0 ).
      ADD ND.
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
    }
    buttons:setdelegate(9,button9@).
    
    function button10 {
    }
    buttons:setdelegate(10,button10@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).
    
    function button12 {
    }
    buttons:setdelegate(12,button12@).
    
    function button13 {
      SET isDone to 1.
    }
    buttons:setdelegate(13,button13@).
    
    if not hastarget {
      clearscreen.
      print "NO TARGET FOUND, EXITING".
      return.
    }
    
    until isDone > 0 {

      print "Current Target:       " + target:name AT (0,1).
      set Angle1 to obt:lan+obt:argumentofperiapsis+obt:trueanomaly.
      set Angle2 to target:obt:lan+target:obt:argumentofperiapsis+target:obt:trueanomaly.
      set Angle1 to Angle1 - 360*floor(Angle1/360).
      set Angle2 to Angle2 - 360*floor(Angle2/360).
      set Angle3 to Angle2 - Angle1.
      set Angle3 to Angle3 - 360 * floor(Angle3/360).
      print "Current Phase Angle:  " + round(Angle3,2) AT (0,2).
      set optimalPhaseAngle to 180 * (1-(1/(2*sqrt(2))*sqrt((1+(ship:altitude+ship:orbit:body:radius)/(target:altitude+ship:orbit:body:radius))^3))).
      print "Optimal Phase Angle:  " + optimalPhaseAngle AT (0,3).
      set zeroPhase to Angle3 - optimalPhaseAngle.
      set zeroPhase to mod(zeroPhase + 360.0,360.0).
      print "To Zero Angle:        " + zeroPhase AT (0,4).
      set delta_theta to (360.0 / ship:orbit:period) - (360.0 / target:orbit:period).
      set timeToPhaseAngle to zeroPhase / delta_theta.
      SET hpd TO kuniverse:hoursperday.
      set s to floor(timeToPhaseAngle).
      set m to floor(s/60). set s to mod(s,60).
      set h to floor(m/60). set m to mod(m,60).
      set d to floor(h/hpd). set h to mod(h,hpd).
      set strCal to "ETA To Optimal Angle: " + + d + "d" + h + "h" + m + "m" + s + "s".
      PRINT strCal:padright(20) at (0,5).
      PRINT "|          |          |          | VULCAN MOONTRANSFER |          |XXXXXXXXXX|" at (0,0).
      PRINT "|ADD NODE  |          |          |          |          |          |EXIT      |" at (0,18).
      wait 0.001.
    }
  clearscreen.
  }
  xfermoonmain().
  bakeros().
} 

function bakerplanetplan
{
  function xferplanmain {
    CLEARSCREEN.
    SET isDone to 0.

    function button0 {
    }
    buttons:setdelegate(0,button0@).
    
    function button1 {
    }
    buttons:setdelegate(1,button1@).
    
    function button2 {
    }
    buttons:setdelegate(2,button2@).

    function button3 {
    }
    buttons:setdelegate(3,button3@).

    function button4 {
    }
    buttons:setdelegate(4,button4@).

    function button5 {
    }
    buttons:setdelegate(5,button5@).

    function button7 {
      SET ND to NODE( TIME:SECONDS+timeToPhaseAngle1, 0, 0, 0 ).
      ADD ND.
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
    }
    buttons:setdelegate(9,button9@).
    
    function button10 {
    }
    buttons:setdelegate(10,button10@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).
    
    function button12 {
    }
    buttons:setdelegate(12,button12@).
    
    function button13 {
      SET isDone to 1.
    }
    buttons:setdelegate(13,button13@).
    
    if not hastarget {
      clearscreen.
      print "NO TARGET FOUND, EXITING".
      wait 2.
      return.
    }
    
    function desiredPhase {
      PARAMETER o_alt.
      PARAMETER d_alt.
      PARAMETER u.
      set th to constant:pi * sqrt(o_alt + d_alt ^ 3.0) / (8.0 * u).
      set phase to (180.0 - sqrt(u / d_alt) * (th / d_alt) * (180.0 / constant:pi)).

      if phase < 0 {
        set phase to phase + 360.0.
      }
      return mod(phase,360.0).
    }
    
    set recordedZeroPhase to 0.
    set timeToPhaseAngle1 to 0.
    set timeToPhaseAngle2 to 0.
    set delta_theta to 1.
    SET t1 TO TIME:SECONDS.
    
    until isDone > 0 {

      print "Current Target:       " + target:name AT (0,1).
      Parameter TargetPlanet is target.
      Parameter StartingBody is ship:body.
      Parameter ReferenceBody is sun.

      set CurrentPhaseAngle to vang(TargetPlanet:position - ReferenceBody:position, StartingBody:position - ReferenceBody:position).
      set vcrsCurrentPhaseAngle to vcrs(TargetPlanet:position - ReferenceBody:position, StartingBody:position - ReferenceBody:position).
      if vdot(v(1,1,1), vcrsCurrentPhaseAngle) <= 0 {
        set CurrentPhaseAngle to 360 - CurrentPhaseAngle.
      }
      print "Current Phase Angle:  " + round(CurrentPhaseAngle,2) AT (0,2).

      Parameter TargetDestination is target.
      Parameter StartingPoint is ship:body.
      Parameter ReferenceBody is sun.

      set SMA1 to StartingPoint:orbit:semimajoraxis.
      set SMA2 to TargetDestination:orbit:semimajoraxis.
      set Ecc to Target:orbit:Eccentricity.

      set SMA3 to SMA1+SMA2.

      set TransitTime to constant:pi*sqrt((SMA3^3)/(8*ReferenceBody:mu)).
      lock PhaseAngle  to 180-sqrt(ReferenceBody:mu/SMA2)*(TransitTime/SMA2)*(180/constant:pi).

      until PhaseAngle < 360 {
        set PhaseAngle to PhaseAngle - 360.
      }

      until PhaseAngle > 0 {
        set PhaseAngle to PhaseAngle + 360.
      }
      print "Optimal Phase Angle:  " + PhaseAngle AT (0,3).

      set zeroPhase to CurrentPhaseAngle - PhaseAngle.
      set zeroPhase to mod(zeroPhase + 360.0,360.0).
      print "To Zero Angle:        " + zeroPhase AT (0,4).
      
      PRINT "          |          |          |    VULCAN PLANET TRANSFER  v2.0   |XXXXXXXXXX|" at (0,0).
      PRINT "|ADD NODE  |          |          |          |          |          |EXIT      |" at (0,18).
      wait 0.001.
    }
  clearscreen.
  }
  xferplanmain().
  bakeros().
}  
  
function bakerVTOL
{

	clearscreen.
	parameter maxTick is 2000, maxIPU is 2000.
	set maxcost to .05.
	set oldIPU to config:ipu.
	print("Boosting IPU to " + maxIPU).
	set config:ipu to maxIPU.
	set SHIP:control:pilotmainthrottle to 0.
	set VTOLs to SHIP:partsdubbed("vtol").

	for vtol in vtols { vtol:activate(). }

	function get_CoT {
		set CoT to V(0, 0, 0).

		for vtol in vtols {
			set pos to vtol:position.
			set relitive to pos - V(0, 0, 0).
			set CoT to CoT + relitive * (vtol:availablethrust / SHIP:availablethrust).
		}
		return CoT.
	}

	lock costv to vang(-1*vxcl(V(0, 0, 0), get_CoT()), up:forevector).
	set lastCost to 1000.
	set down to (UP + R(180, 0, 0)):forevector.
	set down:mag to 10.
	set vd0 to vecdraw().
	set vd0:start to V(0, 0, 0).
	set vd0:vec to down.
	set vd0:color to red.
	set vd0:show to true.
	set vd to vecdraw().
	set vd:start to get_CoT().
	set vd:vec to down.
	set vd:show to true.
	set loop to true.
	set tick to 0.

	function raiseTL {
		parameter engine.
		set oldLimit to engine:thrustlimit.
		set lastCost to costv.
		set engine:thrustlimit to min(oldLimit + (.01), 100).
		print costv at(0, 1).
		set vd:start to get_CoT().
		if lastCost > costv {
			return true.
		} else {
			set engine:thrustlimit to oldLimit.
			return false.
		}
	}

	function lowerTL {
		parameter engine.
		set oldLimit to engine:thrustlimit.
		set lastCost to costv.
		set engine:thrustlimit to max(oldLimit - (.01), 0).
		print costv at(0, 1).
		set vd:start to get_CoT().
		if lastCost > costv {
			return true.
		} else {
			set engine:thrustlimit to oldLimit.
			return false.
		}
	}

	until not loop {
		
		if costv < maxcost {
			print("CoT aligned with CoM").
			clearvecdraws().
      wait 1.
			set loop to false.
		} else if tick > maxTick {
			print("Unable to align CoT with CoM after " + maxTick + " cycles").
      wait 1.
			print("Rerun the command with a higher max cylce").
      wait 1.
			set loop to false.
		} else {
			set tick to tick + 1.
			for vtol in vtols {
				if vtol:thrustlimit < .5 {
					until not raiseTL(vtol) {}
					until not lowerTL(vtol) {}
				} else {
					until not lowerTL(vtol) {}
					until not raiseTL(vtol) {}
				}
			}
		}
	}

	print("Reseting IPU to " + oldIPU).
	set config:ipu to oldIPU.
  wait 1.
  print "Exiting Vulkan VTOL...".
  wait 1.
  bakeros().
}	
	
function bakerhover
{
    //Initialize local variables
  local helpText to "     -Press KP+/- buttons to change value of proportional gain, press KD+/- buttons to change value of derivative gain (Default 0.1 works well for most cases), when at desired altitude, kill as much horizontal and vertical speed as possible and press TGGL HOVER button to begin hover, while hovering press ALTITUDE+/- buttons to adjust hover altitude in 10m increments, press TGGL HOVER button again to stop hover-     ".
  local stringStep to 0.
  local stringMin to 0.
  local stringMax to 0.
  local stringTime to 0.
  local scrollTime to 0.1.
  local toggleHelp to 0.
  local isDone to 0.
  local hasStarted to 0.
  local Kp to 0.1.
  local Kd to 0.1.
  local goal_altitude to 0.
  local t2 TO TIME:SECONDS.

  //Function to scroll help text
  function textScroller 
  {
    parameter row.
    if not toggleHelp 
    {
      print " ":padright(79) AT (0,row).
    } 
    else 
    {
      local stringSize to helpText:length.
      local adjustedString to helpText:substring(0 + stringStep,78).
      print adjustedString AT (1,row).
      if stringStep + 78 = stringSize 
      {
        set scrollTime to 3.
        set stringStep to 0.
      } 
      else 
      {
        set scrollTime to 0.1.
        set stringStep to stringStep + 1.
      }
      set stringTime TO TIME:SECONDS.
    }
  }

  function startProgram
  {
    LIST ENGINES IN all_engines.
    if all_engines:LENGTH = 0 
    {
      CLEARSCREEN.
      PRINT "NO ENGINES FOUND, EXITING".
      return.
    }

    function button0 
    {
      if SHIP:STATUS = "LANDED" OR SHIP:STATUS = "PRELAUNCH" 
      {
        PRINT " - CAN'T HOVER, LANDED - " AT (6,6).
        SET t2 TO TIME:SECONDS.
      } 
      else 
      {
        set hasStarted to 1.
        SET V0 TO GetVoice(0).
        V0:PLAY( NOTE( 2440, 0.01) ).
      }
    }
    buttons:setdelegate(0,button0@).

    function button0_1 
    {
      set hasStarted to 0.
      SET V0 TO GetVoice(0).
      V0:PLAY( NOTE( 440, 0.01) ).
      buttons:setdelegate(1,button1@).
      buttons:setdelegate(2,button2@).
      CLEARSCREEN.
      UNLOCK THROTTLE.
    }

    function button1 
    {
    }

    function button1_1 
    {
      set goal_altitude to goal_altitude + 10.
    }

    buttons:setdelegate(1,button1@).
    
    function button2 
    {
    }

    function button2_1 
    {
      set goal_altitude to goal_altitude - 10.
    }

    buttons:setdelegate(2,button2@).

    function button3 
    {
    }

    buttons:setdelegate(3,button3@).

    function button4 
    {
    }

    buttons:setdelegate(4,button4@).

    function button5 
    {
    }

    buttons:setdelegate(5,button5@).

    function button7 
    {
      set Kp to Kp + 0.05.
    }

    buttons:setdelegate(7,button7@).
    
    function button8 
    {
      set Kp to Kp - 0.05.
    }

    buttons:setdelegate(8,button8@).
    
    function button9 
    {
      set Kd to Kd + 0.05.
    }

    buttons:setdelegate(9,button9@).
    
    function button10 
    {
      set Kd to Kd - 0.05.
    }

    buttons:setdelegate(10,button10@).
    
    function button11 
    {
    }

    buttons:setdelegate(11,button11@).
    
    function button12 
    {
      if toggleHelp = 0 
      {
        set toggleHelp to 1.
      } 
      else 
      {
        set toggleHelp to 0.
      }
    }

    buttons:setdelegate(12,button12@).
    
    function button13 
    {
      set hasStarted to 0.
      SET V0 TO GetVoice(0).
      V0:PLAY( NOTE( 440, 0.01) ).
      buttons:setdelegate(1,button1@).
      buttons:setdelegate(2,button2@).
      CLEARSCREEN.
      SET isDone to 1.
      UNLOCK THROTTLE.
      return.
    }

    buttons:setdelegate(13,button13@).

    CLEARSCREEN.

    until isDone > 0 
    {
      if TIME:SECONDS - t2 > 2 
      {
        PRINT "                                        " AT (0,6).
        SET t2 TO TIME:SECONDS.
      }

      set goal_altitude to SHIP:ALTITUDE.
      if terminal:input:haschar 
      {
        set ch to terminal:input:getchar().
      }

      PRINT "TGGL HOVER|          |          |    VULCAN HOVER     |          |XXXXXXXXXX|" at (0,0).
      PRINT "|KP+       |KP-       |KD+       |KD-       |          |HELP      |EXIT      |" at (0,20).
      PRINT "Kp = " + Kp + "     " AT (0,1).
      PRINT "Kd = " + Kd + "     " AT (0,2).
      PRINT "SET ALT = " + round(goal_altitude,1) + "     " AT (0,3).
      PRINT "VSPD: " + ROUND(SHIP:VERTICALSPEED, 5) + "m/s     " AT (0,4).
      PRINT "HSPD: " + ROUND(SHIP:GROUNDSPEED, 5) + "m/s     " AT (0,5).

      IF TIME:SECONDS - stringTime > scrollTime 
      {
        textScroller(17).
      }

      buttons:setdelegate(0,button0@).

      if hasStarted > 0 
      {
        SET t0 TO TIME:SECONDS.
        SET t1 TO TIME:SECONDS.
        SET start_time TO t0.
        SET thrott TO 1.
        SET dthrott TO 0.
        SET dthrott_p TO 0.
        SET dthrott_d TO 0.
        SET g TO KERBIN:MU / KERBIN:RADIUS^2.
        LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
        LOCK gforce TO accvec:MAG / g.
        LOCK hover_throttle_level TO MIN(1, MAX(0, SHIP:MASS * g / MAX(0.0001, curr_engine:AVAILABLETHRUST))).
        SET curr_engine TO all_engines[0].
        curr_engine:ACTIVATE().
        LOCK dthrott_p TO Kp * (goal_altitude - SHIP:ALTITUDE).
        LOCK dthrott_d TO Kd * (0 - SHIP:VERTICALSPEED).
        LOCK dthrott TO dthrott_p + dthrott_d.
        LOCK THROTTLE TO thrott.
        buttons:setdelegate(0,button0_1@).
        buttons:setdelegate(1,button1_1@).
        buttons:setdelegate(2,button2_1@).
        PRINT "TGGL HOVER|ALTITUDE+ |ALTITUDE- |  BAKER HOVER v2.0   |          |XXXXXXXXXX|" at (0,0).
        PRINT "|KP+       |KP-       |KD+       |KD-       |          |          |EXIT      |" at (0,20).
        PRINT " ":padright(79) AT (0,17).
        set toggleHelp to 0.

        UNTIL hasStarted < 1 
        {
          SET dt TO TIME:SECONDS - t0.
          SET dt1 TO TIME:SECONDS - t1.

          IF dt > 0 
          {
            SET thrott to min(1, max(hover_throttle_level + dthrott,0.05)).
            SET t0 TO TIME:SECONDS.
          }

          IF TIME:SECONDS - t1 > 0.5 
          {
            PRINT "Kp = " + Kp + "     " AT (0,1).
            PRINT "Kd = " + Kd + "     " AT (0,2).
            PRINT "SET ALT = " + round(goal_altitude,1) + "     " AT (0,3).
            PRINT "CURRENT ALT = " + round(SHIP:ALTITUDE,1) + "     " AT (0,4).
            PRINT "VSPD: " + ROUND(SHIP:VERTICALSPEED, 5) + "m/s     " AT (0,11).
            PRINT "HSPD: " + ROUND(SHIP:GROUNDSPEED, 5) + "m/s     " AT (0,12).
            PRINT "THRTL: " + ROUND(thrott*100, 1) + "%     " AT (0,13).
            PRINT "DTHRTL: " + ROUND(dthrott*100, 1) + "     "  AT (0,14).
            SET t1 TO TIME:SECONDS.
          }
          wait 0.001.
        }
      }
      WAIT 0.001.
    }
  CLEARSCREEN.
  }
  startProgram().
  bakeros().
}
  
function bakertarget2
{
    function settargetmain 
    {
    CLEARSCREEN.
    set cursorPosition to 0.
    set currentPage to 0.
    LOCAL totalItems is 12.
    SET isDone to 0.
    
    function selectTarget{
      SET target to targetList[currentPage * totalItems + cursorPosition].
    }
    
    function button0 {
      if cursorPosition > 0 {
      set cursorPosition to cursorPosition - 1.
      }
    }
    buttons:setdelegate(-3,button0@).
    
    function button1 {
      if cursorPosition < currentPageList:LENGTH - 1 {
      set cursorPosition to cursorPosition + 1.
      }
    }
    buttons:setdelegate(-4,button1@).
    
    function button2 {
      if currentPage < maxPages - 1 {
      SET currentPage to currentPage + 1.
      SET cursorPosition to 0.
      }
    }
    buttons:setdelegate(-6,button2@).

    function button3 {
      if currentPage > 0 {
      SET currentPage to currentPage - 1.
      SET cursorPosition to 0.
      }
    }
    buttons:setdelegate(-5,button3@).

    function button4 {
      selectTarget().
    }
    buttons:setdelegate(-1,button4@).

    function button5 {
    }
    buttons:setdelegate(5,button5@).

    function button7 {
    }
    buttons:setdelegate(7,button7@).
    
    function button8 {
    }
    buttons:setdelegate(8,button8@).
    
    function button9 {
    }
    buttons:setdelegate(9,button9@).
    
    function button10 {
    }
    buttons:setdelegate(10,button10@).
    
    function button11 {
    }
    buttons:setdelegate(11,button11@).
    
    function button12 {
    }
    buttons:setdelegate(12,button12@).
    
    function button13 
    {
      SET isDone to 1.
      clearscreen.
    }
    buttons:setdelegate(13,button13@).
    
    UNTIL isDone > 0 
    {
      LOCAL position is 1.
      LIST targets in targetList.
      set maxPages to CEILING(targetList:LENGTH / totalItems).
      SET currentPageList to targetList:SUBLIST(currentPage * totalItems, totalItems).
      SET iterTargetList to currentPageList:ITERATOR.
      set realPage to currentPage + 1.
      
      PRINT "|          |          |          |          |          |          |EXIT      |" at (0,20).
      PRINT "PAGE " + realPage + " OF " + maxPages + "     TARGET SELECTION v2.0"AT (1,0).
      PRINT "--------------------------------------------------------------------------------" AT (0,13).
      PRINT "DIST: " AT (0,14).
      

      UNTIL NOT iterTargetList:NEXT 
      {
        if cursorPosition = iterTargetList:INDEX 
        {
          PRINT ">" AT (0,position).
        } 
        else 
        {
          PRINT " " AT (0,position).
        }

        if hastarget 
        {
          if target = currentPageList[iterTargetList:INDEX] 
          {
          PRINT ">" AT (1,position).
          } 
          else 
          {
          PRINT " " AT (1,position).
          }

        }

        SET strcurrentPageList to currentPageList[position - 1]:NAME + " " + "(" + currentPageList[position - 1]:BODY:NAME + ")".
        PRINT strcurrentPageList:PADRIGHT(20) AT (2,position).
        PRINT targetList[cursorPosition]:DISTANCE AT (7,14).
        set position to position + 1.
        if RealPage = maxPages 
        {
          set cleanLocation to currentPageList:LENGTH + 1.
          set cleanDisplayTotal to totalItems - currentPageList:LENGTH.
          set cleanDisplayCounter to 0.
          UNTIL cleanDisplayCounter = cleanDisplayTotal 
          {
          PRINT "                                        " AT (0,cleanLocation).
          set cleanLocation to cleanLocation + 1.
          set cleanDisplayCounter to cleanDisplayCounter + 1.
          }
        }
      }
      wait 0.001.
    }

    CLEARSCREEN.
    }
    settargetmain().
    bakeros().
    //rendez().
}    

/// Baker 0s ///
function setmonvis
{
  //Initialize local variables
  local isDone to 0.
  local selectedMonitor to 0.
  local ch to "".
  local monitorIndex to -1.
  local totalMonitors to addons:kpm:getmonitorcount() - 1.
  set buttons to addons:kpm:buttons.
  set id to "".

  function selectedMonitor
  {
    parameter index.
    set buttons:currentmonitor to index.
    set id to addons:kpm:getguidshort(index).
  }

  //Main loop
  function setmonvismain
  {
    //Button 3
    function button3 
    {
    }

    buttons:setdelegate(3,button3@).

    //Button 4
    function button4 
    {
    }

    buttons:setdelegate(4,button4@).

    //Button 5
    function button5 
    {
    }

    buttons:setdelegate(5,button5@).

    //Button 7
    function button7 
    {
      print "-MONITOR FOUND-" AT (32,17).
    }

    //buttons:setdelegate(7,button7@).

    //Button 8
    function button8 
    {
    }

    buttons:setdelegate(8,button8@).

    //Button 9
    function button9 
    {
    }

    buttons:setdelegate(9,button9@).

    //Button 10
    function button10 
    {
    }

    buttons:setdelegate(10,button10@).

    //Button 11
    function button11 
    {
    }

    buttons:setdelegate(11,button11@).

    //Button 12
    function button12 
    {
    }

    buttons:setdelegate(12,button12@).

    //Button 13
    function button13 
    {
      set isDone to 1.
    }

    //buttons:setdelegate(13,button13@).

    //UP Button
    function button14 
    {
    }

    buttons:setdelegate(-3,button14@).

    //DOWN Button
    function button15 
    {
    }

    buttons:setdelegate(-4,button15@).

    //LEFT Button
    function button16 
    {
    }

    buttons:setdelegate(-5,button16@).

    //RIGHT Button
    function button17 
    {
    }

    buttons:setdelegate(-6,button17@).

    CLEARSCREEN.

    //Print UI layout
    print "          |          |   SELECT MONITOR    |          |          |XXXXXXXXXX|" at (0,0).
    print "|TEST      |          |          |          |          |          |EXIT      |" at (0,20).
    print "TOTAL MONITORS: " + totalMonitors AT (2,1).
    print "INSTRUCTIONS: PRESS NUMPAD 4/6 TO CHANGE CURRENTLY SELECTED MONITOR, PRESS TEST BUTTON WHILE CYCLING THROUGH EACH MONITOR, WHEN THE CORRECT MONITOR IS SELECTED AND TEST IS PRESSED THEN -MONITOR FOUND- WILL APPEAR AT THE BOTTOM, PRESS EXIT ONCE CORRECT MONITOR IS FOUND" AT (0,5).

    //Sub loop
    UNTIL isDone > 0 
    {
      print "CURRENT MONITOR: " + monitorIndex + "  " AT (2,2).
      print "MONITOR ID: " + id AT (2,3).
      //Numpad listener
      if terminal:input:haschar 
      {
        set ch to terminal:input:getchar().
      }

      if ch = "8" 
      {
        SET ch to "".
      }

      if ch = "2" 
      {
        SET ch to "".
      }

      if ch = "4" 
      {
        if monitorIndex > 0 
        {
          set monitorIndex to monitorIndex - 1.
          selectedMonitor(monitorIndex).
          buttons:setdelegate(7,button7@).
          buttons:setdelegate(13,button13@).
          print "              " AT (32,17).
        }

        SET ch to "".
      }

      if ch = "6" 
      {
        if monitorIndex < totalMonitors 
        {
          set monitorIndex to monitorIndex + 1.
          selectedMonitor(monitorIndex).
          buttons:setdelegate(7,button7@).
          buttons:setdelegate(13,button13@).
          print "              " AT (32,17).
        }

        SET ch to "".
      }

      wait 0.001.
    }
  clearscreen.
  }
  setmonvismain().

}  

function bootscript
{     
  //clearscreen.
  //print "                            Baker BIOS v2.0" at (0,0).
  //print "    ".
  //print "Calibrating Sound Chip...".
  set V0 to GetVoice(0).
  //wait .5.
  //print "Running monitor calibration...".
  //wait .5.
  setmonvis().
  set cursorposition to list(60,2).
}

function bakeros
{
  function printscreenall
  {
    if menu = 1
    {
      printscreen().
    }
    if menu = 2
    {
      printscreen2().
    }
    if menu = 3
    {
      printscreen3().
  
    }
    if menu = 4
    {
      printscreen4().
    }
    if menu = 5
    {
      printscreen5().
    }
    if menu = 6
    {
      printscreen6().
    }
    if menu = 7
    {
      printscreen7().
    }
    if menu = 8
    {
      printscreen8().
    }
    if menu = 9
    {
      printscreen9().
    }
    if menu = 10
    {
      printscreen10().
    }
    if menu > 10
    {
      set menu to 1.
      set sel to 1.
      printscreen().
    }
    if menu < 1
    {
      set menu to 10.
      set sel to 90.
      printscreen10().
    }
  }

  function printscreen
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Main Menu                        |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "              |           |".
    print "|          |     1. Menu 1           2. Menu 2                     |           |".
    print "|          |     3. Menu 3           4. Menu 4                     |           |".
    print "|          |     5. BAKER            6. Menu 6                     |           |".
    print "|          |     7. Menu 7           8. Menu 8                     |           |".
    print "|          |     9. Menu 9             - Next Page >               |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen2
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 1                           |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     10.                  11.                          |           |".
    print "|          |     12.                  13.                          |           |".
    print "|          |     14.                  15.                          |           |".
    print "|          |     16.                  17.                          |           |".
    print "|          |     18.                  19.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen3
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 2                           |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     20.                  21.                          |           |".
    print "|          |     22.                  23.                          |           |".
    print "|          |     24.                  25.                          |           |".
    print "|          |     26.                  27.                          |           |".
    print "|          |     28.                  29.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen4
  {
    clearscreen.
    
    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 3                           |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     30.                  31.                          |           |".
    print "|          |     32.                  33.                          |           |".
    print "|          |     34.                  35.                          |           |".
    print "|          |     36.                  37.                          |           |".
    print "|          |     38.                  39.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen5
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 4                           |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     40.                  41.                          |           |".
    print "|          |     42.                  43.                          |           |".
    print "|          |     44.                  45.                          |           |".
    print "|          |     46.                  47.                          |           |".
    print "|          |     48.                  49.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen6
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                  Bakers Collection                    |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     50. Launch           51. Circle at Periapsis      |           |".
    print "|          |     52. Engine Control   53. Execute Node             |           |".
    print "|          |     54. Science Sensors  55. Ship Systems             |           |".
    print "|          |     56. Resource Transfer57. Circle at Apoapsis       |           |".
    print "|          |     58. Camera Cycler    59.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen7
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                  Bakers Collection                    |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     60.                  61. Timewarp                 |           |".
    print "|          |     62. Target Selector  63. Maneuver Node Control    |           |".
    print "|          |     64. Servo Controler  65. Patch Info               |           |".
    print "|          |     66. Atmo-Autopilot   67. Weapon Systems           |           |".
    print "|          |     68. Planet Transfer  69. Moon Transfer            |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen8
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                  Bakers Collection                    |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     70. VTOL             71. HOVER                    |           |".
    print "|          |     72. Land v2.0        73. Transfer Menu            |           |".
    print "|          |     74. Dock             75. Rover-AutoPilot          |           |".
    print "|          |     76.                  77.                          |           |".
    print "|          |     78.                  79.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen9
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                       GAMES!                          |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     80. BLACKJACK!       85.                          |           |".
    print "|          |     81.                  86.                          |           |".
    print "|          |     82.                  87.                          |           |".
    print "|          |     83.                  88.                          |           |".
    print "|          |     84.                  89.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function printscreen10
  {
    clearscreen.

    print "################################################################################".
    print "|                                                                              |".
    print "|          _________________________________________________________           |".
    print "|          |   BAKER OS v2.0                                 - 0 X |           |".
    print "|          |¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|           |".
    print "|          |                      Menu 9                           |           |".
    print "|          |   ---Enter to Select---                               |           |".
    print "|          |                                        " + sel + "             |           |".
    print "|          |     90.                  95.                          |           |".
    print "|          |     91.                  96.                          |           |".
    print "|          |     92.                  97.                          |           |".
    print "|          |     93.                  98.                          |           |".
    print "|          |     94.                  99.                          |           |".
    print "|          |_______________________________________________________|           |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  function bakergui
  {
    //set sel to 50.
    clearscreen.
    printscreen().
    //set menu to 6.
    set bakerguirun to false.

    until bakerguirun
    {

      function button0 
      {
        set sel to sel - 1.
        printscreenall().
        if sel < 11
        {
          set menu to 1.
        }
      }
      buttons:setdelegate(-4,button0@).
      
      function button1 
      {
        set sel to sel + 1.
        if sel > 99
        {
          set menu to 1.
          set sel to 1.
        }
        if sel > 9
        {
          if menu = 1
          {
            set menu to 2.
          }
        }
        printscreenall().
      }
      buttons:setdelegate(-3,button1@).

      function button2
      {
        set menu to menu + 1.
        if sel < 90
        {
          set sel to sel + 10.
        }
        printscreenall().
      }
      buttons:setdelegate(-6,button2@).

      function button3
      {
        set menu to menu - 1.
        if sel > 20
        {
          set sel to sel - 10.
        }
        if menu < 2
        {
          set sel to 9.
        }
        printscreenall().
      }
      buttons:setdelegate(-5,button3@).

      function button4 
      {
      }
      buttons:setdelegate(-1,button4@).
      
      function button7 
      {
        print "Press BACKSPACE to close folder..." at (15,16).
      }
      buttons:setdelegate(7,button7@).
      
      function button8 
      {
      }
      buttons:setdelegate(8,button8@).
      
      function button16 
      {
      }
      buttons:setdelegate(13,button16@).

      function button13 
      {
      }
      buttons:setdelegate(13,button13@).

      printscreenall().

      until bakerguirun
      {
        if menu < 2
        {
          set menu to 1.
        }
        when menu < 2 then
        {
          set menu to 1.
        }
        if sel < 2
        {
          set sel to 1.
        }
        when sel < 2 then
        {
          set s to 1.
        }

        set ch to terminal:input:getchar().

        if ch = terminal:input:DOWNCURSORONE 
        {
          //V0:PLAY(NOTE(440,0.5)).
          set sel to sel - 1.
          if sel < 10
          {
            set menu to 1.
          }
          set ch to "".
          printscreenall().
        }

        if ch = terminal:input:UPCURSORONE 
        {
          //V0:PLAY(NOTE(440,0.5)).
          set sel to (sel + 1).
          if sel > 9 and sel < 20
          {
            set menu to 2.
          }
          set ch to "".
          printscreenall().
        }

        if ch = terminal:input:enter
        {
          //V0:PLAY(NOTE(440,0.5)).
          set answer to sel.
          set ch to "".
          menuanswer().
        }

        if ch = terminal:input:RIGHTCURSORONE 
        {
          // V0:PLAY(NOTE(440,0.5)).
          set ch to "".
          set menu to menu + 1.
          set sel to sel + 10.
          printscreenall().
        }

        if ch = terminal:input:LEFTCURSORONE 
        {
          set ch to "".
          //V0:PLAY(NOTE(440,0.5)).
          set menu to menu - 1.
          set sel to sel - 10.
          printscreenall().
        }

        if ch = terminal:input:BACKSPACE
        {
          set ch to "".
          desktop().
        }

      }
    }
  }

  function menuanswer
  {
      if answer = 1
      {
        set menu to 2.
        set sel to 10.
        printscreenall().
      }

      if answer = 2
      {
        set menu to 3.
        set sel to 20.
        printscreenall().
      }

      if answer = 3
      {
        set menu to 4.
        set sel to 30.
        printscreenall().
      }

      if answer = 4
      {
        set menu to 5.
        set sel to 40.
        printscreenall().
      }

      if answer = 5
      {
        set menu to 6.
        set sel to 50.
        printscreenall().
      }

      if answer = 6
      {
        set menu to 7.
        set sel to 60.
        printscreenall().
      }

      if answer = 7
      {
        set menu to 8.
        set sel to 70.
        printscreenall().
      }

      if answer = 8
      {
        set menu to 9.
        set sel to 80.
        printscreenall().
      }

      if answer = 9
      {
        set menu to 10.
        set sel to 90.
        printscreenall().
      }

      if answer = 10
      {
        aa().
      }

      if answer = 11
      {
        Ascent().
      }

      if answer = 12
      {
        cyclecam().
      }   
      
      if answer = 13
      {
        editnode().
      }

      if answer = 14
      {
        eject().
      }

      if answer = 15
      {
        execnode().
      }

      if answer = 16
      {
        hover().
      }

      if answer = 17
      {
        man().
      }

      if answer = 18
      {
        patchinfo().
      }

      if answer = 19
      {
        remote_rover().
      }

      if answer = 20
      {
        remote_station().
      }

      if answer = 21
      {
        servo().
      }

      if answer = 22
      {
        setlimit().
      }

      if answer = 23
      {
        setnode().
      }

      if answer = 24
      {
        settarget().
      }

      if answer = 25
      {
        sms().
      }

      if answer = 26
      {
        undock().
      }

      if answer = 27
      {
        vtol().
      }

      if answer = 28
      {
        warptodest().
      }

      if answer = 29
      {
        xferfuel().
      }

      if answer = 30
      {
        xfermoon().
      }

      if answer = 31
      {
        xferplan().
      }

      if answer = 32
      {
        xfersci().
      }

       if answer = 33
      {
        ascent2().
      }

       if answer = 34
      {
        Changeap2().
      }

       if answer = 35
      {
        changeinc2().
      }

       if answer = 36
      {
        changepe2().
      }

       if answer = 37
      {
        circtoap2().
      }

       if answer = 38
      {
        circtope2().
      }

       if answer = 39
      {
        countdown2().
      }

       if answer = 40
      {
        eject2().
      }

       if answer = 41
      {
        exenode2().
      }

       if answer = 42
      {
        progradeintercept().
      }
        if answer = 43
      {
        landing().
      }

      if answer = 50
      {
        Bakerlaunch().
      }

      if answer = 51
      {
        bakercirclepe().
      }

      if answer = 52
      {
        enginecontrol().
      }

      if answer = 53
      {
        bakerexecnode().
      }

      if answer = 54
      {
        bakerscience().
      }

      if answer = 55
      {
        shipsystems().
      }

      if answer = 56
      {
        bakertransfer().
      }

      if answer = 57
      {
        bakercircleap().
      }

      if answer = 58
      {
        bakercam().
      }

      if answer = 59
      {
        bakerremoterover().
      }

      if answer = 60
      {
        bakerremotestation().
      }

      if answer = 61
      {
        bakertimewarp().
      }

      if answer = 62
      {
        bakertarget().
      }
      
      if answer = 63
      {
        bakernode().
      }

      if answer = 64
      {
        bakerservo().

      }
      
      if answer = 65
      {
        bakerpatchinfo().

      }
      if answer = 66
      {
        bakeraa().
      }

      if answer = 67
      {
        bakersms().
      }

      if answer = 68
      {
        bakerplanetplan().
      }

      if answer = 69
      {
        bakermoonplan().
      }

      if answer = 70
      {
        bakerVTOL().
      }

      if answer = 71
      {
        bakerhover().
      }

      if answer = 72
      {
        bakerland().
      }
      if answer = 74
      {
        set fromname to "fromname".
        set toname to "toname".
        bakerdock( fromname , toname ,10,30,10,50,false).
      }

      if answer = 75
      {
        bakerrover().
      }

      if answer = 73
      {
        transfermenu().
      }
      
      if answer = 80
      {
        blackjack().
      }
      
      if answer = 90
      {
        //rendez().?
      }
  
  }

  ///Mainrun
  function mainrun
  {
    //bootscript().
    bakergui().
    menuanswer().
    mainrun().
    //bakergui().
  }

  mainrun().
}

function desktop
{
  set desktoprun to false.

  function print1
  {
    print "################################################################################".
    print "|    _______        _______        _______        _______        _______       |".
    print "|    |_____|        |_____|        |_____|        |_____|        |_____|       |".
    print "|     GAMES          GAMES           20            Baker          Games        |".
    print "|                                                                              |".
    print "|    _______        _______        _______        _______        _______       |".
    print "|    |_____|        |_____|        |_____|        |_____|        |_____|       |".
    print "|     GAMES          GAMES           10             40            Baker        |".
    print "|                                                                              |".
    print "|    _______        _______        _______        _______        _______       |".
    print "|    |_____|        |_____|        |_____|        |_____|        |_____|       |".
    print "|     GAMES          GAMES          Main            30            Baker        |".
    print "|                                                                              |".
    print "|                                                                              |".
    print "|                                                                              |".
    print "|______________________________________________________________________________|".
    print "|  START |                                                           " + time:clock + "  |".
    print "################################################################################".
  }

  local ch to "".
  print1().

  //BUTTONS
  //button 0
  function button0 
  {
    //column 5
    if cursorposition[0] = 75
    {
      if cursorposition[1] = 2
      {
        set sel to 80.
        set menu to 9.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 70.
        set menu to 8.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 60.
        set menu to 7.
        bakeros().
      }

    }

    //column 4
    if cursorposition[0] = 60
    {
      if cursorposition[1] = 2
      {
        set sel to 50.
        set menu to 6.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 40.
        set menu to 5.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 30.
        set menu to 4.
        bakeros().
      }
    }

    //column 3
    if cursorposition[0] = 45
    {
      if cursorposition[1] = 2
      {
        set sel to 20.
        set menu to 3.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 10.
        set menu to 2.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 0.
        set menu to 1.
        bakeros().
      }
    }

    //column 2
    if cursorposition[0] = 30
    {
      if cursorposition[1] = 2
      {
        bakeros().
      }
      if cursorposition[1] = 6
      {
        bakeros().
      }
      if cursorposition[1] = 10
      {
        bakeros().
      }
    }

    //column 2
    if cursorposition[0] = 15
    {
      if cursorposition[1] = 2
      {
        bakeros().
      }
      if cursorposition[1] = 6
      {
        bakeros().
      }
      if cursorposition[1] = 10
      {
        bakeros().
      }
    }

    local ch to "".
    //print "test".
  }
  buttons:setdelegate(0,button0@).

  //button 1
  function button1 
  {
    print "test1".
  }
  buttons:setdelegate(1,button1@).

  //button 2
  function button2 
  {
    print "test2".
  }
  buttons:setdelegate(2,button2@).

  //Button 3
  function button3 
  {
    print "test3".
  }
  buttons:setdelegate(3,button3@).

  //Button 4
  function button4 
  {
    print "test4".
  }
  buttons:setdelegate(4,button4@).

  //Button 5 
  function button5 
  {   
  }
  buttons:setdelegate(5,button5@).

  //Button 6
  function button6 
  {
    print "test6".
  }
  buttons:setdelegate(6,button6@).

  //Button 7 
  function button7 
  {
  print "Press ENTER to open folder..." at (15,16).
  }
  buttons:setdelegate(7,button7@).

  //Button 8 
  function button8 
  {
  }
  buttons:setdelegate(8,button8@).

  //Button 9 
  function button9 
  {
  }
  buttons:setdelegate(9,button9@).

  //Button 10 
  function button10 
  {

  }
  buttons:setdelegate(10,button10@).

  //Button 11
  function button11 
  {
    if playerscore = dealerscore
    {
    print "PUSH!" at (50,3).
    wait 1.
    gameover().
    }
  }
  buttons:setdelegate(11,button11@).

  //Button 12
  function button12 
  {
    print "test12".
  }
  buttons:setdelegate(12,button12@).

  //Button 13 deal
  function button13 
  {
  }
  buttons:setdelegate(13,button13@).

  //enterbutton
  function button19
  {
    //column 5
    if cursorposition[0] = 75
    {
      if cursorposition[1] = 2
      {
        set sel to 80.
        set menu to 9.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 70.
        set menu to 8.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 60.
        set menu to 7.
        bakeros().
      }
    }

    //column 4
    if cursorposition[0] = 60
    {
      if cursorposition[1] = 2
      {
        set sel to 50.
        set menu to 6.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 40.
        set menu to 5.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 30.
        set menu to 4.
        bakeros().
      }
    }

    //column 3
    if cursorposition[0] = 45
    {
      if cursorposition[1] = 2
      {
        set sel to 20.
        set menu to 3.
        bakeros().
      }
      if cursorposition[1] = 6
      {
        set sel to 10.
        set menu to 2.
        bakeros().
      }
      if cursorposition[1] = 10
      {
        set sel to 0.
        set menu to 1.
        bakeros().
      }
    }

    //column 2
    if cursorposition[0] = 30
    {
      if cursorposition[1] = 2
      {
        bakeros().
      }
      if cursorposition[1] = 6
      {
        bakeros().
      }
      if cursorposition[1] = 10
      {
        bakeros().
      }
    }

    //column 2
    if cursorposition[0] = 15
    {
      if cursorposition[1] = 2
      {
        bakeros().
      }
      if cursorposition[1] = 6
      {
        bakeros().
      }
      if cursorposition[1] = 10
      {
        bakeros().
      }
    }
    //print "testenter".
  }
  buttons:setdelegate(-1,button19@).

  //cancelbutton
  function button18
  {
    print "testcancel".
  }
  buttons:setdelegate(-2,button18@).

  //UP Button
  function button14 
  {
    if cursorposition[1] > 5
    {
      print1().
      set cursorposition to list(cursorposition[0],(cursorposition[1] - 4)).  
      print "<" at (cursorposition[0],cursorposition[1]).
    }
  }
  buttons:setdelegate(-3,button14@).

  //DOWN Button
  function button15 
  {
    if cursorposition[1] < 10
    {
      print1().
      set cursorposition to list(cursorposition[0],(cursorposition[1] + 4)). 
      print "<" at (cursorposition[0],cursorposition[1]).
    }
  }
  buttons:setdelegate(-4,button15@).

  //LEFT Button
  function button16 
  {
    if cursorposition[0] > 20
    {
      print1().
      set cursorposition to list((cursorposition[0]-15),cursorposition[1]).  
      print "<" at (cursorposition[0],cursorposition[1]).
    }
  }
  buttons:setdelegate(-5,button16@).

  //RIGHT Button
  function button17 
  {
    if cursorposition[0] < 70
    {
      print1().
      set cursorposition to list((cursorposition[0]+15),cursorposition[1]).  
      print "<" at (cursorposition[0],cursorposition[1]).
    }
  }
  buttons:setdelegate(-6,button17@).

  until desktoprun
  {
    print "<" at (cursorposition[0],cursorposition[1]).
    set ch to terminal:input:getchar().

    if ch = terminal:input:DOWNCURSORONE 
    {     
      print1().
      if cursorposition[1] < 10
      {
      set cursorposition to list(cursorposition[0],(cursorposition[1] + 4)). 
      }    
    }

    if ch = terminal:input:UPCURSORONE 
    {
      print1().
      if cursorposition[1] > 5
      {
      set cursorposition to list(cursorposition[0],(cursorposition[1] - 4)).  
      }      
    }

    if ch = terminal:input:enter
    {
      //column 5
      if cursorposition[0] = 75
      {
        if cursorposition[1] = 2
        {
          set sel to 80.
          set menu to 9.
          bakeros().
        }
        if cursorposition[1] = 6
        {
          set sel to 70.
          set menu to 8.
          bakeros().
        }
        if cursorposition[1] = 10
        {
          set sel to 60.
          set menu to 7.
          bakeros().
        }
      }

      //column 4
      if cursorposition[0] = 60
      {
        if cursorposition[1] = 2
        {
          set sel to 50.
          set menu to 6.
          bakeros().
        }
        if cursorposition[1] = 6
        {
          set sel to 40.
          set menu to 5.
          bakeros().
        }
        if cursorposition[1] = 10
        {
          set sel to 30.
          set menu to 4.
          bakeros().
        }
      }

      //column 3
      if cursorposition[0] = 45
      {
        if cursorposition[1] = 2
        {
          set sel to 20.
          set menu to 3.
          bakeros().
        }
        if cursorposition[1] = 6
        {
          set sel to 10.
          set menu to 2.
          bakeros().
        }
        if cursorposition[1] = 10
        {
          set sel to 0.
          set menu to 1.
          bakeros().
        }
      }

      //column 2
      if cursorposition[0] = 30
      {
        if cursorposition[1] = 2
        {
          bakeros().
        }
        if cursorposition[1] = 6
        {
          bakeros().
        }
        if cursorposition[1] = 10
        {
          bakeros().
        }
      }

      //column 2
      if cursorposition[0] = 15
      {
        if cursorposition[1] = 2
        {
          bakeros().
        }
        if cursorposition[1] = 6
        {
          bakeros().
        }
        if cursorposition[1] = 10
        {
          bakeros().
        }
      }
    }

    if ch = terminal:input:RIGHTCURSORONE 
    {
      print1().
      if cursorposition[0] < 70
      {
        set cursorposition to list((cursorposition[0]+15),cursorposition[1]).  
      }
    }

    if ch = terminal:input:LEFTCURSORONE 
    {
      print1().
      if cursorposition[0] > 20
      {
        set cursorposition to list((cursorposition[0]-15),cursorposition[1]).    
      }
    }
  }
}

function operations
{
  bootscript().
  desktop().
  bakeros().
}

operations().
