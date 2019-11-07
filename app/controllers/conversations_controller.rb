class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    #find conversation between specific users
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    #check if conversation exists first and if it does, set the conversation. If not, create a new one and redirect to the conversation page.
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
    
end
