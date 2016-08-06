module Computations.DiscSwapping.Position
    exposing
        ( occupiedTilesInTheseCoordinatesList
        , isSameCoordinates
        , diagonalPositions
        )

import List exposing (map, member)
import List.Extra exposing (find, takeWhile, last)
import Models.OccupiedTile exposing (OccupiedTile)
import Models.Position exposing (Position, setXY)
import Models.BoardSpecs exposing (BoardSpecs)
import Extensions.List exposing (maybeListToListUntil)


occupiedTilesInTheseCoordinatesList : List OccupiedTile -> List (List Position) -> List (List OccupiedTile)
occupiedTilesInTheseCoordinatesList occupiedTiles coordinatesList =
    map (occupiedTilesInTheseCoordinates occupiedTiles) coordinatesList


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


diagonalPositions : Position -> Int -> Int -> (Position -> Position) -> List Position
diagonalPositions position x y nextPosition =
    if position.x == x || position.y == y then
        []
    else
        diagonalPositions' x y nextPosition [ nextPosition position ]


diagonalPositions' : Int -> Int -> (Position -> Position) -> List Position -> List Position
diagonalPositions' x y nextPosition positions =
    case (last positions) of
        Just position ->
            if position.x == x || position.y == y then
                positions
            else
                appendedPositionsUsing nextPosition positions
                    |> diagonalPositions' x y nextPosition

        Nothing ->
            positions


appendedPositionsUsing : (Position -> Position) -> List Position -> List Position
appendedPositionsUsing nextPosition positions =
    case (last positions) of
        Just position ->
            positions ++ [ nextPosition position ]

        Nothing ->
            positions
