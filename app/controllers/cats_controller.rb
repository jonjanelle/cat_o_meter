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
    rating = params[:rating].to_i
    error = nil
    @user = current_user
    if rating > 0
      if !@user.cats_rated.include?(params[:cat_id].to_i)
        rating = Rating.new(user_id: params[:user_id], cat_id: params[:cat_id], rating: params[:rating])
        @user.cats_rated << params[:cat_id]
        @user.save
      else
        error = "You've rated all available cats!"
      end
    else
      error = "Please select a rating"
    end
    cat_ids = Cat.all.pluck(:id) - @user.cats_rated
    @cat = Cat.where(id: cat_ids[rand(cat_ids.length)]).first
    respond_to do |format|
      if error
         format.js { render :js => "$('#rating_error').text('#{error}')" and return}
      elsif rating.save
        format.js
      else
        format.js { render :js => "alert('Error rating cat!')" and return}
      end
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age, :breed, :bio, :image, :user_id)
  end

end
