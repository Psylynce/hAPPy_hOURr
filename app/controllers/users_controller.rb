class UsersController < ApplicationController
  def show 
  	@user = User.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end    
  end

  def new
  	@user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end    
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
      flash[:success] = "Welcome to the Happy Hour App!"
      redirect_to @user
  	else
  		render 'new'
  	end 
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
