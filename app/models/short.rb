class Short
  include ActiveModel::Model
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
  alias :id :key

  def short_url
    "/#{key}"
  end

  def persisted?
    store.key?(key)
  end

  def as_json(*)
    {
      url: url.to_s,
      short_url: short_url
    }
  end

  def save!
    store[key] = self
  end

end