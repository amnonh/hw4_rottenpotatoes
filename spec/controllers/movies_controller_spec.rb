require 'spec_helper'

describe MoviesController do
  describe 'searching movies by the same director' do
    it 'should call the model method that performs search by director' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.should_receive(:search_by_director).with('1').and_return(fake_results)
      get :search_by_director, :id => 1
    end
    it 'should select the Search Results template for rendering' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:search_by_director).and_return(fake_results)
      get :search_by_director, :id => 1
      response.should render_template('search_by_director')
    end
    it 'should make the search results available to that template' do
      fake_results = [mock('Movie'), mock('Movie')]
      Movie.stub(:search_by_director).and_return(fake_results)
      Movie.stub(:find)
      get :search_by_director, :id => 1
      # look for controller method to assign @movies
      assigns(:movies).should == fake_results
    end

  end
end
