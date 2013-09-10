class AdminController < ActionController::Base

  def start
    Talk.update_all(:current_talk=>false)
    @talk = Talk.find(params['talk']['id'])
    @talk.current_talk = true
    @talk.started_at = Time.now
    if @talk.save
      Pusher["houston-lightning-#{Rails.env}"].trigger('startTalk', {
        id: @talk.id
      })
    end
    render json: TalkSerializer.new(@talk).as_json
  end

  def destroy
    Talk.destroy params[:id]
    Pusher["houston-lightning-#{Rails.env}"].trigger('destroyTalk', {
      id: params[:id]
    })
    head :ok
  end

  def authenticate
    valid = params[:password].to_i == 42
    if valid
      session[:admin] = true
    end
    render text: valid
  end
end
