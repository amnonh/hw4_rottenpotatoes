require 'spec_helper'

describe MoviesHelper do
  describe 'test the odd function' do
    it 'should call the odd method and return odd' do
      MoviesHelper.oddness(17).should == "odd"
    end
  end
end
