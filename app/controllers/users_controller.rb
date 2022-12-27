class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :login, :password)
    user = User.find_by(login: user_params[:login])

    if user.present?
      flash.now[:alert] = 'Такой логин уже есть на сайте'
       redirect_to '/users/new'
     # redirect_to 
    else
      User.create(user_params)
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    end
  end


end