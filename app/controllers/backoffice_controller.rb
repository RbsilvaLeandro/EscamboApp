class BackofficeController < ApplicationController
	before_action :authenticate_admin!

	layout "Backoffice"	

	#Método que sobrepoe a variável current_user do pundit por current_admin que é a variável do devise
	def pundit_user
		current_admin		
	end
end