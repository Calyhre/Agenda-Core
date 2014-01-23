class Api::V1::BaseController < Api::BaseController

  def render_not_found
    render nothing: true, status: :not_found
  end

end
