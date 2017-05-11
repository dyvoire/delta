class SchoolsController < ApplicationController


  def index
    @schools = School.all
  end

  def show
    @user = @School.user
    @school = School.where(user: @user)
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @school.user = current_user
    @school = current_user.school.build(school_params)
    @school.save
    # @livestream.livestream = @livestream.id
    if @school.save
      redirect_to school_path(@school)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def school_params
    params.require(:school).permit(:name)
  end


end

