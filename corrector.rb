class Corrector
  def correct_name(name)
    name = name.capitalize

    return name[0...10] if name.length > 10

    name
  end
end
