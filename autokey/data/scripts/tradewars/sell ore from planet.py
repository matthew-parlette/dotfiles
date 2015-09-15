import time
# Enter script code
# From home sector (in space), pick up ore from planet
#  and sell it nearby
planet=str(15)
product=str(2)
pickup_from_planet = "l"+planet+"\rtnt"+product+"\r"
takeoff = "q"
go_to_sector = takeoff+"823\r" #BBS
#go_to_sector = "cb9\ry" #BSB
#go_to_sector = takeoff+"l4\rcb4\ry99\r" #BBB
#go_to_sector = takeoff+"910\re" #SBS
sell_product = "pt\r\r"+"0\r"#+"0\r"
return_to_nav_1 = "n1"+"e"
keyboard.send_keys(pickup_from_planet)
keyboard.send_keys(go_to_sector)
keyboard.send_keys(sell_product)
time.sleep(2)
keyboard.send_keys(return_to_nav_1)

# show status
keyboard.send_keys("/")