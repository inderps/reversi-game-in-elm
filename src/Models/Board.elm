module Models.Board exposing (Board, init)

type alias Board =
  { rows : Int
  , columns: Int
  }

init : Int -> Int -> Board

init rows columns =
  { rows = rows
  , columns = columns
  }
