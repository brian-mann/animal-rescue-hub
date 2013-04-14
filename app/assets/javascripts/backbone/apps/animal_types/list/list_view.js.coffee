@Hub.module "AnimalTypesApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.AnimalType extends App.Views.ItemView
		template: "animal_types/list/_type"
		tagName: "li"
		triggers:
			"click" : "animal:type:clicked"
			
	class List.AnimalTypes extends App.Views.CompositeView
		template: "animal_types/list/types"
		itemView: List.AnimalType
		itemViewContainer: ".category-list"
	