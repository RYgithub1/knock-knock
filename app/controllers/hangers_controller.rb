class HangersController < ApplicationController

  before_action :set_about, only: [:create, :destroy]


  def create
    hanger = current_user.hangers.new(about_id: params[:about_id])
    hanger.save
    # redirect_to about_path(@about.id)
    # render "create.html.haml"
    # render "ajaxCreateDestroy.js.haml"
  end

  def destroy
    # 以下代替案
    # hanger = current_user.hangers.find_by(about_id: params[:about_id])
    hanger = Hanger.find_by(about_id: params[:about_id], user_id: current_user.id)
    hanger.destroy
    # redirect_to about_path(@about)
    # render "destroy.html.haml"
    # render "ajaxCreateDestroy.js.haml"
  end


  private
  def set_about
    @about = About.new(id: params[:about_id])
  end

end
