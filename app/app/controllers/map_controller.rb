class MapController < ApplicationController
  def all
    assumptions = Assumption.select("id, name, description")
    theories = Theory.select("id, name, description")
    practices = Practice.select("id, name, description")

    nodes = {
      'assumptions' => assumptions,
      'theories' => theories,
      'practices' => practices
    }

    render json: nodes
  end
end
