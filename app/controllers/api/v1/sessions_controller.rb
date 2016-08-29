class Api::V1::SessionController < ApplicationController
	
before_action :block_access, except: [:destroy]


  def new
  end

  def create
    @user = User.find_by(registration: params[:session][:registration])
    	if @user && @user.authenticate(params[:session][:password])
        	sign_in @user
        	#redirect_to @user
    		render json: @user
      	else
      		@fail = -1
      		render json: @fail
   		end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
