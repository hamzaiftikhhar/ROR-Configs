class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  allow_browser versions: :modern
  stale_when_importmap_changes

  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end