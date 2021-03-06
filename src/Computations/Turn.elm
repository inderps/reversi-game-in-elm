module Computations.Turn exposing (canDiscBePlaced, canNextTurnBePlayed, highestPlacedDisc)

import List exposing (append, isEmpty, length, filter, any)
import Model exposing (Model)
import Models.Position exposing (Position)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.BoardSpecs exposing (BoardSpecs)
import Models.Disc exposing (Disc(..))
import Computations.Board exposing (unOccupiedPositions)
import Computations.Disc exposing (totalNoOfDiscs)
import Computations.DiscSwapping.OccupiedTile exposing (swappableTilesOnPositionForNextDisc)
import Computations.DiscSwapping.Coordinates exposing (coordinates)


canNextTurnBePlayed : Model -> Bool
canNextTurnBePlayed model =
    any (canDiscBePlaced model) (unOccupiedPositions model)


highestPlacedDisc : Model -> Maybe Disc
highestPlacedDisc model =
    if
        totalNoOfDiscs model.occupiedTiles Orange
            == totalNoOfDiscs model.occupiedTiles Green
    then
        Nothing
    else if
        totalNoOfDiscs model.occupiedTiles Orange
            > totalNoOfDiscs model.occupiedTiles Green
    then
        Just Orange
    else
        Just Green


canDiscBePlaced : Model -> Position -> Bool
canDiscBePlaced model position =
    anySwappableDiscs model position


anySwappableDiscs : Model -> Position -> Bool
anySwappableDiscs model position =
    not (isEmpty (swappableDiscs model position))


swappableDiscs : Model -> Position -> List OccupiedTile
swappableDiscs model position =
    swappableDiscsForCoordinates coordinates model position


swappableDiscsForCoordinates :
    (Position -> BoardSpecs -> List (List Position))
    -> Model
    -> Position
    -> List OccupiedTile
swappableDiscsForCoordinates coordinates model position =
    coordinates position model.boardSpecs
        |> swappableTilesOnPositionForNextDisc model.occupiedTiles
