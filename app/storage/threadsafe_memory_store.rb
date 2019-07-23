class ThreadsafeMemoryStore < MemoryStore

  def initialize
    @mutex ||= Mutex.new
  end

  def find(*args)
    @mutex.synchronize { super }
  end

  def save(*args)
    @mutex.synchronize { super }
  end

end
