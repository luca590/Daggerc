module DaggerLanguageDefinition where

data Contract = Transfer { tokenAddress_ :: Address,
                           from_         :: Address,
                           to_           :: Address
                         }
              | Scale { maxFactor_   :: Integer,
                        scaleFactor_ :: Expression,
                        contract_    :: Contract
                      }
              | Both { contractA_ :: Contract,
                       contractB_ :: Contract
                     }
              | Translate {
                  delay_ :: Time,
                  contract_ :: Contract
                  }
              | IfWithin {
                  memExp_ :: MemExp,
                  contractA_ :: Contract,
                  contractB_ :: Contract
                  } deriving (Show, Eq)

-- DEVFIX: The value of time units should be natural numbers, not integers
-- Cf. Benjamin Egelund et al.
data Time = Now
          | Seconds Integer
          | Minutes Integer
          | Hours Integer
          | Days Integer
          | Weeks Integer deriving (Show, Eq)

-- This should also have an identifier in the intermediate expression version
data MemExp = MemExp Time Expression deriving (Show, Eq)

data Expression = Lit Literal
                | MultExp Expression Expression
                | SubtExp Expression Expression
                | AddiExp Expression Expression
                | DiviExp Expression Expression
                | LtExp Expression Expression
                | GtExp Expression Expression
                | EqExp Expression Expression
                | GtOrEqExp Expression Expression
                | LtOrEqExp Expression Expression
                | OrExp Expression Expression
                | AndExp Expression Expression
                | MinExp Expression Expression
                | MaxExp Expression Expression
                | NotExp Expression
                | IfExp Expression Expression Expression
                deriving (Show, Eq)

data Literal = IntVal Integer
             | BoolVal Bool
             | Observable ObservableType Address String deriving (Show, Eq)

data ObservableType = OBool | OInteger deriving (Show, Eq)

type TokenSymbol = String
-- DEVFIX: Better choice for type is decided later.
type Address = String
