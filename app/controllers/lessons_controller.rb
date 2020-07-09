class LessonsController < ApplicationController

  def index
    @lessons = Lesson.page(params[:page]).per(4)
  end

end
