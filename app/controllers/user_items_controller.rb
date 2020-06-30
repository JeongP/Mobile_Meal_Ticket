class UserItemsController < ApplicationController
	before_action :authenticate_user!

	def index
		item_id = UserItem.where(user_id: current_user.id).pluck(:item_id)
		@user_items = Item.where(id: item_id)
	end

  def create
  	UserItem.find_or_create_by!(item_id: params[:item_id], user_id: current_user.id)
  	redirect_to items_path
  end

  def destroy
  	UserItem.find_by(item_id: params[:id]).destroy
  	redirect_to items_path
  end
end
