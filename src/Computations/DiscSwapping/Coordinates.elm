module Computations.DiscSwapping.Coordinates exposing (coordinates)

import List exposing (map, reverse)
import Models.Position exposing (Position, setYX, setXY)
import Models.BoardSpecs exposing (BoardSpecs)
import Computations.DiscSwapping.Position exposing (diagonalPositions)


coordinates : Position -> BoardSpecs -> List (List Position)
coordinates position boardSpecs =
    [ rightCoordinates position boardSpecs
    , bottomCoordinates position boardSpecs
    , leftCoordinates position
    , topCoordinates position
    , topLeftDiagonalCoordinates position
    , bottomLeftDiagonalCoordinates position boardSpecs
    , topRightDiagonalCoordinates position boardSpecs
    , bottomRightDiagonalCoordinates position boardSpecs
    ]


rightCoordinates : Position -> BoardSpecs -> List Position
rightCoordinates position boardSpecs =
    map (setYX position.y) [position.x + 1..boardSpecs.columns]


leftCoordinates : Position -> List Position
leftCoordinates position =
    reverse (map (setYX position.y) [1..position.x - 1])


topCoordinates : Position -> List Position
topCoordinates position =
    reverse (map (setXY position.x) [1..position.y - 1])


bottomCoordinates : Position -> BoardSpecs -> List Position
bottomCoordinates position boardSpecs =
    map (setXY position.x) [position.y + 1..boardSpecs.rows]


topLeftDiagonalCoordinates : Position -> List Position
topLeftDiagonalCoordinates position =
    diagonalPositions position 1 1 nextTopLeftDiagonalCoordinate


bottomLeftDiagonalCoordinates : Position -> BoardSpecs -> List Position
bottomLeftDiagonalCoordinates position boardSpecs =
    diagonalPositions position 1 boardSpecs.rows nextBottomLeftDiagonalCoordinate


topRightDiagonalCoordinates : Position -> BoardSpecs -> List Position
topRightDiagonalCoordinates position boardSpecs =
    diagonalPositions position boardSpecs.columns 1 nextTopRightDiagonalCoordinate


bottomRightDiagonalCoordinates : Position -> BoardSpecs -> List Position
bottomRightDiagonalCoordinates position boardSpecs =
    diagonalPositions position boardSpecs.columns boardSpecs.rows nextBottomRightDiagonalCoordinate


nextTopLeftDiagonalCoordinate : Position -> Position
nextTopLeftDiagonalCoordinate position =
    setXY (position.x - 1) (position.y - 1)


nextBottomLeftDiagonalCoordinate : Position -> Position
nextBottomLeftDiagonalCoordinate position =
    setXY (position.x - 1) (position.y + 1)


nextTopRightDiagonalCoordinate : Position -> Position
nextTopRightDiagonalCoordinate position =
    setXY (position.x + 1) (position.y - 1)


nextBottomRightDiagonalCoordinate : Position -> Position
nextBottomRightDiagonalCoordinate position =
    setXY (position.x + 1) (position.y + 1)
