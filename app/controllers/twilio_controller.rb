class TwilioController < ApplicationController
	
	def voice_callback
		puts params.inspect
		respond_to do |format|
			format.xml
		end
	end
	
	
end
