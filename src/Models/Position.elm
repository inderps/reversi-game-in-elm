module Models.Position exposing (Position, position)


type alias Position =
    { x : Int
    , y : Int
    }


position : Int -> Int -> Position
position x y =
    { x = x
    , y = y
    }
