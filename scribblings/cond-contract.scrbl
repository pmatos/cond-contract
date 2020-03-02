#lang scribble/manual
@require[@for-label[cond-contract
                    racket/base]]

@title{cond-contract}
@author{Paulo Matos}

@defmodule[cond-contract]

The @racket[cond-contract] module provides a simple way to optionally disable contracts.

Contracts are opt-out and controlled via the environment variable @tt[NOCONTRACTS].
