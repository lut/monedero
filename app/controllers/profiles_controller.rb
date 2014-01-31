class ProfilesController < ApplicationController
	
	def index
	    @user = User.all

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @users }
	    end
  	end



	def show
    	@user = User.find(params[:id])
    		if @user
    			@credits = @user.credits.all
    			render action: :show
    		else
    			render file 'public/404', status: 404, formats: [:html]
			end
    end
end
