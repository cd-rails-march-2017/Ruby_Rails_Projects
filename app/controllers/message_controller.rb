class MessageController < ApplicationController
  def create
    Message.create(content: params[:comment], event_id: params[:event], user_id: session[:id])
    redirect_to "/event/detail/#{params[:event]}"
  end
end
