class Bed < ApplicationRecord
  belongs_to :room

  enum bed_size: {
    twin: 0,
    twin_xl: 1,
    full: 2,
    queen: 3,
    king: 4,
    california_king: 5,
  }
end
