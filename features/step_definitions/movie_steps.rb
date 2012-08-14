# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
   Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  assert_match(/#{e1+".*"+e2}/m,page.body)
end


Then /I should see in the following order:\s*(\S.*)/ do |movie_list|
  rg = movie_list.split(/, /).reduce{|x,y| x + ".*" + y}
  assert_match(/#{rg}/m, page.body)
end

Then /I should see all of the movies/ do
  count = all("table#movies tr").count
   if count.respond_to? :should
     count.should == 11
   else
     assert_equal count, 11
   end
end

Then /I should not see any movie/ do
  assert_equal 0, page.all('table#movies tbody tr').count
end

Then /I should (not )?see the following movies:\s*(\S.*)/ do |not_see, movie_list|
  movie_list.split(/, /).each do |m|
    if (not_see == nil)
      assert page.has_content?(m)
    else
      assert !page.has_content?(m)
    end
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings:\s*(\S.*)/ do |uncheck, rating_list|
  rating_list.split(/, /).each do |x|
    if (uncheck == nil)
      check("ratings["+x+"]")
    else
      uncheck("ratings["+x+"]")
    end
  end
end

Given /I check the following ratings:\s+ (\S.*)/ do|rating_list|
  ["G","PG","R","PG-13"].each do |x|
     uncheck("ratings["+x+"]")
  end
  raing_list.split(/, /).each do |x|
    check("ratings["+x+"]")
  end
end

Then /the director of "(.*)" should be "(.*)"/i do |title, director|
  assert_equal(Movie.find_by_title(title).director, director)
end
