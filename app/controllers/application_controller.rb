class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :authenticated?, :current_user

  private

  def check_authentication
    redirect_to new_session_path unless authenticated?
  end

  def authenticated?
    current_user.present?
  end

  class User
    attr_reader :login, :password
    def initialize(login, password)
      @login, @password = login, password
    end
  end

  def current_user
    if session[:login].present? && session[:password].present?
      User.new session[:login], session[:password]
    end
  end

  def jira_client
    options = {
      :username     => current_user.login,
      :password     => current_user.password,
      :site         => 'https://devprg.atlassian.net',
      :context_path => '',
      :auth_type    => :basic

    }

    @jira_client ||= JIRA::Client.new(options)
  end
end
