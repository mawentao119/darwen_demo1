# -*- coding: utf-8 -*-

__author__ = "chairsma"

import sys
import os
from robot.api import TestData

def print_suite(suite):
    print('Suite:'+suite.name)
    for test in suite.testcase_table:
        print ('-'+test.name)
    for child in suite.children:
        print_suite(child)

## TestData 遍历目录和文件下的用例
suite = TestData(source="./901data.robot")
print_suite(suite)
#print(os.getcwd())

## TestData- 可以修改用例并重写用例文件
import copy
testcase = copy.deepcopy(suite.testcase_table.tests[0])
testcase.name=testcase.name + " deepcopy"
suite.testcase_table.tests.append(testcase)
suite.save(txt_separating_spaces=2)  

print("TestCaseFile: 901data.robot is modified.")
print_suite(suite)