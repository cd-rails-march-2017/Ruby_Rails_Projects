class EventController < ApplicationController
  def index
    ### Why is this session logic not working???
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
  end

  def create
    @event = Event.new(event_info)
    @event.user = User.find(session[:id])
    @event.save
    redirect_to '/event/index'
  end

  ### Is this bad practice using a get route and rendering the html and redoing the "attributes " when making an edit to an event???
  def edit
    @user = User.find(session[:id])
    @events = Event.where(state: @user.state)
    @otherevents = Event.where.not(state: @user.state)
    @event_edit = Event.find(params[:id])
    render 'event/index'
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_info)
    redirect_to "/event/index"
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
