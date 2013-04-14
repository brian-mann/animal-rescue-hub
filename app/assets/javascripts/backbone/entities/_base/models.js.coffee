@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model
		
		unpick: ->
			@set picked: false
		
		pick: ->
			@set picked: true