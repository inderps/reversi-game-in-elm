module Computations.DiscSwapping.Horizontal exposing (modelAfterSwappingDiscsHorizontally)

import Model exposing (Model)
import Computations.DiscSwapping.Left exposing (modelAfterSwappingDiscsOnLeft)
import Computations.DiscSwapping.Right exposing (modelAfterSwappingDiscsOnRight)


modelAfterSwappingDiscsHorizontally : Model -> Model
modelAfterSwappingDiscsHorizontally =
    modelAfterSwappingDiscsOnRight << modelAfterSwappingDiscsOnLeft
