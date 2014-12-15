class KeywordsController < ApplicationController
    autocomplete :keyword, :key, :full => true, :display_value => :capitalize
    #autocomplete is handled by this controller

end
