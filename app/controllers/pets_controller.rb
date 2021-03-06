class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  before_action :user_updated?
  before_action :filtered_params, only: [:index]

  # GET /pets
  # GET /pets.json
  def index
    @pets = Pet.filter(filtered_params)
    if @pets.count == 0
      @pets = Pet.all
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = current_user.pets.new(pet_params)
    respond_to do |format|
      if @pet.save
        format.html { redirect_to @pet, notice: 'Pet was successfully created.' }
        format.json { render :show, status: :created, location: @pet }
      else
        format.html { render :new }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params)
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet }
      else
        format.html { render :edit }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def request_booking
    match = Match.new(borrower_id: current_user.id, owner_id: params[:owner_id] )
    if match.save
      redirect_to pets_path
      flash[:notice] = "Booking requested successfully!"
    else
      redirect_to session[:previous_url]
      flash[:fail] = "Booking unsuccessful"
    end
  end

  def favourite!
    @pet  = Pet.find(params[:pet_id])
    Favourite.new(pet_id: @pet.id ,user_id: current_user.id)
    redirect_to  pet_path(@pet)

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:owner_id, :name, :types, :description, :age, :gender, :breed, available_days: [], available_times: [], photos: [])
    end

    def user_updated?
      if current_user.invalid?(:update)
        flash[:notice] = "Please complete your profile"
        redirect_to edit_user_registration_path
      end
    end

    def filtered_params
      params.slice(:types, :breed.downcase, :gender)
    end

end
