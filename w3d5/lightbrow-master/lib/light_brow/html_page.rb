module LightBrow
  class HTMLPage


    def initialize(html)
      @html = html
    end

    def title
      content.title
    end

    def description
      tag = content.css('meta[name="description"]').first
      tag.attributes['content'].value if tag
    end

    def links(max=5)

      begin
        links = content.css('a[href]').first(max).collect { |e| e.attributes['href'].value }
      rescue NoMethodError
        return nil
      end
    end

    private

    def content
      @content ||= Nokogiri::HTML(@html)
    end

  end
end
