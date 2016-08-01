class EntriesController < ApplicationController
	before_action :logged_in_user

	def new

	end
	
	def show
		
	end

	def create
		@entry = current_user.entries.build(entry_params)
		if @entry.save
			flash[:success]= "Entry created!"
			redirect_to root_url
		else
			render root_path
		end

	def destroy
		
	end

	private
		def entry_params
			params.require(:entry).permit(:title, :body)
		end
end
