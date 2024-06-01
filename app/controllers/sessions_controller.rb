class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({"email" => params["email"]})
    if @user != nil
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Hello and Welcome, #{@user["username"]}"
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect password! Recheck for CAPSlock and try again!"
        redirect_to "/login"
      end
    else
      flash["notice"] = "No account with this email. Please sign up! You will be redirected!"
      redirect_to "/users/new"
    end
  end

  def destroy
    flash["notice"] = "Hope you had a good time on this page! Bye!"
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  