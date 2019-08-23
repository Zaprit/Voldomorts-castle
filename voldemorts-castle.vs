#!/bin/bash
APP_NAME="voldemorts-castle"
APP_FUZZY_NAME="The castle of voldemort"
APP_VERSION=1.0

#Pregenerated code ahead. Here be dragons?
VS_VERSION=1.0
VS_CODENAME="Cinnamon"

#Pregenerated code ahead. Here be dragons?
if [ "$1" == "-h" ]
then
  echo "VScript Version $VS_VERSION $VS_CODENAME"
fi
dump(){
echo "Crash Dump"
echo "VScript Version: $VS_VERSION $VS_CODENAME"
echo "Loaded Libraries:"
for lib in $loadedLibs
do
echo -ne $lib
done

echo
echo "Loaded Modules:"
for mod in $loadedMods
do
echo -ne $mod
done

echo
echo "Variables:"
for var in $vars
do
echo -ne $var
done

echo
echo -e "\nApp metadata:"
echo "  App name: $APP_NAME"
echo "  App display name: $APP_FUZZY_NAME"
echo "  App version: $APP_VERSION"
}
throw(){
echo "ERROR: $1 in program $APP_NAME"
echo "Error Detected... Dumping program data"
dump
exit 1
}
var(){
vars="$vars\n$1"
eval "$1"
}
loadedLibs="$loadedLibs\ncore V1.0: VScript Core Module"

# end of library core 

loadedLibs="$loadedLibs\nfile V1.0: VScript File IO Library"

# end of library file 

loadedLibs="$loadedLibs\nzip V1.0: VScript Compression Library"

# end of library zip 

begin1(){
  clear
  room=1
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room1" >> "$SAVELOC"

  #tell user about story
  echo "Voldemort's dungeon"
  echo "You've been thrown in through the roof."
  echo ""
  echo "You see three doors."
  echo ""
  echo "Which Way:"
  echo "1) NE"
  echo "2) SE"
  echo "3) SW"

  # Get user input
  read d

  case "$d" in

    1)
      room2
      ;;
    2)
      room7
      ;;
    3)
      room3
      ;;
    *)
      echo "not an option"
      room1
  esac
}
dead(){

  echo "YOU DIED..."
  sleep 0.5s
  echo "Idiot"
  ./voldemorts-castle.vs


}
endscreen(){
clear
echo "You win"
echo "after defeating a dumbass with a wand you finally leave the dungeon"
rm $SAVELOC
exit
}
main(){
SAVELOC="$HOME/.voldomorts_castle.sav"

#Have we found the door?
TRBF="0"

#Do we have the key?
CRBF="0"

clear
echo "Henry and Imogen present:"
sleep 0.75s

echo "A Flaming Cheese game"
sleep 1s
echo ""
echo 'Voldomorts Castle'
sleep 0.5s
echo "What do you want to do:"
echo "1) New Game"
if [ -e "$SAVELOC" ]
then
  echo "2) Load Game"
  echo "3) Quit"
else
  echo "2) Quit"
fi
read opt
case $opt in

  1)
    clear
    begin1
    ;;
  2)
    if [ -e "$SAVELOC" ]
    then
      clear
      source "$SAVELOC"
    else
      exit
    fi
    ;;
  3)
    if [ -e "$SAVELOC" ]; then
      exit 0
    else
      echo "please choose valid option"
    fi
esac
}
room1(){
  clear
  room=1
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room1" >> "$SAVELOC"

  #tell user about story
  echo "Voldemort's dungeon"
  echo "You came in through the roof, I wonder why they did not use the number of doors."
  echo ""
  echo "You see three doors."
  echo ""
  echo "Which Way:"
  echo "1) NE"
  echo "2) SE"
  echo "3) SW"

  # Get user input
  read d

  case "$d" in

    1)
      room2
      ;;
    2)
      room7
      ;;
    3)
      room3
      ;;
    *)
      echo "not an option"
      room1
  esac
}
room2(){
  clear
  room=2
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room2" >> "$SAVELOC"

  #tell user about story
  echo "Cells:"
  echo "You walk into a room full of prison cells"
  echo "Each one has a rotten skeleton in it."
  echo ""
  echo "Towards North-West there are more cells"
  echo "Towards North you see a room that you hear heavy breathing from"
  echo "Towards West you see a room that looks like wardens quarters"
  echo "South is towards the room you were thrown into"
  echo "Which Way:"
  echo "1) N"
  echo "2) NW"
  echo "3) W"
  echo "4) S"

  #get user input
  read d

  case "$d" in

    1)
      room6
      ;;
    2)
      room5
      ;;
    3)
      room4
      ;;
    4)
      room1
      ;;
    *)
      echo "not an option"
      room2
  esac
}
room3(){
  clear
  room=3
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room3" > "$SAVELOC"

  #tell user about story
  echo "Bizzare Room"
  echo ""
  echo "You see what looks like a dead body"
  echo "When you walk in it sits bolt upright and says \"It is dangerous to go alone, look at my flaming cheese\""
  echo "at which point a cheese wheel bursts into flame"
  echo "the room is full of the smell of swiss, no chedder, no gruyère."
  echo ""
  echo "Where too"
  echo "1) NE"

  # Get user input
  read d

  case "$d" in

    1)
      room1
      ;;
    *)
      echo "not an option"
      room3
  esac
}
room4(){
  clear
  room=4
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room4" >> "$SAVELOC"

  #tell user about story
  echo "Wardens quarters"
  echo "there is an allmost unrecongnisable mouldy cheese sandwich, curious you take a small bite of the cheese"
  sleep 2s
  echo "it is the most tasty cheese sandwich you have ever tasted even though it is mouldy all the way through"
  echo ""
  echo "Which Way:"
  echo "1) N"
  echo "2) E"

  #get user input
  read d

  case "$d" in

    1)
      room5
      ;;
    2)
      room2
      ;;
    *)
      echo "not an option"
      room4
  esac
}
room5(){
  clear
  room=5
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room5" >> "$SAVELOC"

  #tell user about story
  echo "(More) Cells"
  echo "More cells... what more can I say"

  echo ""
  echo "Which Way:"
  echo "1) E"
  echo "2) S"
  echo "3) SW"

  #get user input
  read d

  case "$d" in

    1)
      room6
      ;;
    2)
      room4
      ;;
    3)
      room2
      ;;
    *)
      echo "not an option"
      room5
  esac
}
room6(){
  clear
  room=6
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room6" >> "$SAVELOC"
  
  if [ "$CRBF" != "1" ]
  then
  #tell user about story
  echo "In this room you see a sleeping dragon"
  echo "at the other side of the room you see a set of keys, however its tail is in the way"
  echo "Do you?"
  echo "1) Jump over the tail"
  echo "2) Go back"
  echo "3) Climb over like a NOOB"

  #get user input
  read d

  case "$d" in

    1)
      clear
      echo "you trip over the tail and the dragon wakes... Do you?"
      echo "1) run, get the keys and then get the hell out of here"
      echo "2) stroke the dragon's tail and try to befrend it"
      echo "3) embrace your enevitable DOOM™"
      read c
      case "$c" in
        1)
        echo "You are torched alive by dragon flame, if you were dovahkiin then maybe you would of survived."
        sleep 2s
        dead
        return
        ;;
        2)
        echo "it starts purring loudly and slowly goes back to sleep, now resting you go and get the keys, then leave"
        CRBF="1"
        sleep 3s
        room2
        ;;
        3)
        echo "You didn't even try... Uncool"
        sleep 2s
        dead
        return
        ;;
      esac
      ;;
    2)
    room2
    ;;
    3)

      clear
      echo "you writhing over the tail wakes the dragon... Do you?"
      echo "1) run, get the keys and then get the hell out of here"
      echo "2) stroke the dragon's tail and try to befrend it"
      echo "3) embrace your enevitable DOOM™"
      read c
      case "$c" in
        1)
        echo "You are torched alive by dragon flame, if you were dovahkiin then maybe you would of survived."
        sleep 2s
        dead
        return
        ;;
        2)
        echo "it starts purring loudly and slowly goes back to sleep, now resting you go and get the keys and leave"
        CRBF="1"
        sleep 3s
        room2

        ;;
        3)
        echo "You didn't even try... Uncool"
        sleep 2s
        dead
        return
        ;;
      esac
      ;;


    *)
      echo "not an option"
  esac
else
  echo "the dragon lifts one eyelid and smiles at you and says \"CHEESE\""
  echo "Do you?"
  echo "1) leave"
  read d
  if [ "$d" == "1" ]
  then
    room2
  else
    echo "not an option"
    room6
  fi
fi
}
room7(){
  clear
  room=7
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room7" > "$SAVELOC"

  #tell user about story
  echo "Hall"
  echo "You walk through a hall full of dead bodies"
  echo "the walls are stained with dry bood."
  echo "the blood gets wetter as you go along"
  echo ""
  echo "Do you?"
  echo "1) Continue onwards"
  echo "2) Go back"

  #get user input
  read d

  case "$d" in

    1)
      room8
      ;;
    2)
      room1
      ;;
    *)
      echo "not an option"
      room7
  esac
}
room8(){
  clear
  room=8
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room8" > "$SAVELOC"

  #tell user about story
  echo "Further down the hall"
  echo "You can hear the spell crucio screaming"
  echo "and pleading for life"
  echo ""
  echo "Do you?"
  echo "1) Continue onwards"
  echo "2) Go back"

  #get user input
  read d

  case "$d" in

    1)
      room9
      ;;
    2)
      room7
      ;;
    *)
      echo "not an option"
      room8
  esac
}
room9(){
  clear
  room=9
  #save the game
  echo "CRBF=$CRBF" > "$SAVELOC"
  echo "TRBF=$TRBF" >> "$SAVELOC"
  echo "room9" > "$SAVELOC"

  #tell user about story
  echo "Torture Chamber"
  if [ "$TRBF" == "0" ]
  then
  echo "You reach the room with piles of bodies everywhere and a putrid smell."
  sleep 2s
  echo "In the center of the room you see a man with blood stained armour"
  sleep 2s
  echo "He raises his wand"
  echo "and kills one of the slaves that he was torturing"
  sleep 2s
  echo "you tackle him and pin him to the ground drawing your wand you shout..."
  echo ""
  sleep 2s
  echo "we interupt this epic fight scene for a word from our sponser"
  echo "malodourant cheeses"
  echo "for when you need a cheese that smells like butt"
  echo "..."
  echo ""
  echo "Previously on stopping a guy:"
  echo "BRACHIABINDO then you take the spare blindfolds and put them on his face"
  echo "After this you can see a door with light radieating around it"
  TRBF="1"
  room9
else

  echo "You see the door again..."

fi

  if [ "$CRBF" == "1" ]; then

    echo "What now"
    echo "1) unlock door with key from cells"
    echo "2) go back"
    read c
    case "$c" in
      1)
      echo "as you put the key in the door it clicks and as you turn the key"
      sleep 1s
      endscreen
      ;;
      2)
      room8
      ;;
      *)
      echo "not an option"
      room9
    esac


  else

    echo "You do not have the key and the door is locked"
    echo "What now?"
    echo "1) Go back"
    read c
    if [ "$c" == "1" ]
    then
      room8
    else
      echo "not an option"
      room9
    fi
  fi



  #get user input
  read d

  case "$d" in

    1)
      room8
      ;;
    2)
      room1
      ;;
    *)
      echo "not an option"
  esac
}
if [ "$1" != "--getdata" ]
then
main $@
fi
