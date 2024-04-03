class ChargingSessionsController < ApplicationController
    before_action :set_charging_session, only: [:update]
  
    def create
        charging_session = ChargingSession.new(charging_session_params)
        if charging_session.save
            render json: charging_session, status: :created
        else
            render json: charging_session.errors, status: :unprocessable_entity
        end
    end
  
    def update
        if @charging_session.update(charging_session_params)
            render json: @charging_session, status: :ok
        else
            render json: @charging_session.errors, status: :unprocessable_entity
        end
    end
  
    private
  
    def set_charging_session
        @charging_session = ChargingSession.find(params[:id])
    end
  
    def charging_session_params
        params.require(:charging_session).permit(:user_id, :status, :start_time, :end_time)
    end
end