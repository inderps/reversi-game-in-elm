module Models.Position exposing (Position, position, tiltedPosition)


type alias Position =
    { x : Int
    , y : Int
    }


position : Int -> Int -> Position
position x y =
    { x = x
    , y = y
    }


tiltedPosition : Int -> Int -> Position
tiltedPosition y x =
    { x = x
    , y = y
    }
