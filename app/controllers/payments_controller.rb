class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId]).user_detail  

    # @racquet = Racquet.find(racquet_id)
    # @user = User.find(user_id).user_detail

    @racquet.status.sold = true
    @racquet.status.buyer_user_id_id = @user.id
    @racquet.save
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

    #don't know whats happening here? not updating properly. something to do with webhook i think.

    #alert racquet owner of purchase 
    #send email?

    # byebug

    #status 200 erroring out??? should have above @racquet stuff after status 200 but it never gets there.
    status 200
  end

  private 

  # #mailgun stuff, do if theres time: https://app.mailgun.com/app/account/setup
  # def send_simple_message
  #   RestClient.post "https://api:b7879edb8bd99ec1dd25c0b601cdcffd-816b23ef-955515d2"\
  #     "@api.mailgun.net/v3/sandbox2c0d97865d7e44a199c5fcb603efcdcc.mailgun.org/messages",
  #     :from => "Mailgun Sandbox <postmaster@sandbox2c0d97865d7e44a199c5fcb603efcdcc.mailgun.org>",
  #     :to => "Mark Janssen <m_arch@outlook.com.au>",
  #     :subject => "Hello Mark Janssen",
  #     :text => "Congratulations Mark Janssen, you just sent an email with Mailgun!  You are truly awesome!"
  # end

end