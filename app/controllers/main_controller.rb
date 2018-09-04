class MainController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :search

  def index
  end

  def search
    results = Recipepuppy::Interface.search(search_params)

    render json: results.as_json
  end

  protected

  def search_params
    params.permit(:search, :page)
  end
end
