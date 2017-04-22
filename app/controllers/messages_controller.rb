class MessagesController < ApplicationController

  def index
  end

  def new
      @new_message = Message.new
      @receiver = Profile.find(params[:format]).user
  end

  def create

      new_message = Message.create(message_content: message_params[:message_content])
      new_message.save
      #byebug
      new_sent_message = SentMessage.new(user_sent: current_user.id, user_received: message_params[:receiver_id], message_id: new_message.id, status: "unread")
      new_received_message = ReceivedMessage.new(user_received: message_params[:receiver_id], user_sent: current_user.id, message_id: new_message.id, status: "unread")
      new_sent_message.save
      new_received_message.save
      flash[:message_sent] = "Message was sent successfully."
      redirect_to profile_path(User.find(message_params[:receiver_id]).profile)
  end

  def edit

      get_message_id = ReceivedMessage.find(params[:id]).message_id
      @reply_message = Message.find(get_message_id)

  end

  def update
      received_message = Message.find(params[:id])
      old_message = received_message[:message_content]
      new_message = "#{current_user.first_name} #{current_user.last_name}: #{params[:message_content]}"

      joint_message = [old_message, new_message]
      received_message.message_content = joint_message.join("<br/>")
      received_message.save
      #send_message = SentMessage.find_by(message_id: params[:id]).user_sent
      #byebug
      redirect_to messages_path
  end

  private

  def message_params
      params.require(:message).permit(:message_content, :receiver_id)
  end


end
