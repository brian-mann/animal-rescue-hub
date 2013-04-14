@Hub.module "AnimalTypesApp.List", (List, App, Backbone, Marionette, $, _) ->
	
	List.Controller =
		
		list: (types) ->
			listView = @getListView types
			
			listView.on "childview:animal:type:clicked", (iv, args) ->
				picked = types.getPicked()
				for model in picked
					model.unpick()
				args.model.pick()
			
			# listView.on "sort:animals", (obj) ->
			# 	console.log obj
			
			listView
		
		getListView: (types) ->
			new List.AnimalTypes
				collection: types