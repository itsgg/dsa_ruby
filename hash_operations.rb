def process_hash_operations(hash, key_to_add, value_to_add, key_to_remove, key_to_check)
  output = hash.dup
  output[key_to_add] = value_to_add
  output.delete(key_to_remove)
  key_exists = output.keys.include?(key_to_check)

  {
    updated_hash: output,
    key_exists: key_exists,
    keys: output.keys,
    values: output.values
  }
end

puts process_hash_operations({a: 1, b: 2}, :c, 3, :b, :a)
