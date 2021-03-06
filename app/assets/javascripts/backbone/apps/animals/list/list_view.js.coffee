@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	class List.Layout extends App.Views.Layout
		template: "animals/list/list_layout"

		regions:
			animalTypesRegion: "#animal-types-region"
			animalsListRegion: "#animals-list-region"
		
		ui:
			animalTypeName: "#animal-type-name"

		collectionEvents:
			"filter:on:animal:type:id" : "filterByName"
		
		serializeData: ->
			title: @collection.defaultTitle

		filterByName: (name) ->
			@ui.animalTypeName.text name.capitalizeFirst() + "s"
	
	class List.Animal extends App.Views.ItemView
		template: "animals/list/_animal"
		tagName: "li"
		attributes: ->
			class: "item #{@model.get("animal_type").name}"
		
		triggers:
			"click" : "animal:clicked"
		
		events:
			"click .icons-star-empty" : "transferToFavorites"
		
		modelEvents:
			"change:favorited" : "render"
		
		transferToFavorites: (e) ->
			e.stopPropagation()
			@trigger "favorite:animal:clicked", @model
			
			if @model.get "favorited"
				@$el.effect "transfer",
					to: $("#favorites-region")
				, 400
	
	class List.Animals extends App.Views.CollectionView
		itemView: List.Animal
		itemViewContainer: "#animals-list"
		id: "animals-list-container"

		collectionEvents:
			"filter:on:animal:type:id" : "filterByName"
		
		# initialize: ->
		# 	window.foo = @collection
		# 	window.bar = @
		
		filterByName: (name) ->

			# items = @getChildrenItemsByAnimalTypeID animalTypeID
			
			# console.log animalTypeID, items

			# @$el.isotope
			# 	filter: "*"
			
			@$el.isotope
				filter: ".item.#{name}"
		
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
				@$el.isotope
					getSortData:
						donation: (child) =>
							@children.findByIndex(child.index()).model.get("goal_amount")
						
				children.show()
				# @$el.isotope( 'remove', children );
				@$el.isotope( 'insert', children );
				# @$el.isotope "addItems", @$el.children()
				
				# @$el.show()
				# @$el.isotope "addItems", @$el.children()
		
		onClose: ->
			@$el.isotope('destroy')