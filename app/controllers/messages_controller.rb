class MessagesController < ApplicationController

    def index
        @user = User.find(session[:user_id])
        @messages = @user.messages
    end 

    def new 
        @message  = Message.new 
        @user = User.find(session[:user_id])
        @forums = @user.forums
    end

    def create
        @user = User.find(session[:user_id])
        @message  = Message.new(message_params)
     
        if @message.save 
            redirect_to user_path(@user)
        else 
            flash[:errors] = @message.errors.full_messages 
            redirect_to new_message_path
        end 
    end

    def edit 
        @user = User.find(session[:user_id])
        @message  = @user.messages.find(params[:id])
    end 


    def update 
        @message  = message.find(params[:id])
        @message.update(message_params)

        if @message.save 
            redirect_to message_path(@message)
        else 
            flash[:errors] = @message.errors.full_messages 
            redirect_to edit_message_path
        end 
    end 

    def destroy
        @user = User.find(session[:user_id])
        @message = @user.messages.find(params[:id])
        @message.destroy
        
        redirect_to user_path(@user)
    end


    private 

    def message_params 
        params.require(:message).permit(:comment, :mood, :forum_id)
    end 
end
