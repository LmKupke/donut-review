class UsersController < ApplicationController
  def show
    @user = User.find(params['id'])
  end
<<<<<<< HEAD

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    binding.pry
    "Hello"
  end
=======
>>>>>>> 31fa1acb703c63746599fb5a9686d9a142616a24
end
