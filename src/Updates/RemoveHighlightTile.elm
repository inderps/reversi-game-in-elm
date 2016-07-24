module Updates.RemoveHighlightTile exposing (removeHighlightTile)

import Model exposing (Model)


removeHighlightTile : Model -> Model
removeHighlightTile model =
    { model | highlightedTile = Nothing }
