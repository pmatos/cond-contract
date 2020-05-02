#lang racket/base
;; ---------------------------------------------------------------------------------------------------

;; Copyright 2020 Paulo Matos

;;  Licensed under the Apache License, Version 2.0 (the "License");
;;  you may not use this file except in compliance with the License.
;;  You may obtain a copy of the License at

;;      http://www.apache.org/licenses/LICENSE-2.0

;;  Unless required by applicable law or agreed to in writing, software
;;  distributed under the License is distributed on an "AS IS" BASIS,
;;  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;  See the License for the specific language governing permissions and
;;  limitations under the License.

;; ---------------------------------------------------------------------------------------------------

(require cond-contract)

(provide/cond-contract
 [factorial-get (exact-positive-integer? . -> . (or/c #false exact-positive-integer?))]
 [factorial-put! (exact-positive-integer? exact-positive-integer? . -> . void?)])

;; ---------------------------------------------------------------------------------------------------

(define cache (make-hasheq))

(define (factorial-get n)
  (hash-ref cache n #false))

(define (factorial-put! n v)
  (hash-set! cache n v))
