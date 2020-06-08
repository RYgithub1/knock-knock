class AboutsController < ApplicationController

  def new
    @about = About.new
    # aboutモデルと紐付くphotoモデルのインスタンスを作成
    # @about.photos.build
    @about.photos.new

    
    @about.pictures.new
  end

  def create
    # About.create(about_params)
    @about = About.new(about_params)
    # binding.pry
    if @about.save
      redirect_to root_path
      # redirect_to root_path, notice: "Successed Settting"
      # redirect_to about_path
      # redirect_to about_path(id: params[:id])
      # redirect_to about_path(@about)
      # redirect_to about_path(@about.id)
    else
      render :new
      # redirect_to new_about_path
      # flash.now[:alert] = "Would you fill in?"
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
      # :user_id,
      :birthday,
      :sex,
      :body,
      :invitation,
      :recommendation,
      photos_attributes: [:image],
      pictures_attributes: [:image]
    ).merge(user_id: current_user.id)
    # ,pictures_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
