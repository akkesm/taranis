#!/usr/bin/env run-script

module Application.Script.MakeList where

import Application.Script.Prelude

run :: Script
run = do
    newRecord @MakeListJob |> create
    pure ()
