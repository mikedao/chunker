class Chunker
  def self.chunk(string)
    string.scan(/.{1,5}/)
  end

end


