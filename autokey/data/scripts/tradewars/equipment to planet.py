# Enter script code
# From home sector (in space), pick up equipment from
#  a sector and drop it at planet

get_equipment = "270\rept0\r\r\r"
return_to_nav_1 = "n1e"
drop_at_planet = "ltnl3\r\rq"
keyboard.send_keys(get_equipment)
keyboard.send_keys(return_to_nav_1)
keyboard.send_keys(drop_at_planet)

# show status
keyboard.send_keys("/")