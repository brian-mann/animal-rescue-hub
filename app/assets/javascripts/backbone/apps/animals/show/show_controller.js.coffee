@Hub.module "AnimalsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
	
	Show.Controller =
		
		show: (id, animal) ->
			animal or= App.request "animal:entity", id
			
			App.execute "when:fetched", (animal), =>
				
				showView = @getShowView animal
				
				App.mainRegion.show showView
		
		getShowView: (animal) ->
			new Show.Animal
				model: animal