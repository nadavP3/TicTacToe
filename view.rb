# As the name of this file suggests, this file contains display related code, such as ASCII art and a display clearing function.

# \e[2J Clears the content on the screen. (by scrolling down to the point the entire terminal is visually).
# \e[H Moves the terminal's text pointer back to the upper left corner.
def reset_screen
  print "\e[2J\e[H"
end

def main_menu
  reset_screen
	puts ""
  puts "	╔╦╗╦╔═╗ ╔╦╗╔═╗╔═╗ ╔╦╗╔═╗╔══"
  puts "	 ║ ║║    ║ ╠═╣║    ║ ║ ║╠══"
  puts "	 ╩ ╩╚═╝  ╩ ╩ ╩╚═╝  ╩ ╚═╝╚══\n\n"
	puts "Would you like to play against another player or against the computer?"
	puts "(enter 'c' for computer or 'p' for player)"
end

def show_fish_tank
  puts ""
  puts "  .______________________________."
  puts "|`.~~  ~~  ~    ~ ~   ~~~     ~|`."
  puts "|~ `.~~ ~  ~~~  ~~~ ~~  ~ ~~~ ~| ~`."
  puts "|   ~`._____________________________`."
  puts "| ~  ~|~  ~~,   ~~~~  ~~ ~ ~ ~ |~ ~  |"
  puts "| ~,  |  <')))><~  ~~  ~~,~  ~ |  ~~ |"
  puts "|<'))X|~ ~~   ~, ~~   <'>>><  ~|~   ~|"
  puts "._____|_____<'}}}x_____________.~ ~~ |"
  puts " `.~  |~ ~~   ~'   ~~~~,  ~  ~~ `.  ~|"
  puts "   `.~|~  ~~ ~~   ~ <'))>< ~~   ~~`.~|"
  puts "     `._____________________________`.\n\n"
  puts "     Something is fishy\n"
end

def show_cake # Inspired by Portal (video game, developed by Valve Corporation).
  puts "\n"
  puts "                     ###"
  puts "                    ## ##"
  puts "                   ##  ##"
  puts "                    ####"
  puts "                      :"
  puts "                     #####"
  puts "                    ######"
  puts "                    ##  ##"
  puts "                    ##  ##"
  puts "                    ##  ##"
  puts "                    ##  ##########"
  puts "                    ##  #############"
  puts "               #######  ###############"
  puts "           #############################"
  puts "     .###################################"
  puts "    #####################################;"
  puts "    ##                                 ##."
  puts "    ##                                 ##"
  puts "    #####################################"
  puts "    ##                                 ##"
  puts "    ##                                 ##"
  puts "    ##                                 ###"
  puts " #####                                 #####"
  puts "### ##################################### ###"
  puts "###  ##                                 ##  ###"
  puts "##   ## ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,, ##   ##"
  puts "##  #####################################  ##"
  puts " ##                                       ##"
  puts "  ####                                 ####"
  puts "    ######                         ######"
  puts "       ###############################\n"
  puts "       This Cake is for you :-)\n\n"
end

def show_dont_panic # Inspired by the covert art of "The Hitchhiker's Guide to the Galaxy" novel (Authors: Douglas Adams, Eoin Colfer).
  puts ""
  puts "                            oooo$$$$$$$$$$$$oooo"
  puts "                        oo$$$$$$$$$$$$$$$$$$$$$$$$o"
  puts "                      oo$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o         o$   $$ o$"
  puts "     o $ oo        o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$o       $$ $$ $$o$"
  puts "    oo $ $ \"$      o$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$o       $$$o$$o$"
  puts "     $$$$$$o$     o$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$o    $$$$$$$$"
  puts "     $$$$$$$    $$$$$$$$$$$      $$$$$$$$$$$      $$$$$$$$$$$$$$$$$$$$$$$"
  puts "      $$$$$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$    $$$$$$$$$$$$$$  \"\"\"$$$"
  puts "      \"$$$\"\"\"\"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     \"$$$"
  puts "      $$$   o$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     \"$$$o"
  puts "     o$$\"   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$       $$$o"
  puts "     $$$    $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\" \"$$$$$$ooooo$$$$o"
  puts "   o$$$oooo$$$$$  $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$   o$$$$$$$$$$$$$$$$$"
  puts "   $$$$$$$$\"$$$$   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     $$$$\"\"\"\"\"\"\"\""
  puts "   \"\"\"\"    $$$$    \"$$$$$$$$$$$$$$$$$$$$$$$$$$$$\"      o$$$"
  puts "           \"$$$o     \"\"\"$$$$$$$$$$$$$$$$$$\"$$\"         $$$"
  puts "             $$$o          \"$$\"\"$$$$$$\"\"\"\"           o$$$"
  puts "              $$$$o                                o$$$\""
  puts "                \"$$$$o                           o$$$$"
  puts "                \"$$$$$oo                      o$$$$\"\""
  puts "                  \"\"$$$$$oooo            $$$$$$$\"\"\""
  puts "                    \"\"$$$$$$$oo       $$$$$$$$$"
  puts "                              \"\"\"\"$$$$$$$\n\n"
end
