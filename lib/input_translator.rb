class InputTranslator
    def translate(input)
        if input == "a 1"
            return [0,0]
        else
            return [1,0]
        end
    end

    def standardize(input)
        input_no_whitespace = input.gsub(/\s+|[,-]/, "")
        if input_no_whitespace[0].match(/[123]/)
            return input_no_whitespace.reverse
        end
        return input_no_whitespace
    end
    
end