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
    binding.pry
    @pair = Pair.new(pair_params)
    if @pair.save
      redirect_to root_path
    else
      render :new
    end
  end

  # @userspair = UsersPair.new(userspair_params)
  # @pair = Pair.where(pair_id: pair_params[:user_ids])
  # @about = About.find_by(id: params[:format])
  # @user = User.all
  # binding.pry


  def show
  end
  def destroy
  end


  private
  def pair_params
    params.require(:pair).permit(:name, user_ids: [])
  end

    # params.require(:pair).permit(:name, users_ids: [])
    # params.require(:pair).permit(:name)
    # params.require(:pair).permit(:name, :user_id, :pair_id)
    # params.require(:pair).permit(:name, user_ids:[]).merge(user_id: current_user.id)
    # params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
    

  # def userspair_params
  #   params.require(:userspair_params).permit(user_ids:[], pair_ids:[])
  # end

end
