class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_signup_params)
    if @user.save
      redirect_to @user, notice: "You have successfully signed up!"
    else
      render :new
    end
  end

  protected
  
  def user_signup_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
      )
  end
end
