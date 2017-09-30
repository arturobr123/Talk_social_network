$("#user-avatar .circle").css
	"background": "url(<%= @user.avatar.url(:medium) %>)"
	"background-size": "cover"
	"background-position": "center"

$("#user-cover").css
	"background": "url(<%= @user.cover.url(:medium) %>)"
	"background-size": "cover"
	"background-position": "center"