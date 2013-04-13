@Hub = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.rootRoute = Routes.animals_path()	
	
	App.addRegions
		mainRegion: "#main-region"
	
	# App.addInitializer ->
	# 	App.module("HeaderApp").start()
	# 	App.module("FooterApp").start()
	
	App.on "initialize:after", (options) ->
		console.log "init:after"
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()
	
	App