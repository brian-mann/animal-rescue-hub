@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: (animals) ->
			animals or= App.request "animal:entities"
			types		= App.request "app:animal:types"
			
			App.execute "when:fetched", [animals, types], =>
				favorites = App.request "app:favorite:animals"
				animals.checkFavorites(favorites)
				
				@layout = @getLayoutView()
				
				@layout.on "show", =>
					@animalTypesRegion animals, types
					@animalsListRegion animals
			
				App.mainRegion.show @layout
		
		animalsListRegion: (animals) ->			
			listView = @getListView animals
			
			listView.on "childview:animal:clicked", (iv, args) ->
				App.vent.trigger "animal:clicked", args.model
			
			listView.on "childview:favorite:animal:clicked", (iv, animal) ->
				App.vent.trigger "favorite:animal:clicked", animal
			
			@layout.animalsListRegion.show listView
		
		animalTypesRegion: (animals, types) ->
			typesView = App.request "animal:types:list:view", types
			
			typesView.on "childview:animal:type:clicked", (iv, args) =>
				animals.trigger "filter:on:animal:type:id", args.model.id
			
			@layout.animalTypesRegion.show typesView
		
		getListView: (animals) ->
			new List.Animals
				collection: animals
		
		getLayoutView: ->
			new List.Layout