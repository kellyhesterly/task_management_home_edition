class ChoresController < ApplicationController
    def index
        @chores = Chore.all
    end

    def show
        @chore = Chore.find(params[:id])
    end
    
    def new
    end

    def create
    end 

    def edit
    end

    def update
    end

    def destroy
    end
end
