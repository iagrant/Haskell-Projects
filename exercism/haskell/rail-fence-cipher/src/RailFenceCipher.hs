module RailFenceCipher (encode, decode) where
import Data.Char
import Data.List
import Data.Ord

--Rail Fence Cipher program written in haskell
--Author: Ian Grant
--
--Rail Fence takes a message and a number of rails
--then maps the message along a imaginary fence with that # of rails
--then reading across it gets they crpto text
--
--in code it'll need to divide the message up into diffrent lists
--then cat all the lists together for the output
--it'll need to keep track of it's location in the message to know
--wether or not to go up or down the fence
--
----------------2nd Iteration--------------------------
--
--makes rail fence pattern
fence rails = cycle ([0..rails-2] ++ [rails-1,rails-2..1])
--helper function to elimate repeating code
helper x = map fst $ sortBy (comparing snd) x
--encodes the given string with the given # of rails
encode :: Int -> String -> String
encode rails mess = helper $ zip (map toUpper $ filter isLetter mess) (fence rails)
--helps decode the message
decodeHelper cryptoLength rails = helper $ zip [0..cryptoLength-1] $ fence rails
--decodes the given crypto text with the given # of rails
decode :: Int -> String -> String
decode rails mess = helper $ zip mess (decodeHelper (length mess) rails)

