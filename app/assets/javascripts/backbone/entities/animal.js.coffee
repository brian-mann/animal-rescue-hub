@Hub.module "AnimalsApp", (AnimalsApp, App, Backbone, Marionette, $, _) ->
	
	class AnimalsApp.Router extends Marionette.AppRouter
		routes:
			"animals" : "list"
		
	API =
		list: ->
			AnimalsApp.List.Controller.list()
	
	
	App.addInitializer ->
		new AnimalsApp.Router
			controller: API