# Controller for the Projects
class ProjectsController < ApplicationController
  include ProjectModule

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

  def proj_by_name
    name_param = CGI.unescape(params[:name])
    @project = Project.where(project_name: name_param)
    json_response(@project)
  end

  # Performs the query operation
  def query
    process_filter(params)
  end


  private

  # White list params
  def project_params
    params.permit(:id, :project_name, :phase, :award_date, :pop, :customer,
                  :contractor, :pm, :status, :status_comment, :project_num, :funding_source,
                  :name, :filter)
  end
end
