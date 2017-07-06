class MessagesController < ApplicationController

    def index
    end

    def new
        @new_message = Message.new
        @receiver = Profile.find(params[:format]).user
    end

    def create
        if (message_params[:message_content].blank?)

            flash[:empty_message_error] = "You can not send an empty message."
            redirect_to profile_path(message[:receiver_profile])
        else
        new_message = Message.create(message_content: message_params[:message_content].capitalize)
        new_message.save

        new_sent_message = SentMessage.new(user_sent: current_user.id, user_received: message_params[:receiver_id], message_id: new_message.id, message_status: false)
        new_received_message = ReceivedMessage.new(user_received: message_params[:receiver_id], user_sent: current_user.id, message_id: new_message.id, message_status: false)
        new_sent_message.save
        new_received_message.save
        flash[:message_sent] = "Message was sent successfully."
        redirect_to messages_path
    end
    end
    def update
        if (params[:message_content].blank?)
            flash[:empty_message_error] = "You can not send an empty message."
            redirect_to messages_path
        else
        person_that_sent_message = User.find(ReceivedMessage.find(params[:id]).user_sent)
        #if (current_user.sent_messages.include?(SentMessage.find(params[:id])))
         #if (person_that_sent_message.sent_messages.include?(SentMessage.find(params[:id])))
        message_replying_to = Message.find(ReceivedMessage.find(params[:id]).message_id)

        #person_that_sent_message_id = User.find(SentMessage.find(params[:id]).user_sent)
        old_message = message_replying_to[:message_content]
        new_message = "<b>#{current_user.first_name.capitalize} #{current_user.last_name.capitalize}:</b>" + " #{params[:message_content].capitalize}"
        joint_message = [old_message, new_message].join("<br/><br/>")
        message_replying_to.message_content = joint_message
        message_replying_to.save

        update_sent_message = SentMessage.find_by(message_id: message_replying_to.id)
        update_sent_message.message_status = false
        update_sent_message.save

        update_received_message = ReceivedMessage.find_by(message_id: message_replying_to.id)
        update_received_message.message_status = false
        update_received_message.save
        #ReceivedMessage.find_by(message_id: message_replying_to.id).message_status = false
        #SentMessage.find_by(message_id: message_replying_to.id).message_status = false

        flash[:message_sent] = "Message was sent successfully."
        redirect_to messages_path
        # else
        #   message_replying_to = Message.find(ReceivedMessage.find(params[:id]).message_id)

        #   person_that_sent_message_id = User.find(ReceivedMessage.find(params[:id]).user_sent)

        #   old_message = message_replying_to[:message_content]
        #   new_message = "#{current_user.first_name.capitalize} #{current_user.last_name.capitalize}: #{params[:message_content].capitalize}"
        #   joint_message = [old_message, new_message].join("<br/>")
        #   message_replying_to.message_content = joint_message
        #   ReceivedMessage.find_by(message_id: message_replying_to.id).message_status = false
        #   SentMessage.find_by(message_id: message_replying_to.id).message_status = false
        #   message_replying_to.save
        #   flash[:message_sent] = "Message was sent successfully."
        #   redirect_to messages_path
        # end
    end
    end

    private
    
    def message_params
        #byebug
        params.require(:message).permit(:message_content, :receiver_id, :receiver_profile)
    end
end
