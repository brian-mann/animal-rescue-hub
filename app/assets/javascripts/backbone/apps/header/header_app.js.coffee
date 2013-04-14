@Hub.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		show: (favorites) ->
			HeaderApp.Show.Controller.show favorites
	
	HeaderApp.on "start", (options) ->
		API.show options.favoriteAnimals