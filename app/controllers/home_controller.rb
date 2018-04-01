class HomeController < ApplicationController
  def index
    cat_ids = Cat.all.pluck(:id)
    @cat = Cat.where(id: cat_ids[rand(cat_ids.length)]).first
    @user = current_user
    if @user.present?
    end
  end
end
