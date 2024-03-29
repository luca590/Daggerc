module EvmLanguageDefinition where

import Data.Word

type Word256 = (Word32, Word32, Word32, Word32, Word32, Word32, Word32, Word32)

type Label = String

data EvmOpcode = STOP
               | ADD
               | MUL
               | SUB
               | DIV
               | SDIV
               | MOD
               | SMOD
               | ADDMOD
               | MULMOD
               | EXP
               | SIGNEXTEND
               | EVM_LT
               | EVM_GT
               | SLT
               | SGT
               | EVM_EQ
               | ISZERO
               | AND
               | OR
               | XOR
               | NOT
               | BYTE
               | SHA3
               | ADDRESS
               | BALANCE
               | ORIGIN
               | CALLER
               | CALLVALUE
               | CALLDATALOAD
               | CALLDATASIZE
               | CALLDATACOPY
               | CODESIZE
               | CODECOPY
               | GASPRICE
               | EXTCODESIZE
               | EXTCODECOPY
               | BLOCKHASH
               | COINBASE
               | TIMESTAMP
               | NUMBER
               | DIFFICULTY
               | GASLIMIT
               | POP
               | MLOAD
               | MSTORE
               | MSTORES
               | SLOAD
               | SSTORE
               | JUMP
               | JUMPI
               | JUMPTO Label -- pseudo instruction: PUSH Addr(label); JUMP;
               | JUMPITO Label -- pseudo instruction: PUSH Addr(label); JUMPI;
               | JUMPTOA Integer --
               | JUMPITOA Integer --
               | PC
               | MSIZE
               | GAS
               | JUMPDEST
               | JUMPDESTFROM Label
               | PUSH1 Word8
               | PUSH4 Word32
               | PUSH32 Word256
               | DUP1
               | DUP2
               | DUP3
               | SWAP1
               | SWAP2
               | SWAP3
               | LOG0
               | CREATE
               | CALL
               | CALLCODE
               | RETURN
               | DELEGATECALL
               | SELFDESTRUCT
               | THROW deriving (Eq, Show)
