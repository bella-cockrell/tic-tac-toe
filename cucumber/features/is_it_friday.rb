module FridayStepHelper
    def is_it_friday(day)
        if day == 'Friday'
            return "TGIF"
        else
            return "Nope"
        end
    end
end