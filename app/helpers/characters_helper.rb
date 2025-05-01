module CharactersHelper
    def youtube_video_id(url)
      return nil unless url.present?
  
      uri = URI.parse(url) rescue nil
      return nil unless uri
  
      if uri.host.include?("youtu.be")
        # 短縮URL対応
        return uri.path[1..]
      elsif uri.host.include?("youtube.com")
        # watch?v=xxxx 対応
        CGI.parse(uri.query)["v"]&.first
      else
        nil
      end
    end
  end  