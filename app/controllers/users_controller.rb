class UsersController < ApplicationController
    
 before_filter :index
  
  def index
    @users = User.all
    @count = cart_count
    @total_price = cart_total
  end
  
  def item
    
  end
  
  def show
    @user=User.find(params[:id])   
  end
  
  def edit
  @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to @user
  else
    render 'edit'
  end
  end
 
    
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private 
  def user_params
      params.require(:user).permit(:username, :firstname, :lastname, :phone, :dob, :email)
  end

end
