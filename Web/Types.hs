module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)
data StaticController = WelcomeAction deriving (Eq, Show, Data)
data ComparisonsController
    = ComparisonsAction
    | NewComparisonAction { vote :: Maybe Int }
    | CreateComparisonAction
    | WinnerNoneComparisonAction
    deriving (Eq, Show, Data)
