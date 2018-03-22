require_relative('./models/star')
require_relative('./models/movie')
require_relative('./models/casting')

require( 'pry-byebug' )

Casting.delete_all()
Star.delete_all()
Movie.delete_all()

star1 = Star.new({'first_name' => 'Brad', 'last_name' => 'Pitt'})
star2 = Star.new({'first_name' => 'Clint', 'last_name' => 'Eastwood'})
star3 = Star.new({'first_name' => 'Scarlett', 'last_name' => 'Johansson'})
star4 = Star.new({'first_name' => 'Edward', 'last_name' => 'Norton'})

movie1 = Movie.new({'title' => 'Fight Club', 'genre' => 'drama', 'rating' => 10})
movie2 = Movie.new({'title' => 'Inglorious Basterds', 'genre' => 'drama', 'rating' => 7})
movie3 = Movie.new({'title' => 'Gran Turino', 'genre' => 'drama', 'rating' => 8})
movie4 = Movie.new({'title' => 'Million Dollar Baby', 'genre' => 'drama', 'rating' => 8})

star1.save
star2.save
star3.save
star4.save
movie1.save
movie2.save
movie3.save
movie4.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 100000})
casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star4.id, 'fee' => 50000})

#binding.pry
casting1.save
casting2.save

star2.delete
movie4.delete

star3.first_name = 'JarJarBinx'
star3.update
movie3.rating = 2
movie3.update


p Star.all
p Movie.all
p star1.show_movies
p movie1.show_stars

binding.pry
