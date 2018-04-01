class CatsController < ApplicationController

  def show
    @cat = Cat.where(id: params(:id)).first
  end

  def new
    @cat = Cat.new
    @user = current_user
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      flash[:notice] = "Your cat's profile was successfully created!"
      redirect_to root_path
    else
      flash[:alert] = "An error occurred while creating you cat's profile"
      @user = current_user
      render :new
    end
  end

  def edit
    @cat = Cat.where(id: params[:id]).first
    @user = current_user
    if @user.blank?
      flash[:alert] = "You must sign-in to create or edit cat profiles."
      redirect_to root_path and return
    elsif @cat.blank? || @user.id != @cat.user_id
      flash[:alert] = "You do not have permission to edit this cat."
    end
  end

  def update
    @cat = Cat.where(id: params[:id]).first
    @cat.attributes = cat_params
    if @cat.save
      flash[:notice] = "Cat successfully updated"
      redirect_to root_path
    else
      @user = current_user
      render :edit
    end
  end

  def destroy
    @cat = Cat.where(id: params[:id])
    if @cat.user_id == current_user.id
      flash[:notice] = "Cat profile deleted"
    else
      flash[:alert] = "You do not have permission to modify this cat's profile"
    end
    redirect_to root_path
  end

  def create_rating
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :breed, :bio, :image, :user_id)
  end

end
