def sha1(*args)
  binary = args.map do |arg|
    arg.to_s.chars.map { |char| char.ord.to_s(2) }
  end

  appended = binary.join + '1'


end

p sha1('A Test')
