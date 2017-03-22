class UserController < ApplicationController
  def index
# WHY IS THIS SESSION LOGIC NOT WORKING RIGHT NOW???
    if session[:id].nil?
      redirect_to '/user/index'
    else
      redirect_to '/event/index'
    end
  end

  def edit
    @user = User.find(session[:id])
  end

  def create
    @user = User.create(user_info)
    puts @user.valid?
    session[:id] = @user.id
    redirect_to "/event/index"
  end

  def submit
    @user = User.find(session[:id])
    @user.update(user_info)
    redirect_to "/event/index"
  end

  def login
    @user = User.find_by(email: user_info[:email])
    if @user.nil?
      flash[:message] = ["Email doesn't exist in the system"]
      redirect_to '/user/index'
    else
      if @user.verify user_info[:password]
        session[:id] = @user.id
        redirect_to "/event/index"
      else
        flash[:message] = ['Password is incorrect']
        redirect_to '/user/index'
      end
    end
  end

  def logout
    session.clear
    redirect_to '/user/index'
  end

  private
  def user_info
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password)
  end
end
