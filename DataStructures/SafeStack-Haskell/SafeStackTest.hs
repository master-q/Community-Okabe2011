module Main (main) where
import Test.HUnit
import qualified SafeStack as S

e1, e2, e3 :: Int
(e1, e2, e3) = (1, 2, 3)
s0, s1, s2, s3 :: S.SimpleSafeStack Int
s0 = S.empty
s1 = e1 `S.cons` s0
s2 = e2 `S.cons` s1
s3 = e3 `S.cons` s2

testEmpty :: Test
testEmpty = let r = S.isEmpty s0
            in  TestCase $ assertBool "isEmpty of empty failed" r

testNotEmpty :: Test
testNotEmpty = let r = (not . or . map S.isEmpty) [s1, s2, s3]
               in  TestCase $ assertBool "isEmpty of non-empty failed" r

testBadHead :: Test
testBadHead = let r = S.head s0 == Nothing
              in  TestCase $ assertBool "head of empty: must be magic" r

testHead :: Test
testHead = let r = (and . zipWith (==) (map Just [e1, e2, e3]) . map S.head)
                   [s1, s2, s3]
           in  TestCase $ assertBool "head failed" r

testBadTail :: Test
testBadTail = let r = S.tail s0 == Nothing
              in  TestCase $ assertBool "tail of empty: must be magic" r

testTail :: Test
testTail = let r = (and . zipWith (==) (map Just [s0, s1, s2]) . map S.tail)
                   [s1, s2, s3]
           in  TestCase $ assertBool "tail failed" r

tests :: Test
tests = TestList [TestLabel "testEmpty" testEmpty,
                  TestLabel "testNotEmpty" testNotEmpty,
                  TestLabel "testBadHead" testBadHead,
                  TestLabel "testHead" testHead,
                  TestLabel "testBadTail" testBadTail,
                  TestLabel "testTail" testTail]

main :: IO Counts
main = runTestTT tests
