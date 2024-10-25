/**
 * @description Find functions directly called by tests
 * @kind problem
 * @id javascript/functions-directly-called-by-tests
 * @problem.severity recommendation
 */

import javascript


predicate isLongMethod(Function func) {
    func.getNumberOfLines() > 10
}



from Function func
where isLongMethod(func)
select func, "is longer that 10 lines"