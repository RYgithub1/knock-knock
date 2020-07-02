class MapsController < ApplicationController


  def index
    # ===== define initial ==========================
    gon.nameArray = []
    gon.aboutIdArray = []
    gon.latArray = []
    gon.lngArray = []
    gon.invArray = []

    # ===== 【１】currentUser info exist   ================
    if user_signed_in? && About.find_by(user_id: current_user.id).present?
      # ----- insert currentUser info ------------
      @signInCurrentUserAbout = About.find_by(user_id: current_user.id)
      gon.nameArray << current_user.name
      gon.aboutIdArray << @signInCurrentUserAbout.id
      gon.latArray << @signInCurrentUserAbout.latitude
      gon.lngArray << @signInCurrentUserAbout.longitude
      gon.invArray << @signInCurrentUserAbout.invitation

      # ----- pick noneAboutUser to skip ---------
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

      # ----- send gon ---------------------------
      # ````` [currentUser -> user.id number] ````
      User.all.where.not(id: current_user.id).each do |user|
        noneAboutUserIdArray.each do |noneAboutUserId|
          if user.id == noneAboutUserId
            # ````` skip noneAboutUserName `````
          else
            gon.nameArray << user.name
          end
        end
      end
      About.all.where.not(user_id: current_user.id).order(user_id: "ASC").each do |about|
        gon.aboutIdArray << about.id
        gon.latArray << about.latitude
        gon.lngArray << about.longitude
        gon.invArray << about.invitation
      end

    # ===== 【２】no currentUser =========================
    else
      @abouts = About.all
    end
  end


end
