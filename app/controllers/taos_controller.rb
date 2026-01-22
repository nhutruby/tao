class TaosController < ApplicationController
  def tao
    if @result = Object.const_get(permittable_params["object"]).public_send(permittable_params["method"], permittable_params["attributes"])
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_content
    end
  end

  private

  # Use the concern to permit all attributes for the User model
  def permittable_params
    fake_params = {method: :create, object: 'User', attributes: {first_name: 'Nick', last_name: 'Nick'}}
    params = fake_params.as_json
    params.except(:method, :object, :attributes, *Object.const_get(params["object"]).permitted_attributes)
  end
end
