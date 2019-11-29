class CreateGisType < ActiveRecord::Migration[5.2]
  def change
    create_table :gis_types do |t|
      t.string :title
      t.string :name
      t.text   :description
      t.string :img
    end

    GisType.create!([
      {title: 'Маркер', name: 'Point', img: 'point.png',
       description: "Для об'єктів типу «Маркер» властивість «coordinates» має містити одну пару/триплет координат."},
      {title: 'Лінія', name: 'LineString', img: 'line_string.png',
       description: "Для об'єктів типу «Лінія» властивість «coordinates» повинно містити масив з двох і більше
                    пар/триплетів."},
      {title: 'Площа', name: 'Polygon', img: 'polygon.png',
       description: "Для об'єктів типу «Площа» властивість «coordinates» повинно містити масив масивів пар/триплетів
                    координат «Лінія». Для полігонів з декількома кільцями першим має йти опис зовнішнього кільця і
                    тільки потім внутрішніх, або дірок."},
      {title: 'Декілька маркерів', name: 'MultiPoint', img: 'multi_point.png',
       description: "Для об'єктів типу «Декілька маркерів» властивість «coordinates» повинно містити масив пар/триплетів
                    координат."},
      {title: 'Декілька ліній', name: 'MultiLineString', img: 'multi_line_string.png',
       description: "Для об'єктів типу «Декілька ліній» властивість «coordinates» повинно містити масив масивів
                    пар/триплетів координат «Лінія»"},
      {title: 'Декілька площ', name: 'MultiPolygon', img: 'multi_polygon.png',
       description: "Для об'єктів типу «Декілька площ» властивість «coordinates» повинно містити масив масивів
                    пар/триплетів координат «Площа»."}
    ])
  end
end
