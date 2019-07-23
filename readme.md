# Ruby Project Creator


#### By _**Hugh Donkin, Samuel Cook **_

## Description

Creates a new ruby project on your desktop! Modify your .bash_profile to allow the script to run with simple commands.

version 1.2 recreates the file as a hidden file on your desktop to keep it out of the way. All instructions have been modified to set up the program as version 1.2


## Setup/Installation Requirements

* Install Ruby or Ruby on Rails
* Open bash, navigate to your home directory (usually default)
* Open your .bash_profile with a text editor
* Edit .bash_profile in the home directory to run script from terminal
>`alias new_ruby="ruby ~/desktop/.rpc/lib/new_ruby_project.rb"`
###### or
>`alias new_ruby="ruby [YOUR DIRECTORY HOLDING RPC].rpc/lib/new_ruby_project.rb"`
* if you are using windows you will need to change line 2 in rpc/lib/new_ruby_project.rb from `user_name = ENV['USER']` to `user_name = ENV['USERNAME']`
* Edit .bash_profile in the home directory to run start script from terminal
> `alias start="ruby ~/desktop/.rpc/lib/ruby_file_run_shortcut.rb"`
* After modfiying your .bash_profile you will need to close your terminal and open a new one

## Using the Script

Use your terminal command `new_ruby` to start the script. The prompt will ask for your project and file names. New project folder will be created on your desktop.

if you want to run a ruby file with a long file name enter `start` while in the project's root directory. Then based on the file's position in the outputted list, enter a number to run the command `ruby [THE NAME OF YOUR FILE]`. for example `start` [ENTER] `1` [ENTER] would open the first file in your lib directory.


### License

* _open source_

Copyright (c) 2019 **_Candy Van Vending LLC_**
