module Models.BoardSpecs exposing (BoardSpecs, init)


type alias BoardSpecs =
    { rows : Int
    , columns : Int
    }


init : Int -> Int -> BoardSpecs
init rows columns =
    { rows = rows
    , columns = columns
    }
