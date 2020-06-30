class NotesController < InheritedResources::Base

  def index
    @notes = Note.order("created_at DESC")
  end

  private

    def note_params
      params.require(:note).permit(:title, :content, :user_id)
    end
end

