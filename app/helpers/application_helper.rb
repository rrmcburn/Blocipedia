module ApplicationHelper

  def markdown(wiki_text)
    options = {
      filter_html: true,
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      quote: true,
      fenced_code_blocks: true,
      strikethrough: true,
      underline: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
      quote: true,
      fenced_code_blocks: true,
      strikethrough: true,
      underline: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    # markdown.render(wiki_text).html_safe
  end

end
