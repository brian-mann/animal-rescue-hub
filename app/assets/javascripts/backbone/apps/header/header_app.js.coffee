@Hub.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false

	API =
		show: ->
			HeaderApp.Show.Controller.show()
	
	HeaderApp.on "start", ->
		API.show()