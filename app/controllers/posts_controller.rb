class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  include ApplicationHelper

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new    
    @subject = Subject.find_by_id(params[:subject_id])
    @post = Post.new

  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @subject = Subject.find_by_id(params[:subject_id])    
    @post = Post.new post_params.merge! subject_id: @subject.id
    @post.user_id = current_user.id
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: root_path}
      else        
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if isowner(@post)
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to subject_post_path(@subject, @post), notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to subject_post_path(@subject, @post), notice: 'You are not the owner!' }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if isowner(@post)
      @post.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to subject_post_path(@subject, @post), notice: 'You are not the owner!' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      @subject = Subject.find_by_id(params[:subject_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :posted_on, :heroimage)
    end
end
