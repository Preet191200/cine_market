# Categories
categories = [
  "Classic Cinema",
  "Action & Thriller",
  "Sci-Fi & Fantasy",
  "Drama & Romance"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end

puts "Created #{Category.count} categories"

# Products
posters = [
  { title: "The Godfather — Original Art Print", description: "A stunning art print of the iconic 1972 Coppola masterpiece. Printed on heavyweight matte paper with rich, deep blacks and warm tones. A must-have for any serious collector.", price: 49.99, stock_quantity: 25, category: "Classic Cinema" },
  { title: "Casablanca — Vintage Reprint", description: "Beautifully restored reprint of the 1942 Humphrey Bogart classic. Sepia-toned with original typography preserved. Perfect for a home theatre or study.", price: 39.99, stock_quantity: 18, category: "Classic Cinema" },
  { title: "Citizen Kane — Collector's Edition Print", description: "Minimalist collector's print inspired by Orson Welles' 1941 landmark film. Features iconic composition and timeless black-and-white palette.", price: 44.99, stock_quantity: 12, category: "Classic Cinema" },
  { title: "Singin' in the Rain — Golden Era Print", description: "Vibrant reproduction of the beloved 1952 musical. Gene Kelly's iconic umbrella pose rendered in joyful Technicolor tones on premium gloss paper.", price: 34.99, stock_quantity: 20, category: "Classic Cinema" },
  { title: "Die Hard — Limited Edition Foil Print", description: "High-gloss foil-accented print of the 1988 action blockbuster. Nakatomi Plaza never looked better. Limited to 500 numbered copies.", price: 59.99, stock_quantity: 8, category: "Action & Thriller" },
  { title: "Mad Max: Fury Road — Chrome Series", description: "Striking chrome-finish poster inspired by the 2015 George Miller epic. Desert oranges and chrome silvers leap off the page. 18x24 inches.", price: 54.99, stock_quantity: 15, category: "Action & Thriller" },
  { title: "The Dark Knight — Gotham Skyline Print", description: "Atmospheric print featuring the Gotham City skyline from Nolan's 2008 masterpiece. Dark blues and grays with a bold bat symbol. Unframed, 24x36 inches.", price: 49.99, stock_quantity: 22, category: "Action & Thriller" },
  { title: "No Country for Old Men — Minimalist Print", description: "Stark, minimalist print evoking the mood of the Coen Brothers' 2007 thriller. Desert landscape with bold typography. Printed on textured linen-finish paper.", price: 44.99, stock_quantity: 10, category: "Action & Thriller" },
  { title: "2001: A Space Odyssey — HAL 9000 Print", description: "Iconic red-eye HAL 9000 art print from Kubrick's 1968 masterpiece. Clean, graphic design with gloss UV coating. A conversation piece for any room.", price: 54.99, stock_quantity: 14, category: "Sci-Fi & Fantasy" },
  { title: "Blade Runner 2049 — Neon Cityscape Print", description: "Breathtaking neon-drenched print from Villeneuve's 2017 sequel. Teal and orange palette, rain-slicked streets. Museum-quality giclée on archival paper.", price: 64.99, stock_quantity: 9, category: "Sci-Fi & Fantasy" },
  { title: "Dune — Desert Planet Art Print", description: "Epic wide-format print from Denis Villeneuve's 2021 adaptation. Sandy ochres and deep shadows evoke Arrakis perfectly. Available in 24x36 inches.", price: 59.99, stock_quantity: 17, category: "Sci-Fi & Fantasy" },
  { title: "The Matrix — Code Rain Print", description: "Green digital rain cascades down this iconic print from the 1999 Wachowski classic. Printed on semi-gloss with a subtle metallic sheen.", price: 44.99, stock_quantity: 30, category: "Sci-Fi & Fantasy" },
  { title: "Schindler's List — Candle Flame Print", description: "Deeply moving minimalist print from Spielberg's 1993 Holocaust drama. The solitary candle flame on stark black paper. Comes with certificate of authenticity.", price: 54.99, stock_quantity: 6, category: "Drama & Romance" },
  { title: "Eternal Sunshine of the Spotless Mind", description: "Dreamy, painterly art print from Michel Gondry's 2004 romantic masterpiece. Soft blues and fractured memory imagery. 18x24 on cold-press watercolour paper.", price: 49.99, stock_quantity: 11, category: "Drama & Romance" },
  { title: "La La Land — City of Stars Print", description: "Romantic twilight print from Damien Chazelle's 2016 musical. Emma Stone and Ryan Gosling silhouetted against a golden Los Angeles sunset.", price: 44.99, stock_quantity: 19, category: "Drama & Romance" },
  { title: "Marriage Story — Duotone Portrait Print", description: "Intimate duotone portrait print from Noah Baumbach's 2019 drama. Split-tone design in warm amber and cool blue. 16x20 inches, unframed.", price: 39.99, stock_quantity: 13, category: "Drama & Romance" },
]

posters.each do |poster_data|
  category = Category.find_by!(name: poster_data[:category])
  Product.find_or_create_by!(title: poster_data[:title]) do |p|
    p.description    = poster_data[:description]
    p.price          = poster_data[:price]
    p.stock_quantity = poster_data[:stock_quantity]
    p.category       = category
  end
end

puts "Created #{Product.count} products"