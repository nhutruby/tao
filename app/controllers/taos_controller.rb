class TaosController < ApplicationController
  before_action :set_group, only: %i[ show update destroy ]

  # GET /groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

  # POST /groups
  def create
    puts '..'
    puts Rails.cache.write("greeting", "Hello, world!")
    puts '..'
    @tao = Object.const_get(tao_params["object"]).public_send(tao_params["method"], tao_params["attributes"])
    if @tao.errors.any?
      render json: @tao.errors, status: :unprocessable_content
    else
      render json: @tao, status: :created
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_content
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def tao_params
      fake_params = { method: :create, object: "User", attributes: { first_name: "Nick", last_name: "Nick" } }
      params = fake_params.as_json
      params = params.except(:method, :object, :attributes, *Object.const_get(params["object"]).permitted_attributes)
      puts params
      params
    end
end
