class HangersController < ApplicationController

  before_action :set_abouts, only: [:create, :destroy]


  def create
    hanger = current_user.hangers.new(about_id: params[:about_id])
    hanger.save
    redirect_to about_path(@about.id)
  end

  def destroy
    hanger = Hanger.find_by(about_id: params[:about_id], user_id: current_user.id)
    hanger.destroy
    redirect_to about_path(@about)
  end


  private
  def set_abouts
    @about = About.new(id: params[:about_id])
  end

end
