module ApplicationHelper
  def locale_path
    locale = I18n.default_locale? ? I18n.alternative_locale : I18n.default_locale
    if @post.blank?
      url_for locale: locale
    else
      posts_path locale: locale
    end
  end

  def portfolio_path
    home_path anchor: 'portfolio'
  end

  def page_breadcrumbs
    chunks = []

    chunks << t('company')

    chunks << t(
      "#{params[:controller]}.#{params[:action]}.title", default: t(
      "#{params[:controller]}.title"))

    if !@post.blank? and !@post.new_record?
      chunks << @post.title
    elsif !@project.blank? and !@project.new_record?
      chunks << @project.title
    end

    chunks
  end

  def page_title
    page_breadcrumbs.reverse.join(' / ')
  end

  def page_description
    if !@post.blank? and !@post.new_record?
      chunks = page_breadcrumbs
      chunks << @post.description
      chunks.join ' / '
    elsif !@project.blank? and !@project.new_record?
      page_breadcrumbs.join ' / '
    else
      t 'description'
    end
  end

  def page_keywords
    t 'keywords'
  end

  def page_labels
    "#{params[:controller]} #{params[:action]}"
  end

  def markdown text
    markdown_engine.render(text).html_safe
  end

  def markdown_engine
    return @markdown_engine if defined?(@markdown_engine)

    render_options = {
      filter_html: true,
      no_images: false,
      no_links: false,
      no_styles: true,
      safe_links_only: false,
      with_toc_data: false,
      hard_wrap: false,
      xhtml: false,
      prettify: false,
      link_attributes: {}
    }

    renderer = Redcarpet::Render::HTML.new render_options

    extensions = {
      no_intra_emphasis: true,
      tables: false,
      fenced_code_blocks: false,
      autolink: false,
      disable_indented_code_blocks: true,
      strikethrough: false,
      lax_spacing: true,
      space_after_headers: true,
      superscript: false,
      underline: false,
      hightlight: false,
      quote: false,
      footnote: false
    }

    @markdown_engine = Redcarpet::Markdown.new renderer, extensions
  end

  def dingbat_tag id = 'leaf'
    result = <<-EOL
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 560 560 560" enable-background="new 0 560 560 560" xml:space="preserve">
  <symbol  id="#{id}" viewBox="-125.6 -120.5 251.1 241">
    <path d="M125.6,17.3c0-77.2-62.8-137.8-143.6-137.8c-58.4,0-107.5,43.3-107.5,90.2c0,30.3,20.9,52.7,44.7,52.7 c15.9,0,31.8-12.3,31.8-28.9c0-18-13.7-31-29.6-31c-7.9,0-18.8,3.6-22.4,7.9c-12.3,11.5-18.8,2.2-19.5-3.6 c-1.4-32.5,28.9-67.1,88.8-67.1c64.9,0,138.5,65.7,138.5,127.7c0,58.4-37.5,88.8-71.4,87.3c-7.9-1.4-15.2-6.5-3.6-17.3 c5.1-2.9,8.7-14.4,8.7-21.6c0-15.9-14.4-28.9-32.5-28.9s-31,15.2-31,31c0,22.4,23.8,42.6,55.6,42.6C80.8,120.5,125.6,75,125.6,17.3 z"/>
  </symbol>
  <use xlink:href="##{id}"  width="251.1" height="241" x="-125.6" y="-120.5" transform="matrix(1 0 0 -1 140 707.2274)" overflow="visible"/>
  <use xlink:href="##{id}"  width="251.1" height="241" x="-125.6" y="-120.5" transform="matrix(-1 0 0 -1 420 707.2274)" overflow="visible"/>
  <use xlink:href="##{id}"  width="251.1" height="241" x="-125.6" y="-120.5" transform="matrix(1 0 0 1 140 970)" overflow="visible"/>
  <use xlink:href="##{id}"  width="251.1" height="241" x="-125.6" y="-120.5" transform="matrix(-1 0 0 1 420 970)" overflow="visible"/>
</svg>
    EOL
    result.html_safe
  end
end
