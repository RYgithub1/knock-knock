class HangersController < ApplicationController

  before_action :set_hanger, only: [:create, :destroy]


  def create
    hanger = current_user.hangers.new(about_id: params[:about_id])
    hanger.save
  end

  def destroy
    # 代替案
    # hanger = current_user.hangers.find_by(about_id: params[:about_id])
    hanger = Hanger.find_by(about_id: params[:about_id], user_id: current_user.id)
    hanger.destroy
  end


  private
  def set_hanger
    @about = About.new(id: params[:about_id])
  end

end
