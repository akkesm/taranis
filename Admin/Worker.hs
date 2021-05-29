module Admin.Worker where

import IHP.Prelude
import Web.Types
import Generated.Types
import IHP.Job.Runner
import IHP.Job.Types

import Admin.Job.MakeList

instance Worker WebApplication where
    workers _ =
        [ worker @MakeListJob
        -- Generator Marker
        ]
