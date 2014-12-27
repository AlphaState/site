module ApplicationHelper
  def locale_path
    locale = I18n.default_locale? ? I18n.alternative_locale : I18n.default_locale
    if @post.blank?
      url_for(locale: locale)
    else
      posts_path(locale: locale)
    end
  end

  def portfolio_path
    home_path(anchor: 'portfolio')
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
      chunks.join(' / ')
    elsif !@project.blank? and !@project.new_record?
      page_breadcrumbs.join(' / ')
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

  def markdown(text)
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
      link_attributes: {},
    }

    renderer = Redcarpet::Render::HTML.new(render_options)

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
      footnote: false,
    }

    @markdown_engine = Redcarpet::Markdown.new(renderer, extensions)
  end

  def dingbat_tag(id = 'leaf')
    result = <<-EOL
<svg version='1.1' id='#{id}' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 500 500' enable-background='new 0 0 500 500' xml:space='preserve'>
<path d='M352,162v12c0,1.1,0.9,2,2,2h14.2c6.5,0,9.8,4.9,7.4,10.9c-8.1,20.5-26.4,66.6-44.7,113c-1,2.5-2.6,2.5-3.7,0.1L224,64 L100.2,342.5c-2.6,5.8-8.3,9.5-14.6,9.5H66c-1.1,0-2,0.9-2,2v12c0,1.1,0.9,2,2,2h76c1.1,0,2-0.9,2-2v-12c0-1.1-0.9-2-2-2h-13.8 c-6.7,0-10-5-7.3-11.2l28.6-66.4c0.6-1.5,2.1-2.4,3.7-2.4h106.5c1.6,0,3,0.9,3.7,2.4L304,368c-31.5,79.5-50.1,80-64,80 c-15.4,0,4.3-64-32-64c-46.1,0-46.7,84,32,84c28.5,0,54.4-25.2,84-100l72-181.9c2.4-6.1,8.3-10.1,14.9-10.1H430c1.1,0,2-0.9,2-2v-12 c0-1.1-0.9-2-2-2h-76C352.9,160,352,160.9,352,162z M158.5,253.2l45.6-106c1-2.3,2.7-2.3,3.7,0l46.2,106c0.7,1.5-0.2,2.8-1.8,2.8 h-91.8C158.7,256,157.9,254.7,158.5,253.2z'/>
</svg>
    EOL
    result.html_safe
  end
end
