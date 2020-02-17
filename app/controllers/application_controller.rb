class ApplicationController < ActionController::Base
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  # @note When specifying rescue_from statements whos exception that has inheritance,
  #       the statements of ancestor exception must be above the statements of progeny exception.
  #       In this case, StandardError must be written above Forbidden and IpAddressRejected.
  rescue_from StandardError, with: :rescue500
  rescue_from Forbidden, with: :rescue403
  rescue_from IpAddressRejected, with: :rescue403

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "application"
    end
  end

  private def rescue403(e)
    @exception = e
    render "errors/forbidden", status: 403
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end
end
