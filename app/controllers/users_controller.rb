class UsersController < ApplicationController
  def new
  end

  def create
    if User.find_by({"email" => params["email"]}) == nil
      @user = User.new
      @user["username"] = params["username"]
      ##@user["first_name"] = params["first_name"]
      ##@user["last_name"] = params["last_name"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/places"
    else
    flash["notice"] = "Why make an account when you already have one! Please sign in!"
    redirect_to "/login"
    end
  end
end
