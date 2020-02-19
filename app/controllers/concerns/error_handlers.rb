module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    # @note When specifying rescue_from statements whos exception that has inheritance,
    #       the statements of ancestor exception must be above the statements of progeny exception.
    #       In this case, StandardError must be written above Forbidden and IpAddressRejected.
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
  end

  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  private def rescue404(e)
    render "errors/not_found", status: 404
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end