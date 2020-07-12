class PairsController < ApplicationController

  before_action :login_check_pairs, only: [:index]
  before_action :already_pair_exist_check, only: [:new]
  before_action :create_currentUserAbout_before_pairStart_check, only: [:index, :new]
  before_action :set_pair, only: [:new, :create]


  def index
    @currentHangers = current_user.hangers
    @currentUsersPairs = current_user.users_pairs
    # current_userに紐づく、自分宛の通知passive_notifications
    @notifications = current_user.passive_notifications
  end

  def new
    @pair.users << current_user
    @about = About.find_by(id: params[:format])
  end

  def create
    if @pair.save
      @pair.users = User.where(id: params[:pair][:user_ids])
      redirect_to pair_messages_path(@pair)
    else
      render :new
    end
  end

  def destroy
    @pair = Pair.find_by(id: params[:id])
    @pair.destroy
    redirect_to pairs_path
  end


  private
  def login_check_pairs
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create_currentUserAbout_before_pairStart_check
    currentUserAbout = About.where(user_id: current_user.id)
    if currentUserAbout.blank?
      redirect_to new_about_path
    end
  end

  def already_pair_exist_check
    @about = About.find_by(id: params[:format])
    currentArray = []
    ataboutArray = []
    UsersPair.where(user_id: current_user.id).each do |c|
      currentArray << c.pair_id
    end
    UsersPair.where(user_id: @about.user_id).each do |a|
      ataboutArray << a.pair_id
    end
    commonPairId = currentArray & ataboutArray
    unless commonPairId.empty?
      @pair = Pair.find_by(id: commonPairId)
      redirect_to pair_messages_path(@pair)
    end

    def set_pair
      @pair = Pair.new
    end
  end

end
