@Hub.module "AnimalTypesApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: (types) ->
			listView = @getListView types
		
		getListView: (types) ->
			new List.AnimalTypes
				collection: types