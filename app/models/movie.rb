class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.search_by_director(movieId)
    movie = Movie.find(movieId)
    if (movie.director != nil && movie.director != "")
      Movie.find_all_by_director(movie.director)
    else
      nil
    end
  end
end
