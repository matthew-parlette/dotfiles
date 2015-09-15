# Enter script code
# Go back one sector, trade, return to sector, trade
# \r: enter
back_and_trade = "<pt\r\r\r\r"
keyboard.send_keys(back_and_trade)
keyboard.send_keys(back_and_trade)
# end with info screen
keyboard.send_keys("/")