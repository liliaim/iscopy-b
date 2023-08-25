class SpotsController < ApplicationController
  before_action :move_to_index, except: [:index]

def new
  @spot = Spot.new
  #  binding.pry

end
def create
  @spot = Spot.new(spot_params)
  # binding.pry

  @plan = Plan.find(params[:plan_id]) #planのID
  @spots = Spot.where(user_id: @plan.user_id, prefecture_id: @plan.prefecture_id)

  # binding.pry
  if @spot.save
    redirect_to plan_path(@plan.id)
  else
    render "/plans/show", status: :unprocessable_entity
  end
end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def spot_params
    params.require(:spot).permit(:icon_id,:spot_name,:information,:prefecture_id).merge(user_id: current_user.id)
  end

end
