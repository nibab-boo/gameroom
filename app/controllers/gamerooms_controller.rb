class GameroomsController < ApplicationController
  def show
    @gameroom = Gameroom.find(params[:id])
    render json: @gameroom
  end

  def create
    @gameroom = Gameroom.new(gameroom_params)
    if @gameroom.save
      render json: @gameroom  
    else
      render json: "Error", status: :error
    end
  end

  private

  def gameroom_params
    params.require(:gameroom).permit(:content)
  end
end
