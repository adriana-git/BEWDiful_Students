class CityPick
  attr_accessor :city_name, :tag_count

  def initialize(city_name, tag_count)
    @city_name = city_name
    @tag_count = tag_count
  end
end