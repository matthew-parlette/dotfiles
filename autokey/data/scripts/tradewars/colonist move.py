import time
# Enter script code
# From home sector (in space), pick up colonists
#  at earth and assign them to fuel on planet in
#  nav point 1
lookup={'ore':1,'org':2,'equ':3}
planet1=4
planet2=12
pickup_from_planet1 = "l"+str(planet1)+"\rs\rt"+str(lookup['ore'])+"\r"
cycles = 900 / 150
drop_at_planet2 = "l"+str(planet2)+"\rs\rl"+str(lookup['ore'])+"\r"
for x in range(0,cycles):
    keyboard.send_keys(pickup_from_planet1)
    # take off
    keyboard.send_keys("q")
    keyboard.send_keys(drop_at_planet2)
    # take off and show status
    keyboard.send_keys("dq/")
    time.sleep(3)