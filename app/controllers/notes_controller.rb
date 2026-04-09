class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def def new
    @note = Notes.new
  end
  
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "Note created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end     


  def show
    @note = Note.find(params[:id])
  end

  private
  def note_params
    params.expect(note: [ :title, :content ])     
  end
end

