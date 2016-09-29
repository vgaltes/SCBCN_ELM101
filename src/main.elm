module Test exposing (..)

import Html exposing (div, text, h1, button)
import Html.Events exposing (..)
import Html.App exposing (..)
import Random

type alias Model =
    { name : String
    , counter : Int
    }

type Action 
    = Up
    | Down
    | GetRandom
    | Update Int
    
initialModel = {name = "ELM 101", counter = 3}
    
randomNumber =
    Random.int 0 100

view model =
    div [][
        h1 [][text model.name]
        , div [][text (toString model.counter)]
        , button [onClick Up][text "UP"]
        , button [onClick Down][text "DOWN"] 
        , button [onClick GetRandom][text "RANDOM"] 
    ]

update msg model =
    case msg of
        Up -> ({model | counter = model.counter + 1}, Cmd.none)
        Down -> ({model | counter = model.counter - 1}, Cmd.none)
        GetRandom -> (model, Random.generate Update randomNumber)
        Update x -> ({model | counter = x}, Cmd.none)

main =
    Html.App.program
    {
        init = (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = (\model -> Sub.none)
    }