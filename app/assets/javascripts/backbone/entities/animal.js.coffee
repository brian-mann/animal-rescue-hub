@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Animal extends Entities.Model
	
	class Entities.AnimalsCollection extends Entities.Collection
		model: Entities.Animal
		
		url: -> Routes.animals_path()
	
	API =
		getAnimals: ->
			animals = new Entities.AnimalsCollection
			animals.fetch
				reset: true
			animals
	
	App.reqres.setHandler "animal:entities", ->
		API.getAnimals()