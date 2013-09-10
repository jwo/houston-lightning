class AngularController < ActionController::Base
  def index
    @talks = Talk.ordered
  end
end
