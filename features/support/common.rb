def to_factory string
  string.singularize
end

def to_model string
  string.singularize.capitalize.constantize
end

def table_to_hash table
  hash = {}

  table.hashes.each do |pair|
    hash[pair[:field]] = pair[:value]
  end

  hash
end
