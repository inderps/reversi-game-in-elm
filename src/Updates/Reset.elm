module Updates.Reset exposing (reset)

import Model exposing (Model)
import Init exposing (initialMoves)


reset : Model -> Model
reset model =
    { model | occupiedTiles = initialMoves }
