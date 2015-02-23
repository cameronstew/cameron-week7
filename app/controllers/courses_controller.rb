class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def delete
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find(params[:id])
    if @course.destroy
      redirect_to root_path
    end
  end





  private
  def course_params
    params.require(:course).permit(:title, :day)
  end
end
