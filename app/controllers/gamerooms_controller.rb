class GameroomsController < ApplicationController

  def create
    @gameroom = Gameroom.new(gameroom_params)
    if @gameroom.save
      render json: @gameroom  
    else
      render json: "Error", status: :error
    end
  end

  def destroy
    @gameroom = Gameroom.where(name: params[:id]).first
    if @gameroom
      GameroomChannel.broadcast_to(
        @gameroom,
        { status: "destroy" }
      )
      @gameroom.destroy
    end
    head :ok
  end

  private

  def gameroom_params
    params.require(:gameroom).permit(:content)
  end
end
