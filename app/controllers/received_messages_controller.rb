class ReceivedMessagesController < ApplicationController
    def destroy
        ReceivedMessage.find(params[:id]).destroy
        redirect_to messages_path
    end
end
