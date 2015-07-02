class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  attr_reader :current_user

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def index
    @users = User.all

    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by_username(username)
      @current_user = user && user.authenticate(password)

    end
  end

end
