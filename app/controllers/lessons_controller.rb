class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]

  # GET /lessons or /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  def show_lessons
    @lessons = lessons_by_user
  end

  def dashboard
    @lessons = lessons_by_user
    @post = Post.all
    @completed_lessons = count_finished_lessons
    @ongoing_lessons = count_ongoing_lessons
  end

  def count_ongoing_lessons
    lesson = lessons_by_user
    count = 0
    lesson.each do |lesson|
      if lesson.is_completed == false
        count += 1
      end
    end
    return count
  end
  def count_finished_lessons
    lesson = lessons_by_user
    count = 0
    lesson.each do |lesson|
      if lesson.is_completed == true 
        count += 1
      end
    end
    return count
  end

  def count_ongoing_lessons
    lesson = lessons_by_user
    count = 0
    lesson.each do |lesson|
      if lesson.is_completed == false 
        count += 1
      end
    end
    return count

  end

  def lessons_by_user
    lessons = Lesson.all 
    lessons.select do |lesson|
    lesson.user_id == current_user.id
    end
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:id, :number, :user_id)
    end
end
