class RemindersController < ApplicationController
	# Reachme.Vadivelan Credentials
	ACC_SID = 'ACd21df5222d9f42a487056fe6c38d4088' 
	AUTH_TOKEN = 'df37c36d65f2e60cfd01178cb1af8ea1' 
	
	#~ # Mahendran.d Credentials
	#~ ACC_SID = 'ACaac23a3f741ddb60f063f3f0566a9d65' 
	#~ AUTH_TOKEN = '4a184dfcba49ee7e227eea0417241825' 
	
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
	
	# Generate report record & Trigger phone calls
	def start_gather_info
		@reminder = Reminder.find(params[:id])
		@reminder.create_report
		
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new ACC_SID, AUTH_TOKEN
		User.all.each do |u|
			@client.account.calls.create({
				:from => '+918754489839', 
				:to => "+91#{u.mobile_number}",  
				:url => twilio_voice_callback_reminder_url(@reminder, :format => "xml"),  
				:method => 'GET',  
				:fallback_method => 'GET',  
				:status_callback_method => 'GET',    
				:record => 'false'
			})
		end
	end
	
	def twilio_voice_callback
		@reminder = Reminder.find(params[:id])
	end
	
	def twilio_keys_callback
		@reminder = Reminder.find(params[:id])
		user = User.find(:mobile_number => params["Called"][3..-1])
		@reminder.report.user_feedbacks << UserFeedback.create(:user_name => user.name, :is_completed => params["Digits"] == "1")
	end
	
end
