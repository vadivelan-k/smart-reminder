class UsersController < ApplicationController
	def index
		@users = User.all
	end
	
	def new
		@user = User.new()
	end
	
	def create
		@user = User.create(params[:user])
		if @user.save
			flash[:success] = "User created successfully."
			redirect_to users_path
		else
			render :new
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "User detail updated successfully."
			redirect_to users_path
		else
			render :edit
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:success] = "User deleted successfully."
		redirect_to users_path
	end

end
