class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :login, :password)

    User.create(user_params)

    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    @user = User.update(user_params)
    redirect_to root_path, notice: 'Данные пользователя обновлены'
    
  end
  
  def destroy 
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)
    redirect_to root_path, notice: 'Пользователь удален' 

  end

  def user_params
    params.require(:user).permit(:name, :login, :password)
  end
end
