# -*- coding: utf-8 -*-

__author__ = "chairsma"

from robot.api import TestSuite

suite = TestSuite('Activate Skynet')
suite.resource.imports.library('OperatingSystem')
test = suite.tests.create('Should Activate Skynet', tags=['smoke'])
test.keywords.create('Set Environment Variable', args=['SKYNET', 'activated'], type='setup')
test.keywords.create('Environment Variable Should Be Set', args=['SKYNET'])

outfile = 'out.xml'
reportfile = 'report.html'
result = suite.run(critical='smoke', output=outfile)

assert result.return_code == 0
assert result.suite.name == 'Activate Skynet'
test = result.suite.tests[0]
assert test.name == 'Should Activate Skynet'
assert test.passed and test.critical
stats = result.suite.statistics
assert stats.critical.total == 1 and stats.critical.failed == 0

from robot.api import ResultWriter

# Report and xUnit files can be generated based on the result object.
ResultWriter(result).write_results(report=reportfile, log=None)
# Generating log files requires processing the earlier generated output XML.
ResultWriter(outfile).write_results()