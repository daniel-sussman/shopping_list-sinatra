class ListItem
  attr_reader :name, :checked_off
  attr_accessor :quantity

  def initialize(name, quantity = "not specified", checked_off = false)
    @name = name
    @quantity = quantity
    @checked_off = checked_off
  end

  def checked_off?
    @checked_off
  end

  def increment!
    @quantity = 1 if @quantity == "not specified"
    @quantity += 1
  end

  def decrement!
    return if @quantity == "not specified"

    @quantity -= 1
    @quantity = "not specified" if @quantity <= 1
  end

  def toggle!
    @checked_off = !@checked_off
  end
end
