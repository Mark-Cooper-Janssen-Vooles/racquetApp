class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    @racquet = Racquet.find(params[:racquetId])
    @user = User.find(params[:userId])
    
    #update racquet status
    racquet_status_update

    #create conversation 
    conversation = Conversation.create(sender_id: @user.id, receiver_id: @racquet.seller_user_id) 

    default_message = "#{current_user.user_detail.name.capitalize} has purchased your racquet: #{@racquet.title}. Please organise a pickup time or postage method."

    Message.create(body: "#{default_message}", conversation_id: conversation.id, user_id: current_user.id)
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

  def racquet_status_update
    #update racquet status and buyer id
    racquet_id = @racquet.id
    user_id = @user.id

    the_racquet = Status.where("racquet_id = '#{racquet_id}'")[0]

    the_racquet.sold = true
    the_racquet.buyer_user_id_id = user_id
    the_racquet.date_sold = Time.now
    the_racquet.save
  end

end