@Hub = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
	App.on "initialize:before", (options) ->
		@animalTypes = App.request "animal:type:entities", options.animalTypes
		@favoriteAnimals = App.request "favorite:animals"
	
	App.reqres.setHandler "app:animal:types", ->
		App.animalTypes
	
	App.reqres.setHandler "app:favorite:animals", ->
		App.favoriteAnimals
	
	App.vent.on "favorite:animal:clicked", (animal) ->
		App.favoriteAnimals.storeFavoriteAnimals animal
	
	App.rootRoute = Routes.animals_path()	
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion: 	"#main-region"
		footerRegion: 	"#footer-region"
	
	App.addInitializer ->
		App.module("HeaderApp").start favoriteAnimals: @favoriteAnimals
		App.module("FooterApp").start()
	
	App.on "initialize:after", (options) ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()
	
	App