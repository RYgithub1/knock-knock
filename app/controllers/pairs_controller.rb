class PairsController < ApplicationController


  def index
    @about = About.all
    # @currentUserEntry=Entry.where(user_id: current_user.id)
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end





end
