class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Optional: only keep this if you actually use I18n switching
  def switch_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end