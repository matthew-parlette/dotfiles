"Friends/friendgameinvitedialog.res"
{
	styles {
		FriendsPanel {
			bgcolor=A2.Background
			render_bg {
				3="fill( x0, y1 - 54, x1, y1, A2.Ribbon )"
			}
		}

		RootMenu {
			bgcolor=none
		}


		FriendsTitle {
			inset="0 0 0 0"
		}
	}

	layout {
		// the title bar is missing, so increase the size of the grip
		place { control="frame_captiongrip" margin=2 width=max height=38 }

		place { control="buddylist" align=left margin-top=36 margin-bottom=54 width=max height=max }
	}
}
