class AboutsController < ApplicationController
  # before_action :set_xxx, except: [:index, :new, :create]



  def new
    # @about = About.find_by(id: params[:id])
    @about = About.new
    # aboutモデルと紐付くxxxモデルの,インスタンスを作成
    @about.photos.new
    @about.pictures.new
  end

  def create
    # @about = About.find_by(id: params[:id])
    @about = About.new(about_params)
    if @about.save
      # redirect_to root_path(@about)
      redirect_to about_path(@about.id)
      # redirect_to about_path
      # redirect_to about_path(id: params[:id])
      # redirect_to about_path(@about)
      # redirect_to about_path(@about.id) これやろフリマより！
    else
      render :new
      # redirect_to new_about_path
      # flash.now[:alert] = "Would you fill in?"
    end
  end


  def show
    @about = About.find_by(id: params[:id])
    # @user = @about.user
    # @tags = @about.tags
    @photos = Photo.where(id: @about.photos.ids)
    @pictures = Picture.where(id: @about.pictures.ids)
    # if @about.nil?
    #   flash.now[:alert] = 'Your "About ME" was not found.'
    #   render :new
    # end
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

  # def destroy
  #   @about.destroy
  #   redirect_to root_path
  # end


  # === Strong parameter =======================
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

end
