class PairsController < ApplicationController


  def new
    @pair = Pair.new
    # 配列に要素追加
    @pair.users << current_user
  
    @about = About.find_by(id: params[:format])
    # @user = User.all
    # binding.pry
    # @userspair = UsersPair.new
  end

  def create
    # binding.pry

    # @pair = Pair.where(pair_id: pair_params[:user_ids])
    @pair = Pair.new(pair_params)
    # @userspair = UsersPair.new(userspair_params)

    # @about = About.find_by(id: params[:format])
    # @user = User.all

    # binding.pry
    if @pair.save
      # - binding.pry
      # redirect_to pair_path(pair.id)
      # redirect_to pair_path(@pair)
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
    params.require(:pair).permit(:name, user_ids: [])
    # params.require(:pair).permit(:name, users_ids: [])
    # params.require(:pair).permit(:name)
    # params.require(:pair).permit(:name, :user_id, :pair_id)
    # params.require(:pair).permit(:name, user_ids:[]).merge(user_id: current_user.id)
    # params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
  # def userspair_params
  #   params.require(:userspair_params).permit(user_ids:[], pair_ids:[])
  # end

end
