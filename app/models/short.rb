class Short
  include ActiveModel::Model
  include Virtus.model
  class << self
    def find(id)
      store.find(id)
    end

    def store
      @store ||= (Shortly::Config.store_adaptor || :memory_store).to_s.classify.constantize.new 
    end
  end
  delegate :store, to: :class

  attribute :url, Attributes::URL
  attribute :id, String

  validates :url, presence: true

  alias :key :id

  def short_url
    "/#{key}"
  end

  def as_json(*)
    {
      url: url.to_s,
      short_url: short_url
    }
  end

  def save
    return false unless valid?
    store.save(self)
  end

end