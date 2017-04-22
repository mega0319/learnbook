class SentMessagesController < ApplicationController
    def destroy
        sent_message = SentMessage.find(params[:id])
        sent_message.destroy
        redirect_to messages_path
    end
end
