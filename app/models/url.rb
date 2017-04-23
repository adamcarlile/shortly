class URL < SimpleDelegator
  HTTP_PROTOCOLS = ['http', 'https'].freeze

  def initialize(url)
    super(url.is_a?(URI) ? url : URI.parse(url))
  end

  def to_s
    if HTTP_PROTOCOLS.include?(scheme)
      super
    else
      [HTTP_PROTOCOLS.first, '://', super].join.to_s
    end
  end

end