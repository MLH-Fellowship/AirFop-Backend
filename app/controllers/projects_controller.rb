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

  def proj_by_name
    name_param = CGI.unescape(params[:name])
    @project = Project.where(project_name: name_param)
    json_response(@project)
  end

  def query
    filter_ops = params[:filter]
    puts 'Called Query'
    if filter_ops
      puts 'Inside the first if statement'
      status_ops = params[:filter][:status]
      unless status_ops.nil?
        puts 'Inside the second if statement'
        ops_array = []
        status_ops.each do |key, value|
          if value.downcase == 'true'
            ops_array.append(key)
          end
        end

        # TODO get the actual records
        puts "This is ops array"
        puts ops_array
        status_results = ops_array.join(' or status = ')
        @project = Project.where("status = '#{ops_array[0]}'")
        json_response(@project)
      end
    end
  end


  private

  # White list params
  def project_params
    params.permit(:id, :project_name, :phase, :award_date, :pop, :customer,
                  :contractor, :pm, :status, :status_comment, :project_num, :funding_source,
                  :name, :filter)
  end
end
