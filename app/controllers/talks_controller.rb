require 'talk_serializer'
class TalksController < ApplicationController
  include ActionController::StrongParameters

  def index
    @talks = Talk.order("created_at ASC").all
    render json: @talks
  end

  def create
    @talk = Talk.new talk_params
    if @talk.save
      Pusher["houston-lightning-#{Rails.env}"].trigger('newTalk', {
        newTalk: TalkSerializer.new(@talk).as_json
      })
    end

    render json: @talk
  end

  private

  def talk_params
    params.require(:talk).permit(:name, :email, :twitter, :description)
  end
end
