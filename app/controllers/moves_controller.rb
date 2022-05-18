class MovesController < ApplicationController

  def create
    @gameroom = Gameroom.find_by(name: params[:gameroom_name])
    @move = Move.new(moves_params)
    @move.gameroom = @gameroom
    if @move.save
      # redirect_to gameroom_path(@gameroom, anchor: "moves-#{@moves.id}")
      GameroomChannel.broadcast_to(
        @gameroom,
        {user_name: @move.user_name, row: @move.row, col: @move.col}
      )
      head :ok
    else
      head :ok
    end
  end

  private

  def moves_params
    params.require(:move).permit(:user_name, :row, :col)
  end
end
