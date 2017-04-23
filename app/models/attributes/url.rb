module Attributes
  class URL < Virtus::Attribute
    def coerce(value)
      ::URL.new(URI.parse(value)) if value.present?
    end
  end
end