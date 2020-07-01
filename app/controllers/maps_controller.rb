class MapsController < ApplicationController

  def index
    if user_signed_in? && About.find_by(user_id: current_user.id).present?
      @signInCurrentUserAbout = About.find_by(user_id: current_user.id)

      gon.nameArray = []
      gon.aboutIdArray = []
      gon.latArray = []
      gon.lngArray = []
      gon.invArray = []

      gon.nameArray << current_user.name
      gon.aboutIdArray << @signInCurrentUserAbout.id
      gon.latArray << @signInCurrentUserAbout.latitude
      gon.lngArray << @signInCurrentUserAbout.longitude
      gon.invArray << @signInCurrentUserAbout.invitation

      User.all.where.not(id: current_user.id).each do |user|
        gon.nameArray << user.name
      end
      About.all.where.not(user_id: current_user.id).each do |about|
        gon.aboutIdArray << about.id
        gon.latArray << about.latitude
        gon.lngArray << about.longitude
        gon.invArray << about.invitation
      end

    else
      @abouts = About.all
    end
  end

end
