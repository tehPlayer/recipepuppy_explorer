module ControllerSupport
  # We don't want to parse response in each spec
  def response_json
    JSON.parse(response.body).deep_symbolize_keys
  end
end
