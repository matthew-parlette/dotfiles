import time
# Enter script code
# From home sector (in space), pick up colonists
#  at earth and assign them to fuel on planet in
#  nav point 1
lookup={'ore':1,'org':2,'equ':3}
commodity=str(1)
planet1=12
planet2=15
pickup_from_planet = "l"+str(planet1)+"\rt\rt"+commodity+"\r"
amount = 600
holds = 150
cycles = int(amount / holds)
drop_at_planet = "l"+str(planet2)+"\rt\rl"+commodity+"\r"
for x in range(0,cycles):
    keyboard.send_keys(pickup_from_planet)
    # take off
    keyboard.send_keys("q")
    keyboard.send_keys(drop_at_planet)
    # take off and show status
    keyboard.send_keys("dq/")
    time.sleep(2)