module EmbedHelper

  def format_content(content)
    if content.present?
      content = convert_video_urls(content)
      content = convert_checkboxes(content)
      content.html_safe
    end
  end

  def convert_video_urls(content)
    new_content = []

    # Split content my paragraph
    content.split('</p>').each do |paragraph|
      if paragraph.include?('youtube.com')
        new_content << parse_youtube(paragraph)

      elsif paragraph.include?('loom.com')
        new_content << parse_loom(paragraph)

      elsif paragraph.include?('vimeo.com')
        new_content << parse_vimeo(paragraph)

      elsif paragraph.include?('soundcloud.com')
        new_content << parse_soundcloud(paragraph)

      else
        new_content << paragraph
      end
    end

    new_content.join('</p>')
  end

  def parse_youtube(string)
    url_delimiters = ['&', "?"]

    id    = string.split(Regexp.union(url_delimiters))[1].split('v=').last
    url   = "https://www.youtube.com/embed/#{id}"
    embed = render "shared/components/video/youtube", url: url
  end

  def parse_loom(string)
    id    = string.split('/').last
    url   = "https://www.loom.com/embed/#{id}"
    embed = render "shared/components/video/loom", url: url
  end

  def parse_vimeo(string)
    id    = string.split('/').last
    url   = "https://player.vimeo.com/video/#{id}"
    embed = render "shared/components/video/loom", url: url
  end

  def parse_soundcloud(string)
    url   = strip_tags(string).split('<p>').first
    embed = render "shared/components/audio/soundcloud", url: url
  end
end
