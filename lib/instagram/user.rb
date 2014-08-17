require_relative 'attributes'

module Instagram
  class User
    include Attributes

    attribute :instagram_id, :username

    def avatar_url
      attributes["profile_picture"]
    end

    def name
      attributes["full_name"]
    end
  end
end
