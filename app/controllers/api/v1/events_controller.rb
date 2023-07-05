class Api::V1::EventsController < ApiBaseController

    # GET :token/events
    def index
        @events = Event.where(token: params[:token].upcase).page(params[:page]).per(25)
        render :index
    end
    
end
