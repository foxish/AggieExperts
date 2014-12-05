class KeywordsController < ApplicationController
    autocomplete :keyword, :key, :full => true, :display_value => :capitalize


end
