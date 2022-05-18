class GameroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # gameroom = Gameroom.find(params[:id])
    gameroom = Gameroom.find_by(name: params[:name])
    stream_for gameroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
