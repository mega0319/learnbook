class ReceivedMessagesController < ApplicationController
    def destroy
        #byebug
        ReceivedMessage.find(params[:id]).destroy
        redirect_to messages_path
    end
end
