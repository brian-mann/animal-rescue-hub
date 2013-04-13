@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Animal extends Marionette.ItemView
		template: "animals_app/list/_animal"
	
	class List.Animals extends Marionette.CompositeView
		template: "animals_app/list/animals"
	
