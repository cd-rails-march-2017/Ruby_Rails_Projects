class AttendeeController < ApplicationController
  def join
    @attendee = Attendee.new()
    @attendee.event_id = params[:id]
    @attendee.user_id = session[:id]
    @attendee.save
    redirect_to "/event/index"
  end

  def cancel
    @attendee = Attendee.find_by(event_id: params[:id], user_id: session[:id])
    @attendee.delete
    redirect_to "/event/index"
  end
end
