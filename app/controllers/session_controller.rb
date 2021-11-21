class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: params[:user][:name])
      session[:user_id] = @user.id
      redirect_to cocktails_path
    else
      flash[:message] = "Sorry, your input was wrong or does not exist, please try again."
      render 'new'
    end
  end

  def destroy
    session.delete("user_id")
    redirect_to root_path
  end
end
