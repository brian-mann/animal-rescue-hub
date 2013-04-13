@Hub = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.rootRoute = Routes.animals_path()	
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion: 	"#main-region"
	
	App.addInitializer ->
		App.module("HeaderApp").start()
	
	App.on "initialize:after", (options) ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()
	
	App