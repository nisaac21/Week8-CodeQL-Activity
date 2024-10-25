/**
 * @description Find functions longer than 10 lines
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */

 import javascript

 /**
  * Holds if a function is longer than 10 lines.
  */
 predicate isLongMethod(Function func) {
     func.getNumberOfLines() > 10
 }
 
 from Function func
 where isLongMethod(func)
 select func, "This function is longer than 10 lines."
 