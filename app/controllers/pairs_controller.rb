class PairsController < ApplicationController


  def new
    @pair = Pair.new
    # @pair.users << current_user
    @about = About.find_by(id: params[:format])
  end
  def create
    @pair = Pair.new(pair_params)
    if @pair.save
    # redirect_to pair_path(pair.id)
      # redirect_to pair_messages_path(pair.id)
      redirect_to root_path
    else
      render :new
    end
  end






  def show
  end
  def destroy
  end


  private
  def pair_params
    params.require(:pair).permit(:name, user_ids:[])
    # params.require(:pair).permit(:name, user_ids:[]).merge(user_id: current_user.id)
  end


end
