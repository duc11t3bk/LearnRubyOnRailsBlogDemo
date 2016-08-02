class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			redirect_to request.referrer || root_url
		else
			render entry_path(@comment.entry.id)
		end
	end

	def destroy
		
	end

	private
		def comment_params
			params.require(:comment).permit(:content, :entry_id)
		end
end
