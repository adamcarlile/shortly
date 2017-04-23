class Short
  include Virtus.model
  class << self
    def find(url)
      store[url]
    end

    def store
      @store ||= {}
    end
  end
  attribute :url, Attributes::URL

  delegate :store, to: :class

  def key
    @key ||= SecureRandom.hex(3)
  end

  def save!
    store[key] = self
  end

end