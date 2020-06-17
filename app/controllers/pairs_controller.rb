class PairsController < ApplicationController


  def new
    @pair = Pair.new
    @pair.users << current_user
    @about = About.find_by(id: params[:format])
  end

  def create
    @pair = Pair.new(pair_params)
    if @pair.save
      @pair.users = User.where(id: params[:pair][:user_ids])
      redirect_to pair_messages_path(@pair)
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
    params.require(:pair).permit(:name)
    # 仕様変更時に下記へ修正
    # params.require(:pair).permit(:name, {user_ids:[]}).merge(user_id: current_user.id, about_id: params[:about_id])
  end
end
