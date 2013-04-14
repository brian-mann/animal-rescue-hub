@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Animal extends Entities.Model
		defaults:
			favorited: false
			
		urlRoot: -> Routes.animals_path()
	
	class Entities.AnimalsCollection extends Entities.Collection
		model: Entities.Animal
		
		url: -> Routes.animals_path()
		
		getModelsByAnimalTypeID: (id) ->
			@where animal_type_id: id
		
		storeFavoriteAnimals: (animal) ->
			found = @get(animal.id)
			
			if found
				@remove(animal)
				animal.set favorited: false
			else 
				@add(animal)
				animal.set favorited: true
	
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
		
		getFavoriteAnimals: ->
			new Entities.AnimalsCollection
	
	App.reqres.setHandler "animal:entities", ->
		API.getAnimals()
	
	App.reqres.setHandler "animal:entity", (id) ->
		API.getAnimal id
	
	App.reqres.setHandler "favorite:animals", ->
		API.getFavoriteAnimals()