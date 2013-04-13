@Hub.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	class Entities.Model extends Backbone.Model
		
		processUpdateOrCreate: (data, collection) ->
			@on "all", (e) -> console.log e
			@save data,
				success: ->
					console.info "success"
					collection.trigger ""
					collection.add(@)
					model.trigger "success:save"
				error: ->
					console.warn "error"