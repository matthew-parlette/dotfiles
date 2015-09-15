import time
# Enter script code
# From home sector (in space), pick up colonists
#  at earth and assign them to fuel on planet in
#  nav point 1
#pickup_from_earth = "1\relt\r"
cycles = 17
planet=str(12)
product=str(1)
#transwarp_to_earth = "lcb991\ry"
transwarp_to_earth = "l4\rcb1\ry"
move_to_earth = "1\re"
pickup_from_earth = "lt\r"
drop_at_nav_1 = "n1el"+planet+"\rsnl"+product+"\r\r"
for x in range(0,cycles):
    keyboard.send_keys(transwarp_to_earth)
    keyboard.send_keys(pickup_from_earth)
    keyboard.send_keys(drop_at_nav_1)
    # take off and show status
    keyboard.send_keys("q/")
    time.sleep(3)