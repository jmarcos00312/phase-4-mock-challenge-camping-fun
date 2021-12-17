class ActivitiesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def index
    render json: Activity.all
  end


  def destroy
    activity = find_activity
    activity.destroy
    # head :no_content

  end

  private

  def render_not_found
    render json: { error: "Activity not found" }, status: :not_found
  end

  def render_invalid(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :invalid
  end


  def find_activity
    Activity.find(params[:id])
  end

end
