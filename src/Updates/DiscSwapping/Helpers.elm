module Updates.DiscSwapping.Helpers exposing (modelAfterSwappingDiscsOnPosition)

import List exposing (map, member)
import List.Extra exposing (find, takeWhile)
import Model exposing (Model)
import Models.Disc exposing (Disc)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position)
import Extensions.List exposing (maybeListToListUntil)
import Updates.Common.Model exposing (modelAfterReplacingTiles)
import Computations.Disc exposing (opponentDisc)


modelAfterSwappingDiscsOnPosition : Model -> OccupiedTile -> List Position -> Model
modelAfterSwappingDiscsOnPosition model tile positions =
    occupiedTilesInTheseCoordinates model.occupiedTiles positions
        |> tilesWithDiscsToSwap tile.disc
        |> tilesAfterSwapping model.occupiedTiles
        |> modelAfterReplacingTiles model


tilesAfterSwapping : List OccupiedTile -> List OccupiedTile -> List OccupiedTile
tilesAfterSwapping tiles swapableTiles =
    map (discAfterSwapping swapableTiles) tiles


discAfterSwapping : List OccupiedTile -> OccupiedTile -> OccupiedTile
discAfterSwapping tiles tile =
    if member tile tiles then
        { tile | disc = opponentDisc tile.disc }
    else
        tile


tilesWithDiscsToSwap : Disc -> List OccupiedTile -> List OccupiedTile
tilesWithDiscsToSwap disc tiles =
    takeWhile (hasDifferentDiscs disc) tiles


hasDifferentDiscs : Disc -> OccupiedTile -> Bool
hasDifferentDiscs disc tile =
    disc /= tile.disc


occupiedTilesInTheseCoordinates : List OccupiedTile -> List Position -> List OccupiedTile
occupiedTilesInTheseCoordinates occupiedTiles coordinates =
    map (ifOccupied occupiedTiles) coordinates
        |> maybeListToListUntil


ifOccupied : List OccupiedTile -> Position -> Maybe OccupiedTile
ifOccupied occupiedTiles position =
    find (isSameCoordinates position) occupiedTiles


isSameCoordinates : Position -> OccupiedTile -> Bool
isSameCoordinates position tile =
    position.x == tile.position.x && position.y == tile.position.y
