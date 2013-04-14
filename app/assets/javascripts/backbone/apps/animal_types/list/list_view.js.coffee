@Hub.module "AnimalTypesApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.AnimalType extends App.Views.ItemView
		template: "animal_types/list/_type"
		tagName: "li"
		triggers:
			"click" : "animal:type:clicked"

		modelEvents:
			"change:picked" : "render"

		onBeforeRender: ->
			@$el.toggleClass "active", @model.get("picked")
			
	class List.AnimalTypes extends App.Views.CompositeView
		template: "animal_types/list/types"
		itemView: List.AnimalType
		itemViewContainer: ".category-list"
	
		events:
			"click #sort-by a" : "sort"
		
		sort: (e) ->
			e.preventDefault()
			# e.stopPropagation()
			target = $(e.target)
			# @trigger "sort:animals",
			# 	column: target.data("sort")
			# 	ascending: target.data("ascending")
			$("#animals-list-container").isotope
				sortBy: 				target.data("sort")
				sortAscending: 	target.data("ascending")