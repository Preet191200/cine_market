# Clear existing data
OrderItem.delete_all rescue nil
Order.delete_all rescue nil
Product.delete_all
Category.delete_all
# Provinces with tax rates
provinces_data = [
  { name: "Alberta",                    gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "British Columbia",           gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "Manitoba",                   gst_rate: 0.05, pst_rate: 0.07, hst_rate: 0.00 },
  { name: "New Brunswick",              gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Newfoundland and Labrador",  gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Northwest Territories",      gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Nova Scotia",                gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Nunavut",                    gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
  { name: "Ontario",                    gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.13 },
  { name: "Prince Edward Island",       gst_rate: 0.00, pst_rate: 0.00, hst_rate: 0.15 },
  { name: "Quebec",                     gst_rate: 0.05, pst_rate: 0.09975, hst_rate: 0.00 },
  { name: "Saskatchewan",               gst_rate: 0.05, pst_rate: 0.06, hst_rate: 0.00 },
  { name: "Yukon",                      gst_rate: 0.05, pst_rate: 0.00, hst_rate: 0.00 },
]

provinces_data.each do |p|
  Province.find_or_create_by!(name: p[:name]) do |prov|
    prov.gst_rate = p[:gst_rate]
    prov.pst_rate = p[:pst_rate]
    prov.hst_rate = p[:hst_rate]
  end
end

puts "✓ #{Province.count} provinces created"
# Categories
classic    = Category.find_or_create_by!(name: "Classic Films")
action     = Category.find_or_create_by!(name: "Action & Thriller")
scifi      = Category.find_or_create_by!(name: "Sci-Fi & Fantasy")
drama      = Category.find_or_create_by!(name: "Drama")
tv_shows   = Category.find_or_create_by!(name: "TV Shows")

puts "✓ Categories created"

# Pages
Page.find_or_create_by!(slug: "about") do |p|
  p.title   = "About Cine Market"
  p.content = "Cine Market is a Winnipeg-based entertainment retail business specializing in movies and film merchandise. We have been operating for 12 years and employ 18 staff members.\n\nWe sell premium art prints and collectible posters from cinema's greatest films — including Blu-ray, DVD, and 4K Ultra HD movies along with movie collectibles, posters, and limited-edition box sets.\n\nOur mission is to bring the magic of cinema into your home. Whether you're a casual movie fan or a serious collector, we have something for everyone.\n\nVisit our store in Winnipeg or shop online for delivery across Canada."
end

Page.find_or_create_by!(slug: "contact") do |p|
  p.title   = "Contact Us"
  p.content = "We'd love to hear from you!\n\nEmail: hello@cinemarket.ca\nPhone: (204) 555-0192\nAddress: 123 Main Street, Winnipeg, Manitoba, R3C 1A1\n\nStore Hours:\nMonday – Friday: 10am – 8pm\nSaturday: 10am – 6pm\nSunday: 12pm – 5pm\n\nFor online order inquiries, please email us at orders@cinemarket.ca and we will respond within 24 hours."
end

puts "✓ Pages created"

# Products — Movies & TV Shows with real TMDB poster URLs
products = [
  # Classic Films
  {
    title: "The Godfather (1972)",
    description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. Directed by Francis Ford Coppola, starring Marlon Brando and Al Pacino. Winner of 3 Academy Awards including Best Picture. This collector's print is produced on heavyweight 250gsm matte paper with archival inks guaranteed to last 100 years.",
    price: 49.99,
    stock_quantity: 25,
    category: classic,
    poster_url: "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsLeMLoofYLWY.jpg"
  },
  {
    title: "Casablanca (1942)",
    description: "A cynical American expatriate struggles to decide whether or not to help his former lover and her fugitive husband escape French Morocco. Humphrey Bogart and Ingrid Bergman star in this timeless romantic masterpiece. Printed on sepia-toned linen-finish paper to evoke the golden age of Hollywood.",
    price: 39.99,
    stock_quantity: 18,
    category: classic,
    poster_url: "https://image.tmdb.org/t/p/w500/5K7cOHoay2mZusSLezBOY0Qxh8a.jpg"
  },
  {
    title: "Psycho (1960)",
    description: "A Phoenix secretary embezzles forty thousand dollars from her employer's client, goes on the run, and checks into a remote motel run by a troubled young man under the domination of his mother. Hitchcock's masterpiece of suspense. Black-and-white giclée print on cold-press archival paper.",
    price: 44.99,
    stock_quantity: 14,
    category: classic,
    poster_url: "https://image.tmdb.org/t/p/w500/yz4QVqPx3h1hD1DfqqQkCq3rmxW.jpg"
  },
  {
    title: "Sunset Boulevard (1950)",
    description: "A faded silent-film star and a struggling screenwriter fall into a dangerous relationship. Billy Wilder's devastating portrait of Hollywood delusion. Museum-quality giclée on 310gsm fine art paper with UV-protective coating.",
    price: 42.99,
    stock_quantity: 10,
    category: classic,
    poster_url: "https://image.tmdb.org/t/p/w500/dFTCMr10FXUF1mHtAyqjFTWyqJ0.jpg"
  },

  # Action & Thriller
  {
    title: "The Dark Knight (2008)",
    description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. Christopher Nolan's acclaimed superhero epic starring Christian Bale and Heath Ledger. Printed on 24x36 semi-gloss with deep blacks and vivid contrast.",
    price: 54.99,
    stock_quantity: 30,
    category: action,
    poster_url: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
  },
  {
    title: "Mad Max: Fury Road (2015)",
    description: "In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search of her homeland with the aid of a group of female prisoners, a psychotic worshiper, and a drifter named Max. George Miller's visceral action masterpiece. Chrome-finish foil print, limited to 300 copies.",
    price: 59.99,
    stock_quantity: 15,
    category: action,
    poster_url: "https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg"
  },
  {
    title: "No Country for Old Men (2007)",
    description: "Violence and mayhem ensue after a hunter stumbles upon a drug deal gone wrong and more than two million dollars in cash near the Rio Grande. The Coen Brothers' uncompromising thriller starring Javier Bardem. Stark minimalist print on textured natural paper.",
    price: 47.99,
    stock_quantity: 12,
    category: action,
    poster_url: "https://image.tmdb.org/t/p/w500/bj1v6vNOHHXBnkMBXeQGcECe7lA.jpg"
  },
  {
    title: "John Wick (2014)",
    description: "An ex-hitman comes out of retirement to track down the gangsters that killed his dog and took everything from him. Keanu Reeves delivers a career-defining performance. High-contrast action print on 200gsm silk paper with spot UV highlights.",
    price: 44.99,
    stock_quantity: 20,
    category: action,
    poster_url: "https://image.tmdb.org/t/p/w500/fZPSd91yGE9fCcCe6OoQr6E3Bev.jpg"
  },

  # Sci-Fi & Fantasy
  {
    title: "2001: A Space Odyssey (1968)",
    description: "After discovering a mysterious artifact buried beneath the Lunar surface, mankind sets off on a quest to find its origins with help from intelligent supercomputer H.A.L. 9000. Stanley Kubrick's landmark science fiction film. Minimalist HAL 9000 print with gloss UV coating.",
    price: 54.99,
    stock_quantity: 14,
    category: scifi,
    poster_url: "https://image.tmdb.org/t/p/w500/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg"
  },
  {
    title: "Blade Runner 2049 (2017)",
    description: "A young blade runner's discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who's been missing for thirty years. Denis Villeneuve's breathtaking visual masterpiece. Neon-drenched giclée print on archival paper.",
    price: 64.99,
    stock_quantity: 9,
    category: scifi,
    poster_url: "https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg"
  },
  {
    title: "Dune: Part One (2021)",
    description: "A noble family becomes embroiled in a war for control over the galaxy's most valuable asset while its scion becomes prophesied to lead the desert people toward a glorious but violent future. Denis Villeneuve's epic adaptation of Frank Herbert's novel. Wide-format desert print, 24x36 inches.",
    price: 59.99,
    stock_quantity: 17,
    category: scifi,
    poster_url: "https://image.tmdb.org/t/p/w500/d5NXSklpcvkeyd9ho271fpVkHTo.jpg"
  },
  {
    title: "Interstellar (2014)",
    description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival. Christopher Nolan's emotionally devastating science fiction epic starring Matthew McConaughey. Deep space print with luminous star field on black archival paper.",
    price: 54.99,
    stock_quantity: 22,
    category: scifi,
    poster_url: "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
  },

  # Drama
  {
    title: "Schindler's List (1993)",
    description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis. Steven Spielberg's devastating masterpiece. Candle flame minimalist print on stark black archival paper. Comes with certificate of authenticity.",
    price: 54.99,
    stock_quantity: 6,
    category: drama,
    poster_url: "https://image.tmdb.org/t/p/w500/sF1U4EUQS8YHUYjNl3pMGNIQyr0.jpg"
  },
  {
    title: "Eternal Sunshine of the Spotless Mind (2004)",
    description: "When their relationship turns sour, a couple undergoes a medical procedure to have each other erased from their memories. Michel Gondry's visually inventive romantic drama. Dreamy painterly print on cold-press watercolour paper, 18x24 inches.",
    price: 49.99,
    stock_quantity: 11,
    category: drama,
    poster_url: "https://image.tmdb.org/t/p/w500/5MwkWH9tYHv3mV9OdYTMR5qreIz.jpg"
  },
  {
    title: "Parasite (2019)",
    description: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan. Bong Joon-ho's Palme d'Or and Academy Award Best Picture winner. Bold graphic print on 250gsm matte paper.",
    price: 49.99,
    stock_quantity: 19,
    category: drama,
    poster_url: "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg"
  },

  # TV Shows
  {
    title: "Breaking Bad — Complete Series",
    description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future. Widely regarded as one of the greatest television series ever made. Collector's art print featuring the iconic blue crystal meth motif. 18x24 on heavyweight matte paper.",
    price: 54.99,
    stock_quantity: 20,
    category: tv_shows,
    poster_url: "https://image.tmdb.org/t/p/w500/ggFHVNu6YYI5L9pCfOacjizRGt.jpg"
  },
  {
    title: "Succession — Season 4",
    description: "The Roy family is known for controlling the biggest media and entertainment company in the world. But who will take the coveted top spot? HBO's Emmy-winning drama concludes its gripping final season. Elegant typographic print in dark navy and gold on 300gsm silk card.",
    price: 49.99,
    stock_quantity: 15,
    category: tv_shows,
    poster_url: "https://image.tmdb.org/t/p/w500/e2X8g1NHs0DLqPPaYP9ZQoHBUEu.jpg"
  },
  {
    title: "The Last of Us — Season 1",
    description: "After a global catastrophe, a hardened survivor takes charge of a 14-year-old girl who may be humanity's last hope. HBO's critically acclaimed adaptation of the beloved video game. Apocalyptic landscape print on textured paper with green fungal accent tones.",
    price: 52.99,
    stock_quantity: 18,
    category: tv_shows,
    poster_url: "https://image.tmdb.org/t/p/w500/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg"
  },
  {
    title: "Chernobyl — Miniseries",
    description: "In April 1986, an explosion at the Chernobyl nuclear power plant in the USSR becomes one of the world's worst man-made catastrophes. HBO's haunting five-part miniseries. Atmospheric print in muted grays and warning-sign red on cold-press archival paper.",
    price: 47.99,
    stock_quantity: 12,
    category: tv_shows,
    poster_url: "https://image.tmdb.org/t/p/w500/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg"
  },
  {
    title: "Shogun — Season 1 (2024)",
    description: "Based on James Clavell's novel, a mysterious European ship is found marooned in a Japanese fishing village. A man finds himself thrown into a labyrinth of political intrigue and violence. FX's Emmy-sweeping historical epic. Bold Japanese-inspired woodblock style print on washi-effect paper.",
    price: 52.99,
    stock_quantity: 16,
    category: tv_shows,
    poster_url: "https://image.tmdb.org/t/p/w500/7O4iVfOMQmdCSxhOg1WnzG1AgYT.jpg"
  },
]

products.each do |data|
  category = data.delete(:category)
  Product.find_or_create_by!(title: data[:title]) do |p|
    p.description    = data[:description]
    p.price          = data[:price]
    p.stock_quantity = data[:stock_quantity]
    p.category       = category
    p.poster_url     = data[:poster_url]
  end
end

puts "✓ #{Product.count} products created"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if AdminUser.count == 0