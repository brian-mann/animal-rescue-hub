@Hub.module "AnimalsApp", (AnimalsApp, App, Backbone, Marionette, $, _) ->
	
	class AnimalsApp.Router extends Marionette.AppRouter
		appRoutes:
			"animals/:id" : "show"
			"animals" 		: "list"
		
	API =
		list: (animals = false) ->
			AnimalsApp.List.Controller.list animals
		
		show: (id, animal = false) ->
			AnimalsApp.Show.Controller.show id, animal
	
	App.vent.on "animal:clicked", (animal) ->
		App.navigate Routes.animal_path(animal.id)
		API.show animal.id, animal
	
	App.vent.on "favorite:animals:clicked", (favorites) ->
		App.navigate Routes.animals_path()
		API.list favorites
	
	App.addInitializer ->
		new AnimalsApp.Router
			controller: API