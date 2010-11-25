class RecipeController < ApplicationController
	scaffold :recipe
	
	def list
		@recipes = Recipe.find_all
	end
	def edit
		@recipe = Recipe.find(@params["id"])
		@categories = Category.find_all
	end 
end
