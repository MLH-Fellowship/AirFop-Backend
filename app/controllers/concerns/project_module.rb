module ProjectModule
  require 'time'

  def process_filter(params)
    filter_ops = params[:filter]
    if filter_ops
      ops_string = gen_status_string(params[:filter][:status])
      date_string = params[:filter][:date]
      date_present = false
      start_time = nil
      end_time = nil
      if date_string != 'null' && !date_string.nil?
        date_present = true
        start_time = Time.parse(params[:filter][:date][:start])
        end_time = Time.parse(params[:filter][:date][:end])
      end

      @project = nil
      if !ops_string.empty? && date_present
        @project = Project.where(ops_string, award_date: start_time..end_time)
      end

      unless ops_string.empty?
        @project = Project.where(ops_string)
        json_response(@project)
      end
    end
  end

  # Generate the SQL string for status
  def gen_status_string(status_ops)
    ops_string = ''
    status_ops&.each do |key, value|
      next unless value.downcase == 'true'

      ops_string << 'or ' if ops_string != ''
      ops_string << "status = '#{key}' "
    end
    ops_string
  end

  def gen_date_string(date_ops)
    ops_string = ''
    date_ops&.each do |key, value|

    end
  end
end
