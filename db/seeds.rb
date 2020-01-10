require "open-uri"
require 'nokogiri'

Flower.delete_all
puts "clean db"

i = 1
t = 0
2.times do
  url = "https://www.francefleurs.com/11-fleurs-coupees-do-it-yourself?id_category=11&n=150&p=#{i}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.product_img_link > img').each do |element|
    title = element.attribute('title').value.split
    name = title.shift
    color = title.shift
    filename = name+(t.to_s)+'.jpg'
    urlimg = element.attribute('data-src').value
    if urlimg == "https://www.francefleurs.com/img/p/fr-default-home_default.jpg"
      urlimg = "https://www.marie-myrtille.com/templates/yootheme/cache/monogramme_mm-ac3d2f3f.png"
    end
    flower = Flower.new(name: name, color: color)
    file = URI.open(urlimg)
    flower.photo.attach(io: file, filename: filename, content_type: 'image/jpg')
    flower.save
    t += 1
  end
i += 1
end


puts "#{Flower.count} fleurs créées"
