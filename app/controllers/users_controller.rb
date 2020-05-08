class UsersController < ApplicationController
  def new
    render "new"
  end

  def create
    new_user = User.create!(first_name: params[:first_name],
                            last_name: params[:last_name],
                            email: params[:email],
                            password: params[:password])
  end

  def show
    render "show"
  end
end
