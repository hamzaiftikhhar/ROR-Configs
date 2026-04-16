class Car < Vehicle
  def honk
    "Beep Beep" #why this is not action is not working in the console? because we need to create an instance of the Car class first and then call the honk method on that instance. For example:
  end

  def index
    @cars = Car.all
  end
end
