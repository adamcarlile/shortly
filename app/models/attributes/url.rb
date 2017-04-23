module Attributes
  class URL < Virtus::Attribute
    def coerce(value)
      ::URL.new(URI.parse(value))
    end
  end
end