#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         John Lucas

 Script Function:
	Generate an easy to remember password with high(ish) entropy

#ce ----------------------------------------------------------------------------



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      ___   _   _    ____   _       _   _   ____    _____   ____
;     |_ _| | \ | |  / ___| | |     | | | | |  _ \  | ____| / ___|
;      | |  |  \| | | |     | |     | | | | | | | | |  _|   \___ \
;      | |  | |\  | | |___  | |___  | |_| | | |_| | | |___   ___) |
;     |___| |_| \_|  \____| |_____|  \___/  |____/  |_____| |____/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Script Start - Add your code below here
#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <FileConstants.au3>
#include <Date.au3>
#include <Array.au3>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      _____   _   _   _   _    ____   _____   ___    ___    _   _   ____
;     |  ___| | | | | | \ | |  / ___| |_   _| |_ _|  / _ \  | \ | | / ___|
;     | |_    | | | | |  \| | | |       | |    | |  | | | | |  \| | \___ \
;     |  _|   | |_| | | |\  | | |___    | |    | |  | |_| | | |\  |  ___) |
;     |_|      \___/  |_| \_|  \____|   |_|   |___|  \___/  |_| \_| |____/
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Func _IHPLgetRandomAnimal()
   ; Note, to convert a list with one word on each line to the array format needed, do this in linux:
   ; create file with list:  animals.txt
   ; This one creates double quotes, we don't want that:   cat animals.txt | sed 's/^\|$/"/g'|paste -sd, -
   ; This is what is needed with single quotes:   cat animals.txt | sed "s/^\|$/\'/g"|paste -sd, -
   ; Count number in array with    wc -l animals.txt

   ;;;testing
   ;Local $Array[5] = ['Aardvark', 'Albatross', 'Alligator', 'Alpaca', 'Angelfish']

   Local $Array[253] = ['Aardvark','Albatross','Alligator','Alpaca','Angelfish','Ant','Anteater','Antelope','Ape','Armadillo','Baboon','Badger','Bandicoot','Barb','Barnacle','Barracuda','Bat','Beagle','Bear','Beaver','Bee','Beetle','Bird','Bison','Bloodhound','Boar','Bobcat','Bombay','Bongo','Bonobo','Booby','Buffalo','Bulldog','Bullfrog','Butterfly','Camel','Cat','Caterpillar','Catfish','Cattle','Cheetah','Chicken','Chipmunk','Cichlid','Clam','Cobra','Cockroach','Cod','Collie','Coral','Cormorant','Cougar','Cow','Coyote','Crab','Crane','Crocodile','Crow','Cuttlefish','Dachshund','Dalmatian','Deer','Dhole','Dingo','Dog','Dogfish','Dolphin','Donkey','Dove','Duck','Eagle','Earwig','Eel','Elephant','Elk','Emu','Falcon','Ferret','Finch','Fish','Fly','Fox','Frog','Panda','Gibbon','Giraffe','Goat','Goldfinch','Goldfish','Goose','Gopher','Gorilla','Grasshopper','Greyhound','Guppy','Hamster','Hare','Harrier','Hawk','Hedgehog','Heron','Herring','Hippopotamus','Hornet','Horse','Human','Hummingbird','Hyena','Iguana','Impala','Insect','Jackal','Jaguar','Jay','Jellyfish','Kangaroo','Kingfisher','Kiwi','Koala','Ladybird','Lapwing','Lark','Lemming','Lemur','Leopard','Liger','Lion','Lionfish','Lizard','Llama','Lobster','Locust','Louse','Lynx','Lyrebird','Macaw','Magpie','Mallard','Mayfly','Meerkat','Millipede','Mink','Mole','Molly','Mongoose','Mongrel','Monkey','Moose','Mosquito','Moth','Mouse','Mule','Newt','Nightingale','Ocelot','Octopus','Opossum','Ostrich','Otter','Owl','Ox','Oyster','Panther','Parrot','Partridge','Peacock','Peafowl','Pelican','Penguin','Persian','Pheasant','Pig','Pike','Piranha','Platypus','Pony','Poodle','Porcupine','Porpoise','Possum','Prawn','Puffin','Pug','Puma','Quail','Rabbit','Raccoon','Rail','Ram','Rat','Rattlesnake','Raven','Reindeer','Rhinoceros','Robin','Rook','Rottweiler','Salamander','Salmon','SandDollar','Sandpiper','Sardine','Scorpion','Seahorse','Seal','Shark','Sheep','Shrew','Shrimp','Skunk','Sloth','Snail','Snake','Snowshoe','Somali','Sparrow','Spider','Sponge','Squid','Squirrel','Starfish','Starling','Stingray','Stinkbug','Stork','Swallow','Swan','Tang','Termite','Tetra','Tiger','Toad','Tortoise','Toucan','Trout','Turkey','Turtle','Viper','Vulture','Wallaby','Walrus','Warthog','Wasp','Weasel','Whale','Wolf','Wombat','Woodpecker','Worm','Wren','Yak','Zebra','Zonkey']

   Local $sAnimal
   ;Local $Index = Random(0, UBound($Array), 1)
   Local $Index = Random(1, UBound($Array), 1)
   $Index = ($Index - 1)

   ;$sAnimal = "Monkey"
   $sAnimal = $Array[$Index]

   Return $sAnimal
EndFunc

;;;;;;;;;;;;;;;;;;;;;

Func _IHPLgetRandomColor()

   Local $Array[15] = ['Red', 'Orange', 'Yellow', 'Green', 'Cyan', 'Blue', 'Indigo', 'Violet', 'Purple', 'Magenta', 'Pink', 'Brown', 'White', 'Gray', 'Black']
   Local $sColor
   ;Local $Index = Random(0, UBound($Array), 1)
   Local $Index = Random(1, UBound($Array), 1)
   $Index = ($Index - 1)
   ;$sAnimal = "Monkey"
   ;$sColor = $Array[$Index - 1]
   $sColor = $Array[$Index]

   Return $sColor
EndFunc

;;;;;;;;;;;;;;;;;;;;;

Func _IHPLgetNumSymbol()

   Local $Array[3] = ['{#}', '{$}', '']
   Local $sNumSymbol
   ;Local $Index = Random(0, UBound($Array), 1)
   Local $Index = Random(0, 2, 1)
      ;$sColor = $Array[$Index - 1]
   $sNumSymbol = $Array[$Index]

   Return $sNumSymbol
EndFunc

;;;;;;;;;;;;;;;;;;;;;

Func _IHPLgetNumber()
   ;return one number between 0 and 9
   Local $Index = Random(0, 9, 1)

   Return $Index
EndFunc

;;;;;;;;;;;;;;;;;;;;;

Func _IHPLgetPunctuation()

   Local $Array[3] = ['{!}', '.', '?']
   Local $sPunctuation
   Local $Index = Random(1, UBound($Array), 1)
   $Index = ($Index - 1)
;MsgBox($MB_SYSTEMMODAL, "", $Index)

   $sPunctuation = $Array[$Index]

   Return $sPunctuation
EndFunc

;;;;;;;;;;;;;;;;;;;;;


Func _IHPLgetRandomPassword()
   Local $sPassword

   ;$sPassword =  ( _IHPLgetNumber() & _IHPLgetRandomColor() & _IHPLgetRandomAnimal() & _IHPLgetPunctuation() )
   $sPassword =  ( _IHPLgetNumSymbol() & _IHPLgetNumber() & _IHPLgetRandomColor() & _IHPLgetRandomAnimal() & _IHPLgetPunctuation() )


   Return $sPassword
EndFunc


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;      __  __      _      ___   _   _
;     |  \/  |    / \    |_ _| | \ | |
;     | |\/| |   / _ \    | |  |  \| |
;     | |  | |  / ___ \   | |  | |\  |
;     |_|  |_| /_/   \_\ |___| |_| \_|
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ----------------
; Globals
; ----------------

Global $gListOfStuff = ""
Global $gIHPTmpPass = ""

$gIHPTmpPass &= @CRLF & @CRLF & "Suggested pseudo-secure somewhat random passwords:"
$gIHPTmpPass &= @CRLF & @CRLF


For $i = 1 To 19 Step 1
  $gIHPTmpPass &= ( _IHPLgetRandomPassword() )
  $gIHPTmpPass &= ( @CRLF )
Next


;MsgBox($MB_SYSTEMMODAL, "Random Passwords", "Suggested passwords are: " & @CRLF & $gIHPtmpPass & @CRLF)

Run("notepad.exe")
WinWaitActive("Untitled - Notepad")
Send($gIHPTmpPass)

;WinClose("Untitled - Notepad")
;WinWaitActive("Notepad", "Save")
;WinWaitActive("Notepad", "Do you want to save") ; When running under Windows XP
;Send("!n")


