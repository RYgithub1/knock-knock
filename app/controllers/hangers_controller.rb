class HangersController < ApplicationController

  def create
    @about = About.new(id: params[:about_id])
    hanger = current_user.hangers.new(about_id: params[:about_id])
    hanger.save
    redirect_to about_path(@about.id)
  end

  def destroy
    @about = About.new(id: params[:about_id])
    hanger = Hanger.find_by(about_id: params[:about_id], user_id: current_user.id)
    hanger.destroy
    redirect_to about_path(@about)
  end


end
