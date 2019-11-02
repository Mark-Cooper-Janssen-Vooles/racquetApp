class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId]).user_detail
    # raise 
    
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

    @racquet = Racquet.find(racquet_id)
    @user = User.find(user_id).user_detail

    #don't know whats happening here? not updating properly. something to do with webhook i think.
    @racquet.status.sold = true
    @racquet.status.buyer_user_id_id = @user.id
    @racquet.save

    #alert racquet owner of purchase 
    #send email?

    # byebug

    #status 200 erroring out??? should have above @racquet stuff after status 200 but it never gets there.
    # status 200
  end

end