module ProjectModule

  def process_filter(params)
    filter_ops = params[:filter]
    if filter_ops
      status_ops = params[:filter][:status]
      unless status_ops.nil?
        ops_string = ''
        status_ops.each do |key, value|
          next unless value.downcase == 'true'

          ops_string << 'or ' if ops_string != ''
          ops_string << "status = '#{key}' "
        end
        unless ops_string.empty?
          @project = Project.where(ops_string)
          json_response(@project)
        end
      end
    end
  end
end
