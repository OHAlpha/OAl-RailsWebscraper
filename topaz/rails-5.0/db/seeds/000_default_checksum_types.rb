if Network::ChecksumType.count == 0
Network::ChecksumType.create name: 'MD5', bits: 128, value_eval: 'Digest::MD5.digest(input).to_i', bits_eval: 'Digest::MD5.digest(input)', hex_eval: 'Digest::MD5.hexdigest(input)'
Network::ChecksumType.create name: 'SHA256', bits: 256, value_eval: 'Digest::SHA256.digest(input).to_i', bits_eval: 'Digest::SHA256.digest(input)', hex_eval: 'Digest::SHA256.hexdigest(input)'
Network::ChecksumType.create name: 'SHA384', bits: 384, value_eval: 'Digest::SHA384.digest(input).to_i', bits_eval: 'Digest::SHA384.digest(input)', hex_eval: 'Digest::SHA384.hexdigest(input)'
Network::ChecksumType.create name: 'SHA512', bits: 256, value_eval: 'Digest::SHA512.digest(input).to_i', bits_eval: 'Digest::SHA512.digest(input)', hex_eval: 'Digest::SHA512.hexdigest(input)'
end