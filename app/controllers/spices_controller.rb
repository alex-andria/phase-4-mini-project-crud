class SpicesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

# GET /spices: return an array of all spices
def index
    spices = Spice.all
    render json: spices
end

# GET /spices/id return an array of all spices
# def show
#     spice = find_spice
#     render json: spice
# end

# POST /spices: create a new spice
def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
end

# PATCH /spices/:id: update an existing spice
def update
    spice = find_spice
    spice.update(spice_params)
    render json: spice
end

# DELETE /spices/:id: delete an existing spice
def destroy
    spice = find_spice
    spice.destroy()
    head :no_content
end

private

    #find 
    def find_spice
        Spice.find(params[:id])
    end

    #spice params
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    #render not found response
    def render_not_found_response
        render json: {error: "Spice not found."}, status: :not_found
    end 

end