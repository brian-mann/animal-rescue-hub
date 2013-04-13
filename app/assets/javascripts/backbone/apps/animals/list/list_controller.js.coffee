@Hub.module "AnimalsApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: ->
			animals = App.request "animal:entities"
			
			App.execute "when:fetched", animals, =>

				listView = @getListView animals
			
				listView.on "childview:animal:clicked", (iv, args) ->
					App.vent.trigger "animal:clicked", args.model		
			
				App.mainRegion.show listView
		
		getListView: (animals) ->
			new List.Animals
				collection: animals
			