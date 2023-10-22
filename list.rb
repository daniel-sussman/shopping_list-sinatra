require 'csv'
require_relative 'list_item'

class List
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @items = []
    load_csv
  end

  def all
    @items
  end

  def create(item)
    @items << item
    save_csv
  end

  def toggle(item_index)
    @items[item_index].toggle!
    save_csv
  end

  def destroy(item_index)
    @items.delete_at(item_index)
    save_csv
  end

  def clear_checked
    @items.reject! { |item| item.checked_off? }
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      quantity = row[1].to_i unless row[1] == "not specified"
      @items << ListItem.new(row[0], quantity, row[2] == 'true')
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @items.each { |item| csv << [item.name, item.quantity, item.checked_off] }
    end
  end
end
