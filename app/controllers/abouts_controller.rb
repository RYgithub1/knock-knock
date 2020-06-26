class AboutsController < ApplicationController

  before_action :oneUser_oneAbout_check, only: [:new, :create]
  before_action :noCurrentUserAbout_then_canNotWatchOtherAbout_check, only: [:show, :edit, :update]
  # before_action :set_about, only: [:show, :edit, :update]


  def new
    @about = About.new
    # new 2 instances, related to About model
    @about.photos.new
    @about.pictures.new
  end

  def create
    @about = About.new(about_params)
    if @about.save
      redirect_to about_path(@about.id)
    else
      render :new
    end
  end

  def show
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
  end

                  
  def edit
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
  end

  def update
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
    if @about.update(about_params)
      redirect_to about_path(@about.id)
    else
      # なぜかこっち photo のときは、newもeditも？
      redirect_to edit_about_path(@about.id)

    end
  end


  private
  def about_params
    params.require(:about).permit(
      :sex,
      :body,
      :birthday,
      :tag_list,
      # tag_ids: [],
      :nation_id,
      :invitation,
      :recommendation,
      photos_attributes: [:image, :_destroy, :id],
      pictures_attributes: [:image, :_destroy, :id]
    ).merge(user_id: current_user.id)
  end

  def oneUser_oneAbout_check
    if About.find_by(user_id: current_user.id).present?
      redirect_to about_path(About.find_by(user_id: current_user.id).id)
    end
  end

  def noCurrentUserAbout_then_canNotWatchOtherAbout_check
    if About.find_by(user_id: current_user.id).blank?
      redirect_to new_about_path
    end
  end

end
