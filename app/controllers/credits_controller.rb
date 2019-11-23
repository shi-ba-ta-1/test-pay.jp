class CreditsController < ApplicationController

  def show
  end

  def pay #クレジットカード登録
    Payjp.api_key = "sk_test_9581dc90803e604af65e7f4c"
    # ここでテスト鍵をセットしてあげる(環境変数にしても良い)
    if params['payjpToken'].blank?
    # paramsの中にjsで作った'payjpTokenが存在するか確かめる
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken'],
      metadata: {user_id: current_user.id}
      )
     # ↑ここでjay.jpに保存
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
     # ここでdbに保存
      if @card.save
        redirect_to action: "show"
        flash[:notice] = 'クレジットカードの登録が完了しました'
      else
        redirect_to action: "pay"
        flash[:alert] = 'クレジットカード登録に失敗しました'
      end
    end
 end
 
end