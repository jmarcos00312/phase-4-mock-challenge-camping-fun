class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid


  def create
    new = Signup.create!(signup_params)
    #returns the associated Activity data
    render json: new.activity, status: :created
  end




    private

  def render_not_found
    render json: { error: "Camper not found" }, status: :not_found
  end

  def render_invalid(invalid)
    render json: {
             errors: invalid.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
  def signup_params
    params.permit [:time, :camper_id, :activity_id]
  end

end
