# Enter script code
# Go back one sector, trade, return to sector, trade
# \r: enter
go_and_trade = "ept\r\r\r\r"

sector = "161\r" #BSB
keyboard.send_keys(sector)
go_and_trade = "ept\r\r0\r\r\r"
keyboard.send_keys(go_and_trade)
sector = "338\r" #
keyboard.send_keys(sector)
go_and_trade = "ept\r\r\r\r"
keyboard.send_keys(go_and_trade)
# end with info screen
keyboard.send_keys("/")