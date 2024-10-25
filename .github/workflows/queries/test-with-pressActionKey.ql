/**
 * @description Find test functions that directly call 'pressActionKey'
 * @kind problem
 * @id javascript/test-with-pressActionKey
 * @problem.severity recommendation
 */

import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
    exists(CallExpr describe, CallExpr it |
      describe.getCalleeName() = "describe" and
      it.getCalleeName() = "it" and
      it.getParent*() = describe and
      test = it.getArgument(1)
    )
  }
  
  /**
   * Holds if a function calls 'pressActionKey'.
   */
  predicate callsPressActionKey(Function caller) {
    exists(CallExpr call |  // Changed from FunctionCall to CallExpr
      call.getEnclosingFunction() = caller and
      call.getCalleeName() = "pressActionKey"
    )
  }
  
  // Main query to find tests that call pressActionKey
  from Function test
  where isTest(test) and callsPressActionKey(test)
  select test, "This test function calls 'pressActionKey'."