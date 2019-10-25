

        >>= passes the result of the expression on the left as an argument to the expression on the right, in a way that respects the context the argument and function use

        >> is used to order the evaluation of expressions within some context; it makes evaluation of the right depend on the evaluation of the left

Neither of these are the full or completely accurate story, but if you're just trying to get the gist of what a Haskell program is doing, these should be sufficient.





In Haskell, both >>= and >> are functions from the Monad class. This means they're overloaded differently for every monad. Read "You Could Have Invented Monads! (And Maybe You Already Have.)" for a very good introduction. I'll just give a quick overview below:

        >>= is like Scala's flatMap. It takes a function, maps it over an instance of a monad and then flattens the result. For this to work, the function has to return an instance of the monad itself! The type looks like this:
```
    (>>=) :: m a -> (a -> m b) -> m b
```
You start with an m a, apply the a -> m b function to it to get a m (m b) (this is the map part) and then you flatten the m (m b) into an m b (this is the flat part).

For the list monad, this is just concatMap. Take a look at the types with m replaced by []:
```
    (>>=)     :: [a] -> (a -> [b]) -> [b]
    concatMap :: (a -> [b]) -> [a] -> [b]
```
Also note how concatMap can be rewritten using concat and map. As a quick example, here's how we can produce a list with each number replaced by its predecessor and its successor:
```
    [1,2,3,4] >>= \ x -> [x - 1, x + 1]
    [0,2,1,3,2,4,3,5]
```
The exact action that "flattening" represents for different monads varies. For lists, it combines all the results into a single list. For Maybe, it returns Nothing if either layer is Nothing and Just the result otherwise. In general, it's a handy way to apply functions to monads with fine-grained control over the result.

The >> is just a hand specialized version of >>=. It's equivalent to using >>= with a "constant function"--a function that ignores its argument and always returns the same value. So a >> b is always the same as a >>= \ _ -> b. For lists, this is like replacing every element in the list with n constant elements:
```
    [1,2,3,4] >>= \ x -> [1, 2]
    [1,2,1,2,1,2,1,2]
```
In a sense, both of these operators do combine two lines of code into one. More generally, they let you "compose" instances of monads like list and Maybe. Haskell do-notation--which looks like multiple lines of code--actually desugars to using a bunch of >>= and >>.
