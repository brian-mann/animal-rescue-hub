@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Layout extends App.Views.Layout
		template: "animals/list/list_layout"
		regions:
			animalTypesRegion: "#animal-types-region"
			animalsListRegion: "#animals-list-region"
	
	class List.Animal extends App.Views.ItemView
		template: "animals/list/_animal"
		tagName: "li"
		className: "item"
		triggers:
			"click" : "animal:clicked"
	
	class List.Animals extends App.Views.CollectionView
		itemView: List.Animal
		itemViewContainer: "#animals-list"
		id: "animals-list-container"

		collectionEvents:
			"filter:on:animal:type:id" : "filterByID"
		
		# initialize: ->
		# 	window.foo = @collection
		# 	window.bar = @
		
		filterByID: (animalTypeID) ->
			items = @getChildrenItemsByAnimalTypeID animalTypeID

			@$el.isotope
				filter: items
		
		getChildrenItemsByAnimalTypeID: (id) ->
			views = []

			for model in @collection.getModelsByAnimalTypeID id
				views.push @children.findByModel model

			_.pluck views, "el"
		
		# onBeforeRender: ->
			# @el.isotope()
		
		onShow: ->
			children = @$el.children()
			children.hide()
			@$el.imagesLoaded =>
				# @$el.show()
				# @$el.isotope
				# 	animationEngine: "css"
					# itemSelect: @$el.children()
					# layoutMode: "fitRows"
				# @$el.show()
				@$el.isotope()
				children.show()
				# @$el.isotope( 'remove', children );
				@$el.isotope( 'insert', children );
				# @$el.isotope "addItems", @$el.children()
				
				# @$el.show()
				# @$el.isotope "addItems", @$el.children()
		
		onClose: ->
			@$el.isotope('destroy')
	
	class List.AnimalType extends App.Views.ItemView
		template: "animals/list/_type"
		tagName: "li"
		triggers:
			"click" : "animal:type:clicked"
			
	class List.AnimalTypes extends App.Views.CompositeView
		template: "animals/list/types"
		itemView: List.AnimalType
		itemViewContainer: "ul"
