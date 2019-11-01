class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId]).user_detail
  end

  def webhook

    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    racquet_id = payment.metadata.racquet_id
    user_id = payment.metadata.user_id

    p "---------------------------------------"
    p "racquet id " + racquet_id
    p "user id " + user_id
    p "---------------------------------------"

    status 200

    @racquet = Racquet.find(racquet_id)
    @user = User.find(user_id).user_detail

    @racquet.status.sold = true
    @racquet.save
  end

end