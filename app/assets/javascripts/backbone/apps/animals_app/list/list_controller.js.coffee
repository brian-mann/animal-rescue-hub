@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: ->
			animals = App.request "animal:entities"
			
			listView = @getListView animals
		
		getListView: (animals) ->
			new List.Animals
				collection: animals
			