module DateSanitizer

def add_year(date)
    unless date == nil
      dob_array = date.split("/")
      if dob_array.size == 2
        dob_array[2] = "1900"
        dob_array * "/"
      else
        date
      end
    end
  end

  def rearrange_birthday(date)
    unless date == nil
      dob_array = date.split("/") 
      dob_array = dob_array.unshift(dob_array.pop) * "/"
    end
  end

  def normalize_date(date)
    rearrange_birthday(add_year(date))
  end

  end