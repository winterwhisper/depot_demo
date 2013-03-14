module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def page_title
    action = case params[:action]
    when 'index'
      'listing'
    when 'new'
      'creating'
    when 'edit'
      'editing'
    when 'show'
      'showing'
    end
    entity = params[:action] == 'index' ? params[:controller] : params[:controller].singularize
    [ action.capitalize, entity.capitalize ].join(" ")
  end
end
