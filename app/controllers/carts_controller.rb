class CartsController < ApplicationController

	def index
		puts "prout"
		puts
		if current_user
		@cart = Cart.all.where(user_id: current_user.id)
		else
			flash[:notice] = nil
			flash[:notice] = "Veuillez vous connecter pour acceder à ce contenu."
			redirect_to "/users/sign_in"
		end
	end

	def create
		puts "JE PRINT PARAMS"
		print params
		Cart.create!(user_id: current_user.id, item_id: params[:item_id])
	end

	def edit
	end

	def update
	end

	def destroy
	end
end
