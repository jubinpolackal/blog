class SessionsController < ApplicationController
  def new
 
  end

  def create

    user = User.find_by(email: params[:session][:email])

    if user&.authenticate(params[:session][:password])

      session[:user_id] = user.id

      flash[:success] = 'You have logged in successfully.'

      redirect_to user_path(user)

    else

      flash.now['danger'] = 'Invalid login credentials. Please check the email and password you have entered.'

      render 'new'

    end

  end



  def destroy

    session[:user_id] = nil

    flash[:success] = 'You have logged out.'

    redirect_to root_path

  end

end

