class ApplicationController < ActionController::Base
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(staff)/})
      Regexp.last_match[1]
    else
      "application"
    end
  end
end
