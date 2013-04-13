@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Animal extends App.Views.ItemView
		template: "animals/list/_animal"
		className: "item"
		triggers:
			"click" : "animal:clicked"
	
	class List.Animals extends App.Views.CollectionView
		# template: "animals_app/list/animals"
		itemView: List.Animal
		id: "animals-list-container"
		
		# events:
		# 	
		
		onShow: ->
			@$el.isotope()
				# itemSelect: @$el.children()
				# layoutMode: "fitRows"
		
		onClose: ->
			@$el.isotope('destroy')
			
