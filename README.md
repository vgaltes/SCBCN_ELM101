# SCBCN_ELM101
Introductory workshop to start learning Elm

## Defining a basic view
 - Create a file named main.elm in the src folder
 - Define a module called Test
    
    ``` 
    module Test exposing (..)
    ```
 - Import the Html module (only with div, txt and h1)
    
    ```
    import Html exposing (div, text, h1, button)
    ```
 - Create a simple view function that renders a text in a h1 inside a div.
    
    ```
    view model =
        div[][
            h1[][text model]
        ]
    ```
 - Create a main function that calls view
    
    ```
    main =
        view "Hello Barcelona!"
    ```

## Using a model
 - Create a type alias called Model with a name (String) and a counter (Int)

    ```
    type alias Model =
    { name : String
    , counter : Int
    }
    ```
 - Create a value called initialModel with some data

    ```
    initialModel = {name = "ELM 101", counter = 3}
    ```
 - Use the model to render the view

    ```
    view model =
    div [][
        h1 [][text model.name]
        , div [][text (toString model.counter)]
    ]
    ```

 - Pass initialModel as a parameter to the view function in main

    ```
    main =
        view initialModel
    ```
