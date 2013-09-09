class TalksController < ApplicationController
  include ActionController::StrongParameters

  def index
    @talks = Talk.all
    render json: @talks
  end

  def create
    @talk = Talk.new talk_params
    @talk.save
    render json: @talk
  end

  private

  def talk_params
    params.require(:talk).permit(:name, :email, :twitter, :description)
  end
end
