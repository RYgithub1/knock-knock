class AboutsController < ApplicationController

  skip_before_action :verify_authenticity_token
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
      redirect_to new_about_path
    end
  end

  def show
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
    # ------
    # あるいは緯度経度のみ指定
    # @currentUserAbout = About.find_by(user_id: current_user.id)
    # gon.currentUserAbout = @currentUserAbout
    gon.currentUserAbout = @about
    # gon.currentUserPhotos = @photos
    # gon.currentUserPictures = @pictures
  end

  def edit
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
    # ------
  end

  def update
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
    # ------
    if @about.update(about_params)
      redirect_to about_path(@about.id)
    else
      redirect_to edit_about_path(@about.id)
    end
    # respond_to do |format|
    #   # format.html { updated ? redirect_to about_path(@about.id) : redirect_to edit_about_path(@about.id) }
    #   format.json { render json: flash.to_hash }
    # end
  end

  def search_location
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    binding.pry
end



  private
  def about_params
    params.require(:about).permit(
      :sex,
      :body,
      :address,
      :birthday,
      :tag_list,
      # tag_ids: [],
      :latitude,
      :longitude,
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

  def set_about
    @about = About.find_by(id: params[:id])
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
  end

end
