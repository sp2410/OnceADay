class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  include ApplicationHelper

  # GET /sections
  # GET /sections.json
  def index
    @sections = Section.all
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @post = Post.find(params[:post_id])
    @subject = Subject.find_by_id(params[:subject_id])
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    
      @subject = Subject.find_by_id(params[:subject_id])
      @post = Post.find(params[:post_id])    
      @section = Section.new section_params.merge! post_id: @post.id
      # @section = Section.new(section_params)

      respond_to do |format|
        if @section.save
          format.html { redirect_to subject_post_path(@subject, @post), notice: 'Section was successfully created.' }
          format.json { render :show, status: :created, location: subject_post_path(@subject, @post) }
        else
          format.html { render :new }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end    
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    if isowner(@post)
      respond_to do |format|
        if @section.update(section_params)
          format.html { redirect_to subject_post_path(@subject, @post), notice: 'Section was successfully updated.' }
          format.json { render :show, status: :ok, location: @section }
        else
          format.html { render :edit }
          format.json { render json: @section.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|        
          format.html { redirect_to subject_post_path(@subject, @post), notice: 'You are not the owner!' }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    if isowner(@post)
      @section.destroy
      respond_to do |format|
        format.html { redirect_to subject_post_path(@subject, @post), notice: 'Section was successfully destroyed.' }
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
    def set_section
      @post = Post.find(params[:post_id])
      @subject = Subject.find_by_id(params[:subject_id])
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:content_type, :contents, :external_url)
    end
end
