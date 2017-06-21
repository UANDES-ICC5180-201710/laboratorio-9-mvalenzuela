  class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    #@courses.each do |course|
      #course.likes =
    #end
    @courses_of_interest = current_person.interest_courses
    if params[:title]
      @courses = @courses.where("lower(title) like ?", "%#{params[:title]}%")
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    puts(@course.people)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def ajaxFunction
   valor = params['course_id']
   if PeopleInterest.exists?(person_id: current_person.id, interest_course: valor)
     PeopleInterest.where(person_id: current_person.id, interest_course: valor).destroy_all
   else
     @person_interest = PeopleInterest.new
     @person_interest.person = current_person
     @person_interest.interest_course = Course.find(valor)
     @person_interest.save
   end
   course = Course.find(valor)
   likes = course.people.count
   rez = {"likes" => likes}
   respond_to do |format|
     format.json { render json: likes }  # respond with the created JSON object
   end
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      teacher_id = params.require(:course)[:teacher]
      if teacher_id
        teacher = Person.find(teacher_id)
      else
        teacher = nil
      end

      params.require(:course).permit(
        :title, :code, :quota
      ).merge(:teacher => teacher)
    end
end
