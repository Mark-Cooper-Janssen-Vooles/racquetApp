class MessagesController < ApplicationController
  before_action :authenticate_user!

  before_action do
    #find the conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages
    #return the messages between the users
    @messages.where("user_id != ? AND read = ?", current_user.id, false).update_all(read: true)
    #allow creation of a new message
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :user_id)
    end
end
