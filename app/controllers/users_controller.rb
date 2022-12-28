class UsersController < ApplicationController
  before_action :set_user, only: %i[update show destroy edit]
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    #@user = User.find_by(login: user_params[:login])
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
      user = User.find_by(login: user_params[:login])&.authenticate(user_params[:password])
      session[:user_id] = user.id
      
    else
      flash.now[:alert] = 'Неправильно заполнили форму регистрации'
      #redirect_to "/users/new", notice: 'Неправильно заполнили форму регистрации'
      #render "new", status: :unprocessable_entity
      render :new
    end
  end

  def edit
  end

  def update
    @user = User.update(user_params)
    redirect_to root_path, notice: 'Данные пользователя обновлены'
  end
  
  def destroy 
    @user.destroy

    session.delete(:user_id)
    redirect_to root_path, notice: 'Пользователь удален' 

  end

  def show 
  end

  private
  def user_params
    params.require(:user).permit(:name, :login, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
