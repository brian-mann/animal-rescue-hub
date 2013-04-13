@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.AnimalType extends Entities.Model
	
	class Entities.AnimalTypesCollection extends Entities.Collection
		model: Entities.AnimalType
	
	API =
		getAnimalTypes: (types) ->
			new Entities.AnimalTypesCollection types
	
	App.reqres.setHandler "animal:type:entities", (types = []) ->
		API.getAnimalTypes types

