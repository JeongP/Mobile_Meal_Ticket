class ItemsController < ApplicationController
  before_action :load_object, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @Items = Item.all
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to items_url

  end

  def destroy
    @item.destroy
    redirect_to items_url
  end

  def update
    @item.update(item_params)
    redirect_to items_url
  end

  private
  def load_object
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :desc, :image, :price, :user_id)
  end
end
