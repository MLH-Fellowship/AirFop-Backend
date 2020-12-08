class ProjectsController < ApplicationController


  def index
    @project = Project.all
    json_response(@project)
  end

  def show
    @project = Project.find(params[:id])
    json_response(@project)
  end

  def create
    @project = Project.create(project_params)
    json_response(@project, :created)
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    head :no_content
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end


  private

  # White list params
  def project_params
    params.permit(:id, :project_name, :phase, :award_date, :pop, :customer,
                  :contractor, :pm, :status, :status_comment, :project_num, :funding_source)
  end
end
