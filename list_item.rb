class ListItem
  attr_reader :name, :checked_off
  attr_accessor :quantity

  def initialize(name, quantity = 1, checked_off = false)
    @name = name
    @quantity = quantity
    @checked_off = checked_off
  end

  def checked_off?
    @checked_off
  end

  def toggle!
    @checked_off = !@checked_off
  end
end
