def move_window(name,x,y,width=-1,height=-1,sticky=False,maximized=False):
  if window.wait_for_exist(name):
    window.resize_move(name,xOrigin=x,yOrigin=y,width=width,height=height)
    if sticky:
      window.set_property(name,"add","sticky")
    if maximized:
      window.set_property(name,"add","maximized_vert")
      window.set_property(name,"add","maximized_horz")

def create_and_move(name,command,x,y,width=-1,height=-1,sticky=False,maximized=False):
  #do we need to create the window?
  if not window.wait_for_exist(name,timeOut=2):
    #create the window
    system.exec_command(command,False)
  move_window(name,x,y,width,height,sticky,maximized)

# byobu
"""create_and_move("matt@nova (192.168.1.156) - byobu",
                "/usr/share/applications/byobu.desktop",
                0,
                0,
                sticky=True)"""

# crdb
create_and_move("crdb",
                "/opt/google/chrome/google-chrome --app=http://pegasus:8006",
                1200,
                655,
                width=1300,
                sticky=True)

# tomatoes
create_and_move("Tomatoes",
                "/opt/google/chrome/google-chrome --app=https://tomato.es",
                1650,
                1020,
                sticky=True)

# sound controls
create_and_move("Sound",
                "/usr/bin/gnome-control-center sound",
                1060,
                900,
                sticky=True)

# customer notes
"""create_and_move("Sublime Text 2",
                "/usr/bin/sublime-text --project ~/customers.sublime-project",
                2000,
                900,
                sticky=False)"""

# set tiling
window.activate("Sound")
window.activate("crdb")
window.activate("Tomatoes")

# skype - should already be started
# make sure we are available
#system.exec_command("/usr/bin/skype",False)

# geary
#system.exec_command("/usr/bin/geary",False)