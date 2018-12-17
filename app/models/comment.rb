# frozen_string_literal: true

# Clase Comment, depende de Place
class Comment < ApplicationRecord
  belongs_to :place
end
