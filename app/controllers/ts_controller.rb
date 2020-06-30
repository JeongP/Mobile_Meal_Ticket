class TsController < InheritedResources::Base

  private

    def t_params
      params.require(:t).permit(:title)
    end
end

