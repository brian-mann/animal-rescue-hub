@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Collection extends Backbone.Collection
		
		getPicked: ->
			@where picked: true