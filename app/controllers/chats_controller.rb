class ChatsController < ApplicationController
  def create

    if current_user
      @chat = Chat.new :user_id => current_user.id, :show_id => params[:show_id], :message => params[:message]
      if @chat.save
        render :json => @chat, :status => :created
      else
        render :json => @chat.errors, :status => :unprocessable_entity
      end
    else
      render :json => { :message => "User does not have access to create events for this show" }, :status => :unauthorized
    end
  end

  def index
    @chats = Chat.where(:show_id => params[:show_id])

    render :json => @chats
  end
end
