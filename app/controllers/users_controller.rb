class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :login, :password)
    #@user = User.find_by(login: user_params[:login])
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Неправильно заполнили форму регистрации'
      #redirect_to "/users/new", notice: 'Неправильно заполнили форму регистрации'
      #render "new", status: :unprocessable_entity
      render :new
    end
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

  def show 
    @user = User.find(params[:id])

  end
end
