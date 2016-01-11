import Test.Hspec
import Test.QuickCheck
import Test.QuickCheck.Function
-- import Data.Function.Compose.LeftToRight
import ComposeLTR
import Prelude hiding ((<$))

prop1 f g = (f $ g) == (g $> f)
prop2 f g = ((g . f) 1) == (1 $> (f .> g))

main = hspec $ do
  describe "compose-ltr" $ do

    describe "$>" $ do
      it "should compose" $ do

        (1 $> (+2) $> (*2)) `shouldBe` 6

        "Hello World"
          $> reverse
          $> ("!" ++)
          $> take <$ 1 + 5
          $> (`shouldBe` "!dlroW")

        let
          fn = id
            .> reverse
            .> ("!" ++)
            .> (take <$ 1 + 5)

        (fn "Hello World") `shouldBe` "!dlroW"

      it "should work just like the Prelude version" $ do
        let
          prop :: (Fun Int Int) -> Int -> Bool
          prop (Fun _ f) g = prop1 f g
        property prop

    describe ".>" $ do
      it "should work just like the Prelude version" $ do
        let
          prop :: (Fun Int Int) -> (Fun Int Int) -> Bool
          prop (Fun _ f) (Fun _ g) = prop2 f g
        property prop
