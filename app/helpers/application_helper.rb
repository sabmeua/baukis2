module ApplicationHelper
  def document_title
    # @note "present?" is a instance method of Object class defined by rails.
    #       The entity of this method is negation of "blank?" method, also defined by rails.
    if @title.present?
      "#{@title} - Baukis2"
    else
      "Baukis2"
    end
  end
end
