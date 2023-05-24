class ApiBaseController < ApplicationController
  before_action :authenticate_api_user

  private

  def authenticate_api_user
    api_key = request.headers['agora-api-key']
    @api_user = ApiUser.find_by(api_key: api_key)

    if @api_user.nil? || @api_user.expired?
      render json: { error: 'Forbidden' }, status: :forbidden
    end
  end
end
