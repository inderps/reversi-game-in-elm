module Computations.Board exposing (unOccupiedPositions)

import List exposing (map, concat, filter, any)
import Model exposing (Model)
import Models.Position exposing (Position, setXY)
import Computations.DiscSwapping.Position exposing (isSameCoordinates)


unOccupiedPositions : Model -> List Position
unOccupiedPositions model =
    filter (isUnoccupied model) (allPositions model)


allPositions : Model -> List Position
allPositions model =
    concat (map (coumnsForEachRow model) (rows model))


coumnsForEachRow : Model -> Int -> List Position
coumnsForEachRow model row =
    map (setXY row) (columns model)


rows : Model -> List Int
rows model =
    [1..model.boardSpecs.rows]


columns : Model -> List Int
columns model =
    [1..model.boardSpecs.columns]


isUnoccupied : Model -> Position -> Bool
isUnoccupied model position =
    not (any (isSameCoordinates position) model.occupiedTiles)
