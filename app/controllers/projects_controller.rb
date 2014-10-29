class ProjectsController < ApplicationController
  before_action :admin_only
  before_action :set_resource, except: [:index, :new, :create]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project successfully deleted' }
      format.json { head :no_content }
    end
  end

  private

  def set_resource
    @project = Project.find(params[:id]) || nil
  end

  def project_params
    params.require(:project).permit(:title, :summary, :detail, :url)
  end
end
