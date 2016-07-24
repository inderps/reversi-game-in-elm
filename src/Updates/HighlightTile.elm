module Updates.HighlightTile exposing (highlightTile)

import Model exposing (Model)
import Models.Position exposing (Position)


highlightTile : Model -> Position -> Model
highlightTile model pos =
    { model | highlightedTile = Just (pos) }
