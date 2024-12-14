class HeroinePowersController < ApplicationController
    def index 
        @heroinepower = HeroinePower.all
    end

    
end