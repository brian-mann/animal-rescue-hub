@Hub.module "AnimalsApp", (AnimalsApp, App, Backbone, Marionette, $, _) ->
	
	class AnimalsApp.Router extends Marionette.AppRouter
		appRoutes:
			"animals/:id" : "show"
			"animals" 		: "list"
		
	API =
		list: ->
			AnimalsApp.List.Controller.list()
		
		show: (id, animal = false) ->
			AnimalsApp.Show.Controller.show id, animal
	
	App.vent.on "animal:clicked", (animal) ->
		console.log animal
		App.navigate Routes.animal_path(animal.id)
		API.show animal.id, animal
	
	App.addInitializer ->
		new AnimalsApp.Router
			controller: API