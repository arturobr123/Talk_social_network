App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.action == "new_notification"
    	snack(
    		message: "Tienes una nueva notificación",
    		timeout:4000
    	)
    	$('#notification').attr("data-badge",data.message) //cambia el numero de notificaciones
