@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Animal extends App.Views.ItemView
		template: "animals/list/_animal"
		tagName: "li"
		className: "item"
		triggers:
			"click" : "animal:clicked"
	
	class List.Animals extends App.Views.CompositeView
		template: "animals/list/animals"
		itemView: List.Animal
		itemViewContainer: "#animals-list"
		id: "animals-list-container"

		ui:
			"animalsList" : "#animals-list"
		
		# events:
		# 	
		
		onShow: ->
			@ui.animalsList.isotope()
				# itemSelect: @$el.children()
				# layoutMode: "fitRows"
		
		onClose: ->
			@$el.isotope('destroy')
			
