def substrings text, dictionary
  
  result = Hash.new(0)

  text.split.each do |text_word|
    
    dictionary.each do |dictionary_word|

      if (text_word[dictionary_word] != nil)
        result[dictionary_word] += 1
      end

    end

  end

  puts result

end

substrings "bom dia oi bombom ioio carro carroforte carrofone carros", ["bom", "oi", "carro"]