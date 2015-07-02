class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  attr_reader :current_user

  before_filter :allow_ajax_request_from_other_domains

  def allow_ajax_request_from_other_domains
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
  end

  private

  def authenticated?
    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by_username(username)
      @current_user = user && user.authenticate(password)

    end
  end

end
