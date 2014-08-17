module Instagram
  module Attributes
    def self.included(base)
      base.class_eval do
        attr_reader :attributes
        private :attributes

        def initialize(attributes)
          @attributes = attributes.freeze
        end

        def self.attribute(*names, &blk)
          Array(names).each do |name|
            str_name =
              if name == :instagram_id
                "id"
              else
                name.to_s
              end
            define_method(name) { attributes[str_name] }
          end
        end
      end
    end
  end
end
