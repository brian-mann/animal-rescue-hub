@Hub.module "AnimalsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	class Show.Animal extends App.Views.ItemView
		template: "animals/show/show_layout"
		
		ui:
			thumb: ".thumb"
		
		onRender: ->
			@ui.thumb.fancybox
				helpers:
					thumbs:
						width: 89
						height: 50
						position: "top"