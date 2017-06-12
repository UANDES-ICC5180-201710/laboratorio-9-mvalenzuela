class PeopleInterestsController < ApplicationController
  before_action :set_people_interest, only: [:show, :edit, :update, :destroy]

  # GET /people_interests
  # GET /people_interests.json
  def index
    @people_interests = PeopleInterest.all
  end

  # GET /people_interests/1
  # GET /people_interests/1.json
  def show
  end

  # GET /people_interests/new
  def new
    @people_interest = PeopleInterest.new
  end

  # GET /people_interests/1/edit
  def edit
  end

  # POST /people_interests
  # POST /people_interests.json
  def create
    @people_interest = PeopleInterest.new(people_interest_params)

    respond_to do |format|
      if @people_interest.save
        format.html { redirect_to @people_interest, notice: 'People interest was successfully created.' }
        format.json { render :show, status: :created, location: @people_interest }
      else
        format.html { render :new }
        format.json { render json: @people_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people_interests/1
  # PATCH/PUT /people_interests/1.json
  def update
    respond_to do |format|
      if @people_interest.update(people_interest_params)
        format.html { redirect_to @people_interest, notice: 'People interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @people_interest }
      else
        format.html { render :edit }
        format.json { render json: @people_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_interests/1
  # DELETE /people_interests/1.json
  def destroy
    @people_interest.destroy
    respond_to do |format|
      format.html { redirect_to people_interests_url, notice: 'People interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_people_interest
      @people_interest = PeopleInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def people_interest_params
      params.require(:people_interest).permit(:person_id, :course_id)
    end
end
