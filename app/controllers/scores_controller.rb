class Api::V1::ScoresController < ApplicationController

    def index
        @scores = Score.all
    end

    def show
        @score
    end

    def update
        @score.update(score_params)
    end

    def delete
        @score.destroy
    end

    private

        def set_username
            @score = Score.find(params[:id])
        end
  
        # Only allow a list of trusted parameters through.
        def score_params
            params.require(:score).permit(:amount)
        end

end
