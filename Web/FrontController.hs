module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Comparisons

instance FrontController WebApplication where
    controllers = 
        [ startPage NewComparisonAction { vote = Nothing }
        -- Generator Marker
        , parseRoute @ComparisonsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
