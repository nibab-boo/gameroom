class MovesController < ApplicationController

  def create
    @gameroom = Gameroom.find(params[:gameroom_id])
    @moves = Moves.new(moves_params)
    @moves.gameroom = @gameroom
    if @moves.save
      # redirect_to gameroom_path(@gameroom, anchor: "moves-#{@moves.id}")
      ChatroomChannel.broadcast_to(
        @gameroom,
        @moves
      )
    else
      render "gamerooms/show"
    end
  end

  private

  def message_params
    params.require(:moves).permit(:user_name, :row, :col)
  end
end
