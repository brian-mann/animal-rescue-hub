Array::insertAt = (index, item) ->
	@splice(index, 0, item)
	@

String::capitalizeFirst = ->
	@charAt(0).toUpperCase() + @slice(1)