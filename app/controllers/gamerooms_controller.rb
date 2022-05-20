class GameroomsController < ApplicationController

  def show
    @gameroom = Gameroom.where(name: params[:id]).first
    if @gameroom
      render status: :found
    else
      render status: :not_found
    end
  end

  def create
    @gameroom = Gameroom.new(gameroom_params)
    if @gameroom.save
      render json: { status: "created", gameroom_name: @gameroom.name }, status: :created
    else
      render json: {status: "error", error_msg: @gameroom.errors.full_messages }, status: :not_acceptable
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
    params.require(:gameroom).permit(:name)
  end
end
