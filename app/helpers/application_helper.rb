module ApplicationHelper
  # TODO move to model
  def link_ejs_template_object
    Link.new({
      :title => "<%= item.title %>".html_safe,
      :url   => "<%= item.url %>".html_safe,
      :about => "<%= item.about %>".html_safe
    })
  end

  def phone_number_ejs_template_object
    PhoneNumber.new({
      :name => "<%= item.name %>".html_safe,
      :number   => "<%= item.number %>".html_safe,
    })
  end

  def thought_ejs_template_object
    Thought.new({
      :text => "<%= item.text %>".html_safe,
      :public   => "<%= item.attr('public') %>".html_safe,
    })
  end

  def colour_for(id, default='red')
    @board.pref_colours[id]||default
  rescue
    default
  end

  def render_partial_for(box)
    if box =~ /_rss/
      render :partial => '/rss_boxes/box'
    else
      render :partial => "/#{box.sub(/_box$/, '/box')}"
    end
  end

  # XXX i dont like it
  def render_jsinit_for(box)
    if box =~ /_rss/
      render :partial => '/rss_boxes/jsinit', :locals => {:box => box}
    else
      render :partial => "/#{box.sub(/_box$/, '/jsinit')}"
    end
  end

end
