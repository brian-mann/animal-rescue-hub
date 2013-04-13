@Hub.module "AnimalsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Animal extends App.Views.ItemView
		template: "animals/show/show_layout"