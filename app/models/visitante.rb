class Visitante < ApplicationRecord
    mount_uploader :foto, FotoUploader
  
    validates :foto, presence: true
    validate :foto_format
    
    private
  
    def foto_format
      return unless foto.present?
  
      allowed_formats = ['image/jpeg', 'image/png'] # Tipos MIME permitidos
      unless allowed_formats.include?(foto.file.content_type)
        errors.add(:foto, 'deve ser um arquivo JPEG ou PNG')
      end
    end
  end
  
