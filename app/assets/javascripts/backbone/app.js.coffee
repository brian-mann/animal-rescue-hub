@Hub = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.on "initialize:before", (options) ->
		@animalTypes = App.request "animal:type:entities", options.animalTypes
	
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