class ProjectsController < ApplicationController


  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create(project_params)
    json_response(@project, :created)
  end

  def update
    @project.update(project_params)
    head :no_content
  end


  private

  def project_params
    params.permit(:project_name, :phase, :award_date, :pop, :customer, :contractor, :pm, :status, :status_comment)
  end
end
