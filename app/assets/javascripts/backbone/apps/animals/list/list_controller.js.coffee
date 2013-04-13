@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: ->
			animals = App.request "animal:entities"
			
			App.execute "when:fetched", animals, =>

				listView = @getListView animals
			
				App.mainRegion.show listView
		
		getListView: (animals) ->
			new List.Animals
				collection: animals
			