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

  def create
  	@user = User.new(user_params)
  #	if @user.save
  #		redirect_to @user
  #	else
  #		render 'new'
  #	end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Bar was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end    
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
