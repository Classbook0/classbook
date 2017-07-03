class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_lista, only: [:new, :edit, :create, :update]
  before_action :set_curso, only: [:new, :index]
  #load_and_authorize_resource

  # GET /nota
  # GET /nota.json
  def index
    @nota = Note.all
  end

  # GET /nota/1
  # GET /nota/1.json
  def show
  end

  # GET /nota/new
  def new
    @note = Note.new
  end

  # GET /nota/1/edit
  def edit
  end

  # POST /nota
  # POST /nota.json
  def create
    puts '.....................> ' + params["n1"].to_s
    @note = Note.new(n1: params[:n1], n2: params[:n2], n3: params[:n3], n4: params[:n4],
      nf: params[:nf], curso_id: params[:curso_id], user_id: 3)

    respond_to do |format|
      if @note.save
        format.html { redirect_to curso_note_path(params[:curso_id],@note.id), notice: 'Nota creada correctamente.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota/1
  # PATCH/PUT /nota/1.json
  def update
    respond_to do |format|
      if @note.update(n1: params[:n1], n2: params[:n2], n3: params[:n3], n4: params[:n4],
        nf: params[:nf], curso_id: params[:curso_id], user_id: params[:user_id])

        format.html { redirect_to @note, notice: 'Nota actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota/1
  # DELETE /nota/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to curso_notes_path(params[:curso_id]), notice: 'Nota eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_lista
      @listado_usuarios_notas = User.where(perfil: "Alumno").collect{|c| [c.email.to_s + ' - [' + c.perfil.to_s + ']', c.id]}
      @listado_cursos = Curso.all.collect{|c| [c.nombre, c.id]}
    end

    def set_curso
      @curso = Curso.find(params[:curso_id])
    end

    def note_params
      params.require(:note).permit(:n1, :n2, :n3, :n4, :nf, :curso_id, :user_id)
    end

end
