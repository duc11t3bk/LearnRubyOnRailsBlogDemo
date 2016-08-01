class StaticPagesController < ApplicationController
  
  def home
  	if logged_in?
  		@feed_items= current_user.feed.paginate(page: params[:page])
  	else
  		@entries= Entry.all
  	end
  end

end
