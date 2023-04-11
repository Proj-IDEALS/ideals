# frozen_string_literal: true

class MapController < ApplicationController
  # GET /map
  def index; end

  def all
    assumptions = Assumption.select('id, name, description')
    theories = Theory.select('id, name, description')
    practices = Practice.select('id, name, description')
    assumptions_practices = Assumption.joins(:assumptions_practices)
                                      .select('assumptions_practices.assumption_id, assumptions_practices.practice_id')
    assumptions_theories = Assumption.joins(:assumptions_theories)
                                     .select('assumptions_theories.assumption_id, assumptions_theories.theory_id')

    nodes = {
      'assumptions' => assumptions,
      'theories' => theories,
      'practices' => practices,
      'assumptions_practices' => assumptions_practices,
      'assumptions_theories' => assumptions_theories
    }

    render json: nodes
  end
end
