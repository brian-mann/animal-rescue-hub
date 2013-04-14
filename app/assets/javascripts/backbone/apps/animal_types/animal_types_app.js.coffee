@Hub.module "AnimalTypesApp", (AnimalTypesApp, App, Backbone, Marionette, $, _) ->
	
	API =
		list: (types) ->
			AnimalTypesApp.List.Controller.list types
	
	App.reqres.setHandler "animal:types:list:view", (types) ->
		API.list types