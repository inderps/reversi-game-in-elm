module Computations.DiscSwapping.Coordinates exposing (coordinates)

import List exposing (map, reverse)
import Models.Position exposing (Position, setYX, setXY)
import Models.BoardSpecs exposing (BoardSpecs)


coordinates : Position -> BoardSpecs -> List (List Position)
coordinates position boardSpecs =
    [ rightCoordinates position boardSpecs
    , bottomCoordinates position boardSpecs
    , leftCoordinates position
    , topCoordinates position
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
