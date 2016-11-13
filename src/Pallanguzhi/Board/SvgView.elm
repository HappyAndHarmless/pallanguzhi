module Pallanguzhi.Board.SvgView exposing (..)

import Html
import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes as S
import Svg.Events exposing (..)

import Util.Diagram as D

import List

view : (Int -> a) -> Html a
view f = 
  let 
    row = 
      List.repeat 6 (pit f) |> D.hfold 5
    store' =
      store (D.width row) 42
    diagram =
      D.vfold 5 [store', row, row, store']
      |> D.draw 10 10 
  in 
    svg 
     [ S.version "1.1", S.x "0", S.y "0", S.viewBox "0 0 250 100" 
     ] diagram
    
pit : (Int -> a) -> D.Diagram a
pit f =
  let 
    radius = 12
    color  = "#60B5CC"
  in
    D.circle [S.fill color, onClick (f 3)] radius

store : Int -> Int -> D.Diagram a
store w seeds =
  let 
    h = 12
  in 
    D.rect [S.fill "#44ee55"] w h 