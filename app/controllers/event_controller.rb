class EventController < ApplicationController
  def index
    # Why is this session logic not working???
    if session[:id].nil?
      redirect_to '/user/index'
    else
      @user = User.find(session[:id])
      @events = Event.where(state: @user.state)
      @otherevents = Event.where.not(state: @user.state)
    end
  end

  def detail
    @event = Event.find(params[:id])
    @messages = Message.all
    @attendees = Attendee.where(event_id: params[:id])
    puts "$" * 50
    puts @attendees
  end

  def create
    @event = Event.new(event_info)
    @event.user = User.find(session[:id])
    @event.save
    redirect_to '/event/index'
  end

  ### Need to get edit populating...in event/index page...can I do a redirect like this while passing an attribute?
  def edit
    @eventedit = Event.find(params[:id])
    redirect_to '/event/index'
  end

  def delete
    Event.find(params[:id]).delete
    redirect_to '/event/index'
  end

  private
  def event_info
    params.require(:event).permit(:name, :date, :location, :state)
  end
end
