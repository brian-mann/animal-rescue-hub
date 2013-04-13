@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Animal extends Marionette.ItemView
		template: "animals_app/list/_animal"
		className: "item"
	
	class List.Animals extends Marionette.CollectionView
		template: "animals_app/list/animals"
		itemView: List.Animal
		id: "container"
		
		onShow: ->
			@$el.isotope
				# itemSelect: @$el.children()
				layoutMode: "fitRows"
			
