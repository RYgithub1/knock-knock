class MapsController < ApplicationController
  require "open-uri"
  require "nokogiri"
  require "news-api"


  def index
    # ===== Marker Position ============================
    gon.nameArray = []
    gon.aboutIdArray = []
    gon.latArray = []
    gon.lngArray = []
    gon.invArray = []

    # ----- pick noneAboutUser to skip -----------
    userIdArray = []
    noneAboutUserIdArray = []
    User.all.each do |user|
      userIdArray << user.id
    end
    userIdArray.each do |userId|
      if About.where(user_id: userId).blank?
        noneAboutUserIdArray << userId
      end
    end

    # ----- send allUserGon [user.id order] ------
    User.all.each do |user|
      noneAboutUserIdArray.each do |noneAboutUserId|
        if user.id == noneAboutUserId
          # ````` skip noneAboutUserName `````
        else
          gon.nameArray << user.name
        end
      end
    end
    About.all.order(user_id: "ASC").each do |about|
      gon.aboutIdArray << about.id
      gon.latArray << about.latitude
      gon.lngArray << about.longitude
      gon.invArray << about.invitation
    end


    # ===== Center Coordinate   ========================
    if user_signed_in? && About.find_by(user_id: current_user.id).present?
      @signInCurrentUserAbout = About.find_by(user_id: current_user.id)
      gon.currentUserName = current_user.name
      gon.currentUserAboutId = @signInCurrentUserAbout.id
      gon.currentUserLat = @signInCurrentUserAbout.latitude
      gon.currentUserLng = @signInCurrentUserAbout.longitude
      gon.currentUserInv = @signInCurrentUserAbout.invitation
    end


    # ===== News =======================================
    newsApi = News.new("5a31e51cd4534b059937d4cc7bf271ba")

    @scoops = newsApi.get_everything(q:"travel", from:"2020-06-10", to:"2020-07-03", pageSize:"5", language:"en", sortBy: "popularity")

  end

end






