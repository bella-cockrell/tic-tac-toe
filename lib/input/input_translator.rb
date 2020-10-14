class InputTranslator

    def convert(input)
        return [input[1].to_i - 1, input[0].ord.to_i - 65]
    end

    def standardize(input)
        input = input.upcase
        input_no_whitespace = input.gsub(/\s+|[,-]/, "")
        if input_no_whitespace[0].match(/[123]/)
            return input_no_whitespace.reverse
        end
        return input_no_whitespace
    end
    
end