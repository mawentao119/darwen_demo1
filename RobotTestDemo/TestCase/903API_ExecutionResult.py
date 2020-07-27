# -*- coding: utf-8 -*-

__author__ = "chairsma"

import os

from robot.api import TestSuiteBuilder, ExecutionResult, TestData

def record_result(xmlfile):
    res = ExecutionResult(xmlfile)
    s = res.suite
    dealwith_source(s)

## 如果source是robot文件，则tests中为测试用例信息
## 如果source是目录，则suites中存储子suite
def dealwith_source(s):
    source = s.source
    print("Deal with Source:"+source)
    if os.path.isfile(s.source):
        for t in s.tests._items:
            print("  ** Casename:{} elapsedtime:{} status:{}".format(t.name,t.elapsedtime,t.status))
    else:
        for t in s.suites._items:
            dealwith_source(t)

input = ".beats/workspace/Admin/Demo_Project/RobotTestDemo/TestCase/903dir1"
output = ".beats/workspace/Admin/Demo_Project/runtime/output.xml"
suite = TestSuiteBuilder().build(input)
result = suite.run(output=output)

record_result(output)

## TestData 遍历suite中的cases
def print_suite(suite):
    print('Suite:'+suite.name+" Suite.source:"+suite.source)
    for test in suite.testcase_table:
        print ('-'+test.name)
    for child in suite.children:
        print_suite(child)
## TestData 遍历目录后文件下的用例
suite = TestData(source=".beats/workspace/Admin/Demo_Project/RobotTestDemo/TestCase/903dir1")
print_suite(suite)
