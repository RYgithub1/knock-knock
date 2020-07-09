class LessonsController < ApplicationController

  def index
    @lessons = Lesson.page(params[:page]).per(4)
    respond_to do |format|
      format.html
      format.js
    end
  end

end
