//SPDX-LICENSE-Identifier: MIT

pragma solidity ^0.8.13;

contract Error {
    function testrequired(uint _i) public pure {
        //require should be used to variable condition such as;
        // -input
        // -condition before execution
        // - return value from calls to othr function
        require(_i > 10, "input must be grater than 10");
    }

    function testrevert(uint) public pure {
        //revert is usefule when the conditon to chek is complete
        // this code does the exat same thing as the example above
        if (_i <= 10) {
            revert("input must be grater than 10");
        }
    }

    uint public  num;

    function testassert() public view {
        //assert shuld only be used bto test for  internal erroer
        // and to chek invariants

        // here we assert that num is always equal to 0
        // since it is impossible to update the value of num 
        assert(num == 1);
    }

    // coustom errrors 
    error insufficentbalance(uint balance, uint withdrawnamount);

    function testcostomerrror(uint _withdrawnamount) public  view {
        uint bal = 100000;
        if (bal < _withdrawnamount) {
            revert insufficentbalance({balance: bal, withdrawnamount: _withdrawnamount});
        }
    }
}