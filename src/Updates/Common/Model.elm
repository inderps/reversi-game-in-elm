module Updates.Common.Model
    exposing
        ( modelAfterAddingTile
        , modelAfterReplacingTiles
        , modelAfterSwappingDiscs
        )

import Model exposing (Model)
import Models.OccupiedTile exposing (OccupiedTile, move)
import Models.BoardSpecs exposing (BoardSpecs)
import Models.Position exposing (Position, setYX)
import Computations.Tile exposing (lastFilledTile)
import Computations.DiscSwapping.OccupiedTile
    exposing
        ( swappableTilesOnPositionWithDisc
        , swappableTilesOnPositionForNextDisc
        , tilesAfterSwapping
        )


modelAfterSwappingDiscs : (Position -> BoardSpecs -> List (List Position)) -> Model -> Model
modelAfterSwappingDiscs coordinates model =
    case lastFilledTile model.occupiedTiles of
        Just tile ->
            coordinates tile.position model.boardSpecs
                |> swappableTilesOnPositionWithDisc model.occupiedTiles tile.disc
                |> tilesAfterSwapping model.occupiedTiles
                |> modelAfterReplacingTiles model

        Nothing ->
            model


modelAfterAddingTile : Model -> OccupiedTile -> Model
modelAfterAddingTile model tile =
    { model | occupiedTiles = model.occupiedTiles ++ [ tile ] }


modelAfterReplacingTiles : Model -> List OccupiedTile -> Model
modelAfterReplacingTiles model tiles =
    { model | occupiedTiles = tiles }
