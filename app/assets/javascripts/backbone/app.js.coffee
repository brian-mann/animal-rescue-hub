@Hub = do (Backbone, Marionette) ->
	
	App = new Marionette.Application	
		
	
	App.addRegions
		mainRegion: "#main-region"
	
	# App.addInitializer ->
	# 	App.module("HeaderApp").start()
	# 	App.module("FooterApp").start()
	
	App.on "initialize:after", (options) ->
		if Backbone.history
			Backbone.history.start()
			# @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""
	
	App