@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Animal extends Entities.Model
		urlRoot: -> Routes.animals_path()
	
	class Entities.AnimalsCollection extends Entities.Collection
		model: Entities.Animal
		
		url: -> Routes.animals_path()
		
		getModelsByAnimalTypeID: (id) ->
			@where animal_type_id: id
	
	API =
		getAnimals: ->
			animals = new Entities.AnimalsCollection
			animals.fetch
				reset: true
			animals
		
		getAnimal: (id) ->
			animal = new Entities.Animal
				id: id
			animal.fetch()
			animal
	
	App.reqres.setHandler "animal:entities", ->
		API.getAnimals()
	
	App.reqres.setHandler "animal:entity", (id) ->
		API.getAnimal id