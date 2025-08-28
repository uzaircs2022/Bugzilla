# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :handle_unauthorized

  private

  def handle_unauthorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:alert] = I18n.t("pundit.#{policy_name}.#{exception.query}",
                           default: I18n.t("pundit.default", default: "You are not authorized to perform this action."))
    redirect_back(fallback_location: root_path)
  end
end
