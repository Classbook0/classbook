class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_lista, only: [:new, :edit, :create, :update]
  before_action :set_curso, only: [:new, :index, :edit]
  after_action :set_total, only: [:create, :update]
  #load_and_authorize_resource

  # GET /nota
  # GET /nota.json
  def index
    if current_user.perfil == 'Alumno'
      @nota = Note.where(user_id: current_user.id)
    else
      @nota = Note.all
    end
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
    @note = Note.new(note_params)

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
      if @note.update(note_params)

        format.html { redirect_to curso_note_path(params[:curso_id],@note.id), notice: 'Nota actualizada correctamente.' }
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

    def set_total
      if @note
        suma = (@note.n1 + @note.n2 + @note.n3 + @note.n4)
        suma = suma / 4
        @note.update(nf: suma.to_f)
      end
    end

    def note_params
      params.require(:note).permit(:n1, :n2, :n3, :n4, :nf, :curso_id, :user_id)
    end

end
