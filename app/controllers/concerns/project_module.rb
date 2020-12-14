# Functions for the Projects controller
module ProjectModule

  def process_filter(params)
    ops_string = gen_status_string(params)
    date_string = params[:date]
    date_present = false
    start_time = nil
    end_time = nil
    # Processes the dates
    if date_string != 'null' && !date_string.nil?
      date_present = true
      start_time = params[:start_time].to_date
      end_time = params[:end_time].to_date
    end

    @project = nil
    if !ops_string.nil? && !ops_string.empty? && date_present
      @project = Project.where(ops_string).where(award_date: start_time..end_time)
    elsif !ops_string.nil? && !ops_string.empty?
      @project = Project.where(ops_string)
    elsif date_present
      @project = Project.where(award_date: start_time..end_time)
    else
      puts 'There was an error in the query selection'
    end
    json_response(@project)
  end

  # Generate the SQL string for status
  def gen_status_string(params)
    ops_string = ''
    if params != 'null'
      status_keys = { 'Green' => 'false', 'Yellow' => 'false', 'Red' => 'false' }

      status_keys['Green'] = params['Green'] if params.key?('Green')
      status_keys['Yellow'] = params['Yellow'] if params.key?('Yellow')
      status_keys['Red'] = params['Red'] if params.key?('Red')

      status_keys.each do |key, value|
        next unless value.downcase == 'true'

        ops_string << 'or ' if ops_string != ''
        ops_string << "status = '#{key}' "
      end
      ops_string
    end
  end
end
