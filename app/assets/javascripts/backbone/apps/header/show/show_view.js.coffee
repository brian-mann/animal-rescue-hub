@Hub.module "HeaderApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Layout extends App.Views.Layout
		template: "header/show/show_layout"
		
		regions:
			favoritesRegion: "#favorites-region"
	
	class Show.Favorites extends App.Views.ItemView
		template: "header/show/_favorites"
		
		collectionEvents:
			"add" 		: "render"
			"remove" 	: "render"