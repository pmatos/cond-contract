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

(require cond-contract
         (file "b.rkt"))

(provide/cond-contract #true
 [factorial (exact-positive-integer? . -> . exact-positive-integer?)])

;; ---------------------------------------------------------------------------------------------------

(define (factorial n)
  (cond
    [(factorial-get n) => (lambda (x) x)]
    [(> n 1)
     (define v (* n (factorial (- n 1))))
     (factorial-put! n v)
     v]
    [else 1]))


(module+ main
  (factorial 512))
