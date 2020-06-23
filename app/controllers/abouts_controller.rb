class AboutsController < ApplicationController

  # before_action :set_xxx, except: [:index, :new, :create]
  before_action :one_about_check, only: [:new, :create]


  def new
    @about = About.new
    # aboutモデルに紐付く各モデルのインスタンスの設定が必要
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
      render :edit
    end
  end

  def destroy
  #   @about.destroy
  #   redirect_to root_path
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

  def one_about_check
    if About.find_by(user_id: current_user.id).present?
      redirect_to about_path(About.find_by(user_id: current_user.id).id)
    end
  end

end
