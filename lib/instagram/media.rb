require 'date'
require_relative 'attributes'
require_relative 'user'

module Instagram
  class Media
    include Attributes

    attribute :instagram_id, :tags, :location, :images

    # def location
    #   @location ||= Location.new(attributes["location"])
    # end

    def created_at
      DateTime.parse(attributes["created_time"])
    end

    def url
      attributes["link"]
    end

    def uri
      @uri ||= URI(url)
    end

    IMAGE_SIZES = {
      large: "standard_resolution"
    }.freeze

    def image_url(size: :large)
      string_size = IMAGE_SIZES[size]
      images[string_size]["url"]
    end

    def instagram_id
      attributes["id"]
    end

    def user
      @user ||= User.new(attributes["user"])
    end

    def title
      attributes["caption"] && attributes["caption"]["title"]
    end
  end
end
