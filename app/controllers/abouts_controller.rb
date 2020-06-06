class AboutsController < ApplicationController

  def new
    @about = About.new
    # @about.pictures.new


  end

  def create
    About.create(about_params)
    @about = About.new(about_params)
    if @about.save
      redirect_to about_path(@about)
      # redirect_to about_path(@about.id)
    else
      flash.now[:alert] = "Would you fill in?"
      # redirect_to new_about_path
      render :new
    end
  end


  def show


    @about = About.find_by(id: params[:id])
    if @about.nil?
      @abouts = About.all
      flash.now[:alert] = "Your About was not found"
      render :new
    end
  end



  private
  def about_params
    params.require(:about).permit(
      :sex,
      :body,
      :invitation
    ).merge(user_id: current_user.id)
    # ,pictures_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)

  end

end
