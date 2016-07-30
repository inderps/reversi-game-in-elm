module Computations.DiscSwapping.Vertical exposing (modelAfterSwappingDiscsVertically)

import Model exposing (Model)
import Computations.DiscSwapping.Top exposing (modelAfterSwappingDiscsOnTop)


modelAfterSwappingDiscsVertically : Model -> Model
modelAfterSwappingDiscsVertically =
    modelAfterSwappingDiscsOnTop
