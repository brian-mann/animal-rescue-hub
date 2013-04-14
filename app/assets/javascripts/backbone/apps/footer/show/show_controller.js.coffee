@Hub.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	Show.Controller =
		
		show: ->
			footerView = @getFooterView()
			App.footerRegion.show footerView
		
		getFooterView: ->
			new Show.Footer