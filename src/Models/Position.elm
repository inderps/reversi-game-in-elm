module Models.Position exposing (Position, setXY, setYX)


type alias Position =
    { x : Int
    , y : Int
    }


setXY : Int -> Int -> Position
setXY x y =
    { x = x
    , y = y
    }


setYX : Int -> Int -> Position
setYX y x =
    { x = x
    , y = y
    }
