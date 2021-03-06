@Hub.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	Show.Controller =
		
		show: (favorites) ->
			@layout = @getLayoutView()
			
			@layout.on "show", =>
				@favoritesRegion favorites
			
			App.headerRegion.show @layout
		
		favoritesRegion: (favorites) ->
			favoritesView = @getFavoritesView favorites
			
			favoritesView.on "favorite:animals:clicked", ->
				App.vent.trigger "favorite:animals:clicked", favorites
			
			@layout.favoritesRegion.show favoritesView
		
		getFavoritesView: (favorites) ->
			new Show.Favorites
				collection: favorites
		
		getLayoutView: ->
			new Show.Layout