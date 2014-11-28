class RemindersController < ApplicationController
	def index
		@reminders = Reminder.all
	end
	
	def new
		@reminder = Reminder.new
	end
	
	def create
		@reminder = Reminder.create(params[:reminder])
		if @reminder.save
			flash[:success] = "Reminder created successfully."
			redirect_to reminders_path
		else
			render :new
		end
	end
	
	def edit
		@reminder = Reminder.find(params[:id])
	end
	
	def update
		@reminder = Reminder.find(params[:id])
		if @reminder.update_attributes(params[:reminder])
			flash[:success] = "Reminder updated successfully."
			redirect_to reminders_path
		else
			render :edit
		end
	end
	
	def report
		@reminder = Reminder.find(params[:id])
		@report = @reminder.report
	end
end
