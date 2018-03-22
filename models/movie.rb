require('pg')
require_relative('../db/sql_runner')
require_relative('./star')

class Movie

  #attr_reader :id
  attr_accessor :title, :genre, :rating, :id

  def initialize( options )
    @id = options['id'].to_i if ['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating']
  end

  def save

    sql = (
      "INSERT INTO movies (title, genre, rating) VALUES ($1, $2, $3) RETURNING id"
      )
    values = [@title, @genre, @rating]
    movie = SqlRunner.run( sql, values).first
    @id = movie['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM movies"
    movie_hashes = SqlRunner.run(sql)
    movie_objects = movie_hashes.map{|movie| Movie.new(movie)}
    return movie_objects
  end

  def update
    sql = ("UPDATE movies SET title = $1, genre = $2, rating = $3
    WHERE id = $4")

    values = [@title, @genre, @rating, @id]

    SqlRunner.run(sql,values)
  end

  def delete
    sql = ("DELETE FROM movies WHERE id = $1")
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = ("DELETE FROM movies")
    SqlRunner.run(sql)
  end

  def show_stars
    sql = "SELECT stars.*
      FROM stars
      INNER JOIN castings
      ON castings.star_id = stars.id
      WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run( sql, values )
    result = stars.map{ |star| Star.new(star) }
    return result
  end

end
