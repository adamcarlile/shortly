class MemoryStore

  def find(id)
    store[id]
  end

  def save(object)
    object.id = identifier if object.respond_to?(:id) && object.id.blank?
    store[object.id] = object
  end

  private

  def identifier
    id = nil
    until id
      provisional_id = SecureRandom.hex(3)
      id = provisional_id unless store.key?(provisional_id)
    end
    id
  end

  def store
    @store ||= Hash.new
  end

end
