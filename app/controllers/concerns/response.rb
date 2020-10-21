# Function called that returns responses as a JSON
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end