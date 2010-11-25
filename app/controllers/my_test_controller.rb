class MyTestController < ApplicationController
	def index
		render_text "Hallo World"
	end
	
	def dilbert
		render_text "Wow,that was easy!"
	end
end
