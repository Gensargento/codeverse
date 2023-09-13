class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  def dashboard
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
     @post = Post.find(params[:id])
     @lesson = find_current_lesson
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  def toggle_complete
    @lesson = find_current_lesson
    @lesson.is_completed = !@lesson.is_completed
    @lesson.save
    post = Post.find(params[:id])
    redirect_to post_path(post)
  end

  def find_current_lesson
    current_post = Post.find(params[:id])
    lessons = lessons_by_user
    lessons.each do |lesson|
      if current_post.id == lesson.number
        return lesson
      end
    end
  end

  def lessons_by_user
    lessons = Lesson.all 
    lessons.select do |lesson|
    lesson.user_id == current_user.id
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
