@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: ->
			animals = App.request "animal:entities"
			types		= App.request "app:animal:types"
			
			App.execute "when:fetched", [animals, types], =>

				@layout = @getLayoutView()
				
				@layout.on "show", =>
					@animalTypesRegion animals, types
					@animalsListRegion animals
			
				@layout.on "childview:animal:clicked", (iv, args) ->
					App.vent.trigger "animal:clicked", args.model		
			
				App.mainRegion.show @layout
		
		animalsListRegion: (animals) ->
			listView = @getListView animals
			
			listView.on "childview:animal:clicked", (iv, args) ->
				App.vent.trigger "animal:clicked", args.model
			
			@layout.animalsListRegion.show listView
		
		animalTypesRegion: (animals, types) ->
			typesView = @getTypesView types
			
			typesView.on "childview:animal:type:clicked", (iv, args) =>
				animals.trigger "filter:on:animal:type:id", args.model.id
			
			@layout.animalTypesRegion.show typesView
		
		getTypesView: (types) ->
			new List.AnimalTypes
				collection: types
		
		getListView: (animals) ->
			new List.Animals
				collection: animals
		
		getLayoutView: ->
			new List.Layout