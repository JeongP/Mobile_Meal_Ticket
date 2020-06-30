class BuyingController < ApplicationController
  def create
    # 현재유저 금액 차감
    shop = Shop.find_by(id: params[:buying][:shop_id])
    user = User.find_by(id: current_user.id)

    # 식당이름, 유저이름, 메뉴가격을 가져와야해
    @user_name = user.username
    @shop_name = shop.name
    @price = shop.price

    # 바코드 번호 생성.
    # Buying.create!(user_id: current_user.id, shop_id: params[:buying][:shop_id])
    Buying.create!(user_id: current_user.id, shop_id: params[:buying][:shop_id], use: true)
    # redirect_to home_ticket_url
    # if user.account >= shop.price
    #   # user.account = user.account - shop.price
    #   # user.save
    #   # 구매 가능시 식권 생성
    #   Buying.create!(user_id: current_user.id, shop_id: params[:buying][:shop_id], use: true)
    #   # redirect_to home_buy_url
    # else
    #   # 잔액이 부족합니다 경고창
    #   # redirect_to home_buy_url
    # end
  end

  def destroy
  end
end
